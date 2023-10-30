using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Diagnostics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AppSense.Aom;
using EMConsole;
using AppSense.Aom.BranchManagement;
using System.IO;
using System.Text.Json;
using System.Net;
using System.Net.NetworkInformation;
using Microsoft.Win32;

namespace UWMConfigVersionSelector
{

    /* Script Name  : UWMConfigVersionSelector.exe
     * Description  : The UWM Config Version Selector is a program designed to read the Ivanti EM/AC Configuration.
     * Author       : Sebastian Flint
     * E-Mail       : sebastian.flint@sva.de
     */
    public partial class Form1 : Form
    {
        public string ConfigPath;
        List<string> emversion = new List<string>();
        List<string> amversion = new List<string>();
        string extension;
        string appPath = Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);

        public Form1()
        {
  
            InitializeComponent();



            string[] args = Environment.GetCommandLineArgs();

      


            string[] EMVersionsInDir = Directory.GetDirectories(appPath + @"\EMConsoles\");
            string[] AMVersionsInDir = Directory.GetDirectories(appPath + @"\AMConsoles\");


            foreach (string version in AMVersionsInDir)
            {
                var dirName = new DirectoryInfo(version).Name;
                amversion.Add(dirName);
            }

            foreach (string version in EMVersionsInDir)
            {
                var dirName = new DirectoryInfo(version).Name;
                emversion.Add(dirName);
            }


            // Benutzerdefinierte Sortierfunktion
            int CompareItems(string x, string y)
            {
                // Zerlegen der Strings in ihre numerischen Bestandteile
                string[] xParts = x.Split('.');
                string[] yParts = y.Split('.');

                int x1 = int.Parse(xParts[0]);
                int x2 = int.Parse(xParts[1]);
                int x3 = int.Parse(xParts[2]);
                int x4 = int.Parse(xParts[3]);

                int y1 = int.Parse(yParts[0]);
                int y2 = int.Parse(yParts[1]);
                int y3 = int.Parse(yParts[2]);
                int y4 = int.Parse(yParts[3]);

                // Vergleich nach den numerischen Bestandteilen
                if (x1 != y1)
                {
                    return x1.CompareTo(y1);
                }
                else if (x2 != y2)
                {
                    return x2.CompareTo(y2);
                }
                else if (x3 != y3)
                {
                    return x3.CompareTo(y3);
                }
                else
                {
                    return x4.CompareTo(y4);
                }
            }

            // Sortieren der Datenquelle

            try
            {
                emversion.Sort(CompareItems);
                amversion.Sort(CompareItems);

            }
            catch
            {
                //MessageBox.Show("Error while reading console versions in directory. Please check format 1.x.x.x.","Error");
            }


            // Hinzufügen der sortierten Elemente zum Dropdown
            foreach (string item in emversion)
            {
                cmbEMVersions.Items.Add(item);
            }

            foreach (string item in amversion)
            {
                cmbAMVersion.Items.Add(item);
            }

            if (args.Length >= 2)
            {
                ConfigPath = args[1];
                GetAAMPProperties(ConfigPath);
            }

                if (CheckInternetConnection())
                {
                    CheckForUpdates(false);
                }


        }

        
        private void button2_Click(object sender, EventArgs e)
        {

            openFileDialog1.Filter = "(*.aamp, *.aemp)|*.aamp;*.aemp| All files (*.*)|*.*";
            openFileDialog1.ShowDialog();

             ConfigPath = openFileDialog1.FileName;

            try
            {
                GetAAMPProperties(ConfigPath);
            }
            catch
            {

            }
        }

        public void GetAAMPProperties(string path)

        {
            cmbAMVersion.Enabled = true;
            cmbEMVersions.Enabled = true;
            cmbAMVersion.SelectedItem = null;
            cmbEMVersions.SelectedItem = null;
            extension = Path.GetExtension(path);

            Common.Deployment.PackageManager manager = new Common.Deployment.PackageManager();

            manager.ReadManifest(path);
            string configname = manager.Manifest.ConfigName.ToString();
            string creatorversion = manager.Manifest.CreatorVersion.ToString();
            string marketingversion = manager.Manifest.MarketingVersion.ToString();
            string productname = manager.Manifest.ProductName.ToString();
           

            richTextBox1.Clear();
            richTextBox1.AppendText("Configpath: ");
            richTextBox1.AppendText(path);
            richTextBox1.AppendText("\n");
            richTextBox1.AppendText("Configname: ");
            richTextBox1.AppendText(configname);
            richTextBox1.AppendText("\n");
            richTextBox1.AppendText("Creator Version: ");
            richTextBox1.AppendText(creatorversion);
            richTextBox1.AppendText("\n");
            richTextBox1.AppendText("Version: ");
            richTextBox1.AppendText(marketingversion);
            richTextBox1.AppendText("\n");
            richTextBox1.AppendText("Productname: ");
            richTextBox1.AppendText(productname);

            notifyIcon1.BalloonTipTitle = "Config Loaded.";
            notifyIcon1.BalloonTipText = "The Config was successfull loaded.";
            notifyIcon1.ShowBalloonTip(60000);

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
                ConfigPath = files.First();
                try
                {
                    GetAAMPProperties(ConfigPath);
                }
                catch
                {

                }
                
        }

        private void btnOpenAamp_Click(object sender, EventArgs e)
        {

            try
            {

                string fullPath = appPath + @"\AMConsoles\" + cmbAMVersion.Text;


                ProcessStartInfo startInfo = new ProcessStartInfo(fullPath + @"\AMConsole.exe");
                startInfo.WindowStyle = ProcessWindowStyle.Normal;

                if (ConfigPath == "")
                {

                }
                else
                {
                    startInfo.Arguments = "\"" + ConfigPath + "\"";

                }

                Process.Start(startInfo);

                toolStripStatusLabel1.Text = "Starting Console Version " + cmbAMVersion.Text;
            }
            catch
            {
                MessageBox.Show("Could not start AMConsole.exe");
            }

        }
            

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Process.Start("https://www.sva.de");
        }

        private void btnOpenAemp_Click(object sender, EventArgs e)
        {
            try
            {
                string fullPath = appPath + @"\EMConsoles\" + cmbEMVersions.Text;


                ProcessStartInfo startInfo = new ProcessStartInfo(fullPath + @"\EMConsole.exe");
                startInfo.WindowStyle = ProcessWindowStyle.Normal;

                if (ConfigPath == "")
                {

                }
                else
                {
                    startInfo.Arguments = "\"" + ConfigPath + "\"";

                }

                Process.Start(startInfo);

                toolStripStatusLabel1.Text = "Starting Console Version " + cmbEMVersions.Text;
            }
            catch
            {
                MessageBox.Show("Could not start EMConsole.exe");
            }
        }

        private void testToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.Close(); 
        }

        private void ToolStripAbout_Click(object sender, EventArgs e)
        {
            Process.Start("https://github.com/sebastianflint/AMConfigVersionSelector");
        }

        private void lblOpenWithVersion_Click(object sender, EventArgs e)
        {

        }

        private void btnUnloadConfig_Click(object sender, EventArgs e)
        {
            richTextBox1.Clear();
            cmbAMVersion.Enabled = true;
            cmbEMVersions.Enabled = true;
            btnOpenAamp.Enabled = true;
            btnOpenAemp.Enabled = true;
            cmbAMVersion.SelectedItem = null;
            cmbEMVersions.SelectedItem = null;
            ConfigPath = "";
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Close program?", "Close", MessageBoxButtons.OKCancel);
            if (dialogResult == DialogResult.OK)
            {
                
            }
            else if (dialogResult == DialogResult.Cancel)
            {
                e.Cancel = true;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        static void CheckForUpdates(bool output)
        {
            try
            {
                string currentVersion = "V2.3";
                string latestVersion = GetLatestVersion("sebastianflint", "AMConfigVersionSelector");

                if (currentVersion != latestVersion)
                {
                    //MessageBox.Show("There is a newer version available: " + latestVersion + "\nDownload at: https://github.com/sebastianflint/AMConfigVersionSelector", "New Version available");
                    DialogResult dialogResult = MessageBox.Show("There is a new version available.\nDownload newer version?", "New version available", MessageBoxButtons.YesNo);

                    if (dialogResult == DialogResult.Yes)
                    {
                        Process.Start("https://github.com/sebastianflint/AMConfigVersionSelector/releases/");
                    }
                    else if (dialogResult == DialogResult.No)
                    {
            
                    }
                }
                else
                {
                    if (output == true)
                    {
                        MessageBox.Show("You are already using the newest version.", "No new version available");
                    }
                    
                }
            }
            catch (Exception ex)
            {
                //Console.WriteLine("An error occurred while checking for updates: " + ex.Message);
                MessageBox.Show(ex.Message);
            }

        }

        public static bool CheckInternetConnection()
        {
            try
            {
                using (var client = new WebClient())
                using (var stream = client.OpenRead("https://github.com/"))
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        static string GetLatestVersion(string username, string repository)
        {
            string url = "https://api.github.com/repos/" + username + "/" + repository + "/releases/latest";
            string json;

            using (WebClient client = new WebClient())
            {
                client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko");
                json = client.DownloadString(url);
            }

            JsonDocument document = JsonDocument.Parse(json);
            return document.RootElement.GetProperty("tag_name").GetString().Replace("v", string.Empty);
        }

        private void contextMenuStrip1_Opening(object sender, CancelEventArgs e)
        {

        }

        private void toolStripUpdate_Click(object sender, EventArgs e)
        {
            if (CheckInternetConnection())
            {
                CheckForUpdates(true);
            }
            else
            {
                MessageBox.Show("You dont have an active Internet Connection. Please check again.","Error");
            }

           
        }

        private void optionsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void testToolStripMenuItem_CheckedChanged(object sender, EventArgs e)
        {
        
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Process.Start("https://forums.ivanti.com/s/article/Ivanti-Environment-Manager-Version-History-and-Support-Lifecycle");
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            Process.Start("https://forums.ivanti.com/s/article/Ivanti-UWM-Application-Control-Version-History-and-Support-Lifecycle");
        }
    }
}




 