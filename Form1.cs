using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text.Json;
using System.Windows.Forms;
using AppSense.Aom;
using EMConsole;
using AppSense.Aom.BranchManagement;

namespace UWMConfigVersionSelector
{
    /* Script Name  : UWMConfigVersionSelector.exe
     * Description  : The UWM Config Version Selector is a program designed to read the Ivanti EM/AC Configuration.
     * Author       : Sebastian Flint
     * E-Mail       : sebastian.flint@sva.de
     * Redesign     : Modern Dark UI (2024)
     */
    public partial class Form1 : Form
    {
        // ── Win32 for borderless window dragging ─────────────────────────
        [DllImport("user32.dll")]
        private static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);
        [DllImport("user32.dll")]
        private static extern bool ReleaseCapture();
        private const int WM_NCLBUTTONDOWN = 0xA1;
        private const int HT_CAPTION = 0x2;

        // ── Windows 11 rounded corners ───────────────────────────────────
        private enum DwmWindowAttribute { DWMWA_WINDOW_CORNER_PREFERENCE = 33 }
        private enum DwmWindowCornerPreference { DWMWCP_ROUND = 2 }
        [DllImport("dwmapi.dll")]
        private static extern int DwmSetWindowAttribute(IntPtr hwnd, DwmWindowAttribute attr,
            ref int pvAttribute, int cbAttribute);

        // ── UI Colors ────────────────────────────────────────────────────
        private static readonly Color CAccent = ColorTranslator.FromHtml("#4f8cff");
        private static readonly Color CSuccess = ColorTranslator.FromHtml("#2dd98e");
        private static readonly Color CDim = ColorTranslator.FromHtml("#3d4460");
        private static readonly Color CMuted = ColorTranslator.FromHtml("#7a82a0");
        private static readonly Color CText = ColorTranslator.FromHtml("#e8ecf8");
        private static readonly Color CSurface2 = ColorTranslator.FromHtml("#1a1e29");

        // ── Original fields ──────────────────────────────────────────────
        public string ConfigPath;
        List<string> emversion = new List<string>();
        List<string> amversion = new List<string>();
        string extension;
        string appPath = Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);

        // ── UI state ─────────────────────────────────────────────────────
        private bool _statusDotOn = true;

        // ════════════════════════════════════════════════════════════════
        // CONSTRUCTOR
        // ════════════════════════════════════════════════════════════════

        public Form1()
        {
            InitializeComponent();

            // Rounded corners on Win11 (silently ignored on Win10)
            try
            {
                int pref = (int)DwmWindowCornerPreference.DWMWCP_ROUND;
                DwmSetWindowAttribute(Handle, DwmWindowAttribute.DWMWA_WINDOW_CORNER_PREFERENCE,
                    ref pref, sizeof(int));
            }
            catch { }

            // Paint dashed border on drop zone
            pnlDropZone.Paint += PnlDropZone_Paint;

            // Forward clicks from child labels to the panel so the whole
            // drop zone is clickable — labels swallow mouse events otherwise
            lblDropIcon.Click += new System.EventHandler(this.DropZone_Click);
            lblDropHint.Click += new System.EventHandler(this.DropZone_Click);
            lblDropSub.Click += new System.EventHandler(this.DropZone_Click);
            lblDropIcon.Cursor = System.Windows.Forms.Cursors.Hand;
            lblDropHint.Cursor = System.Windows.Forms.Cursors.Hand;
            lblDropSub.Cursor = System.Windows.Forms.Cursors.Hand;

            // ── Read console versions from disk (original logic) ──────────
            string[] EMVersionsInDir = Directory.GetDirectories(appPath + @"\EMConsoles\");
            string[] AMVersionsInDir = Directory.GetDirectories(appPath + @"\AMConsoles\");

            foreach (string version in AMVersionsInDir)
                amversion.Add(new DirectoryInfo(version).Name);

            foreach (string version in EMVersionsInDir)
                emversion.Add(new DirectoryInfo(version).Name);

            // Numeric version sort (original logic, unchanged)
            int CompareItems(string x, string y)
            {
                string[] xP = x.Split('.'), yP = y.Split('.');
                int x1 = int.Parse(xP[0]), x2 = int.Parse(xP[1]),
                    x3 = int.Parse(xP[2]), x4 = int.Parse(xP[3]);
                int y1 = int.Parse(yP[0]), y2 = int.Parse(yP[1]),
                    y3 = int.Parse(yP[2]), y4 = int.Parse(yP[3]);
                if (x1 != y1) return x1.CompareTo(y1);
                if (x2 != y2) return x2.CompareTo(y2);
                if (x3 != y3) return x3.CompareTo(y3);
                return x4.CompareTo(y4);
            }

            try
            {
                emversion.Sort(CompareItems);
                amversion.Sort(CompareItems);
            }
            catch { }

            foreach (string item in emversion) cmbEMVersions.Items.Add(item);
            foreach (string item in amversion) cmbAMVersion.Items.Add(item);

            cmbAMVersion.SelectedIndex = -1;
            cmbEMVersions.SelectedIndex = -1;

            // ── Command-line argument (original logic) ────────────────────
            string[] args = Environment.GetCommandLineArgs();
            if (args.Length >= 2)
            {
                ConfigPath = args[1];
                GetAAMPProperties(ConfigPath);
            }

            // ── Update check (original logic) ─────────────────────────────
            if (CheckInternetConnection())
                CheckForUpdates(false);

            SetStatus("Ready — no config loaded", isLoaded: false);
        }

        // ════════════════════════════════════════════════════════════════
        // BORDERLESS WINDOW — drag & window controls
        // ════════════════════════════════════════════════════════════════

        private void TitleBar_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                ReleaseCapture();
                SendMessage(Handle, WM_NCLBUTTONDOWN, HT_CAPTION, 0);
            }
        }

        private void BtnWinClose_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Close program?", "Close",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK) System.Windows.Forms.Application.Exit();
        }

        private void BtnWinMinimize_Click(object sender, EventArgs e)
            => WindowState = FormWindowState.Minimized;

        // ════════════════════════════════════════════════════════════════
        // MENU OPTIONS BUTTON
        // ════════════════════════════════════════════════════════════════

        private void BtnMenuOptions_Click(object sender, EventArgs e)
            => ctxOptions.Show(btnMenuOptions, new Point(0, btnMenuOptions.Height));

        // ════════════════════════════════════════════════════════════════
        // DROP ZONE — dashed border paint
        // ════════════════════════════════════════════════════════════════

        private void PnlDropZone_Paint(object sender, PaintEventArgs e)
        {
            bool loaded = !string.IsNullOrEmpty(ConfigPath);
            using (Pen pen = new Pen(loaded ? CSuccess : CDim, 1.5f))
            {
                pen.DashStyle = System.Drawing.Drawing2D.DashStyle.Dash;
                e.Graphics.DrawRectangle(pen, 1, 1,
                    pnlDropZone.Width - 3, pnlDropZone.Height - 3);
            }
        }

        private void DropZone_Click(object sender, EventArgs e)
            => OpenFileBrowser();

        private void DropZone_DragOver(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
                e.Effect = DragDropEffects.Copy;
        }

        private void DropZone_DragDrop(object sender, DragEventArgs e)
        {
            string[] files = (string[])e.Data.GetData(DataFormats.FileDrop);
            if (files?.Length > 0) LoadFromPath(files[0]);
        }

        // ════════════════════════════════════════════════════════════════
        // FORM EVENTS
        // ════════════════════════════════════════════════════════════════

        private void Form1_Load(object sender, EventArgs e)
        {
            // ComboBoxen aus der Tab-Reihenfolge nehmen und Fokus
            // auf ein nicht-interaktives Panel setzen, damit keines
            // der Dropdowns beim Start blau markiert erscheint
            cmbAMVersion.TabStop = false;
            cmbEMVersions.TabStop = false;
            pnlHero.Focus();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e) { }

        private void Form1_DragOver(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
                e.Effect = DragDropEffects.Link;
            else
                e.Effect = DragDropEffects.None;
        }

        private void Form1_DragDrop(object sender, DragEventArgs e)
        {
            string[] files = e.Data.GetData(DataFormats.FileDrop) as string[];
            if (files != null && files.Any())
                LoadFromPath(files.First());
        }

        // ════════════════════════════════════════════════════════════════
        // LOAD CONFIG
        // ════════════════════════════════════════════════════════════════

        // "Load Configuration" primary button
        private void button2_Click(object sender, EventArgs e) => OpenFileBrowser();

        private void OpenFileBrowser()
        {
            openFileDialog1.Filter = "(*.aamp, *.aemp)|*.aamp;*.aemp|All files (*.*)|*.*";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
                LoadFromPath(openFileDialog1.FileName);
        }

        private void LoadFromPath(string path)
        {
            ConfigPath = path;
            try { GetAAMPProperties(ConfigPath); }
            catch { }
        }

        // ════════════════════════════════════════════════════════════════
        // GET AAMP PROPERTIES — original logic + new UI wiring
        // ════════════════════════════════════════════════════════════════

        public void GetAAMPProperties(string path)
        {
            // Re-enable all controls first
            cmbAMVersion.Enabled = true;
            cmbEMVersions.Enabled = true;
            btnOpenAamp.Enabled = true;
            btnOpenAemp.Enabled = true;
            cmbAMVersion.SelectedItem = null;
            cmbEMVersions.SelectedItem = null;

            extension = Path.GetExtension(path);

            // ── Original manifest reading ────────────────────────────────
            Common.Deployment.PackageManager manager = new Common.Deployment.PackageManager();
            manager.ReadManifest(path);

            string configname = manager.Manifest.ConfigName.ToString();
            string creatorversion = manager.Manifest.CreatorVersion.ToString();
            string marketingversion = manager.Manifest.MarketingVersion.ToString();
            string productname = manager.Manifest.ProductName.ToString();

            // ── Properties panel — colored key/value output ──────────────
            rtbProperties.Clear();
            AppendProp("config.path", path);
            AppendProp("config.name", configname);
            AppendProp("creator.version", creatorversion);
            AppendProp("version", marketingversion);
            AppendProp("product.name", productname);

            // ── Drop zone — show filename + success state ─────────────────
            string fileName = Path.GetFileName(path);
            lblDropHint.Text = fileName;
            lblDropSub.Text = "Config loaded successfully ✓";
            lblDropHint.ForeColor = CSuccess;
            lblDropSub.ForeColor = CSuccess;
            pnlDropZone.BackColor = Color.FromArgb(15, 45, 217, 142);
            pnlDropZone.Invalidate();

            // ── Status bar ───────────────────────────────────────────────
            SetStatus($"Config loaded: {fileName}", isLoaded: true);

            // ── Tray notification (original) ─────────────────────────────
            notifyIcon1.BalloonTipTitle = "Config Loaded.";
            notifyIcon1.BalloonTipText = "The Config was successfully loaded.";
            notifyIcon1.ShowBalloonTip(60000);

            // ── Enable only the matching console (original logic) ─────────
            if (extension == ".aamp")
            {
                cmbEMVersions.Enabled = false;
                btnOpenAemp.Enabled = false;
                cmbAMVersion.SelectedIndex = cmbAMVersion.FindStringExact(creatorversion);
            }
            else if (extension == ".aemp")
            {
                cmbAMVersion.Enabled = false;
                btnOpenAamp.Enabled = false;
                cmbEMVersions.SelectedIndex = cmbEMVersions.FindStringExact(creatorversion);
            }
        }

        // Colored key/value rendering into the RichTextBox
        private void AppendProp(string key, string value)
        {
            rtbProperties.SelectionColor = CAccent;
            rtbProperties.AppendText(key.PadRight(20));
            rtbProperties.SelectionColor = CText;
            rtbProperties.AppendText(value + "\n");
        }

        // ════════════════════════════════════════════════════════════════
        // UNLOAD CONFIG — original logic + UI reset
        // ════════════════════════════════════════════════════════════════

        private void btnUnloadConfig_Click(object sender, EventArgs e)
        {
            // Original logic
            rtbProperties.Clear();
            cmbAMVersion.Enabled = true;
            cmbEMVersions.Enabled = true;
            btnOpenAamp.Enabled = true;
            btnOpenAemp.Enabled = true;
            cmbAMVersion.SelectedItem = null;
            cmbEMVersions.SelectedItem = null;
            ConfigPath = "";

            // Reset drop zone
            lblDropHint.Text = "Drop config file or click to browse";
            lblDropSub.Text = "Supports: .aamp  •  .aemp";
            lblDropHint.ForeColor = CMuted;
            lblDropSub.ForeColor = CDim;
            pnlDropZone.BackColor = CSurface2;
            pnlDropZone.Invalidate();

            rtbProperties.ForeColor = CMuted;
            rtbProperties.Text = "(No configuration loaded)";

            SetStatus("Ready — no config loaded", isLoaded: false);
        }

        // ════════════════════════════════════════════════════════════════
        // OPEN CONSOLES — original logic, unchanged
        // ════════════════════════════════════════════════════════════════

        private void btnOpenAamp_Click(object sender, EventArgs e)
        {
            try
            {
                string fullPath = appPath + @"\AMConsoles\" + cmbAMVersion.Text;
                var startInfo = new ProcessStartInfo(fullPath + @"\AMConsole.exe")
                {
                    WindowStyle = ProcessWindowStyle.Normal
                };
                if (!string.IsNullOrEmpty(ConfigPath))
                    startInfo.Arguments = "\"" + ConfigPath + "\"";

                Process.Start(startInfo);
                SetStatus("Starting AM Console " + cmbAMVersion.Text, isLoaded: true);
            }
            catch
            {
                MessageBox.Show("Could not start AMConsole.exe", "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnOpenAemp_Click(object sender, EventArgs e)
        {
            try
            {
                string fullPath = appPath + @"\EMConsoles\" + cmbEMVersions.Text;
                var startInfo = new ProcessStartInfo(fullPath + @"\EMConsole.exe")
                {
                    WindowStyle = ProcessWindowStyle.Normal
                };
                if (!string.IsNullOrEmpty(ConfigPath))
                    startInfo.Arguments = "\"" + ConfigPath + "\"";

                Process.Start(startInfo);
                SetStatus("Starting EM Console " + cmbEMVersions.Text, isLoaded: true);
            }
            catch
            {
                MessageBox.Show("Could not start EMConsole.exe", "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // ════════════════════════════════════════════════════════════════
        // STATUS BAR + BLINKING DOT
        // ════════════════════════════════════════════════════════════════

        private void SetStatus(string text, bool isLoaded)
        {
            lblStatusText.Text = text;
            timer1.Stop();

            if (isLoaded)
            {
                picStatusDot.BackColor = CSuccess;
                timer1.Start();
            }
            else
            {
                picStatusDot.BackColor = CDim;
            }
        }

        private void Timer1_Tick(object sender, EventArgs e)
        {
            _statusDotOn = !_statusDotOn;
            picStatusDot.BackColor = _statusDotOn ? CSuccess : CDim;
        }

        // ════════════════════════════════════════════════════════════════
        // TRAY MENU — original logic, unchanged
        // ════════════════════════════════════════════════════════════════

        private void ToolStripAbout_Click(object sender, EventArgs e)
            => Process.Start("https://github.com/sebastianflint/AMConfigVersionSelector");

        private void testToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Close program?", "Close",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK) Close();
        }

        private void toolStripUpdate_Click(object sender, EventArgs e)
        {
            if (CheckInternetConnection())
                CheckForUpdates(true);
            else
                MessageBox.Show("No active internet connection. Please check again.",
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        // ════════════════════════════════════════════════════════════════
        // OPTIONS MENU — original logic, unchanged
        // ════════════════════════════════════════════════════════════════

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
            => Process.Start("https://forums.ivanti.com/s/article/Ivanti-Environment-Manager-Version-History-and-Support-Lifecycle");

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
            => Process.Start("https://forums.ivanti.com/s/article/Ivanti-UWM-Application-Control-Version-History-and-Support-Lifecycle");

        private void openAMConsolesToolStripMenuItem_Click(object sender, EventArgs e)
            => Process.Start(appPath + @"\AMConsoles");

        private void openEMConsolesToolStripMenuItem_Click(object sender, EventArgs e)
            => Process.Start(appPath + @"\EMConsoles");

        // ════════════════════════════════════════════════════════════════
        // UPDATE CHECK — original logic, unchanged
        // ════════════════════════════════════════════════════════════════

        static void CheckForUpdates(bool output)
        {
            try
            {
                string currentVersion = "V4.0";
                string latestVersion = GetLatestVersion("sebastianflint", "AMConfigVersionSelector");

                if (currentVersion != latestVersion)
                {
                    DialogResult result = MessageBox.Show(
                        "There is a new version available.\nDownload newer version?",
                        "New version available",
                        MessageBoxButtons.YesNo, MessageBoxIcon.Information);

                    if (result == DialogResult.Yes)
                        Process.Start("https://github.com/sebastianflint/AMConfigVersionSelector/releases/");
                }
                else if (output)
                {
                    MessageBox.Show("You are already using the newest version.",
                        "No new version available",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Update Check Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        public static bool CheckInternetConnection()
        {
            try
            {
                using (WebClient client = new WebClient())
                using (Stream stream = client.OpenRead("https://github.com/"))
                {
                    return true;
                }
            }
            catch { return false; }
        }

        static string GetLatestVersion(string username, string repository)
        {
            string url = string.Format("https://api.github.com/repos/{0}/{1}/releases/latest", username, repository);
            string json;
            using (WebClient client = new WebClient())
            {
                client.Headers.Add("User-Agent",
                    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko");
                json = client.DownloadString(url);
            }
            return JsonDocument.Parse(json)
                .RootElement.GetProperty("tag_name").GetString()
                .Replace("v", string.Empty);
        }

        // ════════════════════════════════════════════════════════════════
        // MISC STUBS — kept for event handler compatibility
        // ════════════════════════════════════════════════════════════════

        private void pictureBox1_Click(object sender, EventArgs e)
            => Process.Start("https://www.sva.de");

        private void lblOpenWithVersion_Click(object sender, EventArgs e) { }
        private void optionsToolStripMenuItem_Click(object sender, EventArgs e) { }
        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e) { }
        private void contextMenuStrip1_Opening(object sender, CancelEventArgs e) { }
        private void cmbEMVersions_MouseEnter(object sender, EventArgs e) { }
        private void cmbEMVersions_MouseHover(object sender, EventArgs e) { }
        private void cmbEMVersions_DropDown(object sender, EventArgs e) { }
        private void btnOpenAemp_MouseHover(object sender, EventArgs e) { }
    }
}