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

namespace AMConfigVersionSelector
{

    /* Script Name  : AMConfigVersionSelector.exe
     * Description  : The AMConfigVersionselector is a program designed to read the Ivanti Application Control Config.
     * Author       : Sebastian Flint
     * E-Mail       : sebastian.flint@sva.de
     * 
     * Included Build   Version
     * 10.3.61.0        2019.1
     * 10.5.268.0       2020.2
     * 10.6.111.0       2020.3
     * 10.7.17.0        2021.1
     * 10.8.61.0        2021.3
     * 10.9.37.0        2022.1
     * 
     */
    public partial class Form1 : Form
    {
        string[] AMVersions = { "2019.1", "2020.2", "2020.3", "2021.1", "2021.3","2022.1" };
        string[] AMBuilds = { "10.3.61.0", "10.5.268.0", "10.6.111.0", "10.7.17.0", "10.8.61.0","10.9.37.0" };
        string[] AMCombined = { "2019.1 (10.3.61.0)", "2020.2 (10.5.268.0)", "2020.3 (10.6.111.0)", "2021.1 (10.7.17.0)", "2021.3 (10.8.61.0)","2022.1 (10.9.37.0)" };
        string[] EMVersion = { "2022.1 HF1" };
        string[] EMBuilds = { "10.9.185.1" };
        string ConfigPath;
        string extension;
        string appPath = Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);

        public Form1()
        {
  
            InitializeComponent();

            string[] args = Environment.GetCommandLineArgs();
            string[] EMVersionsInDir = Directory.GetDirectories(appPath + @"\EMConsoles\");

            foreach (string version in AMCombined)
             {
                 cmbAMVersion.Items.Add(version);
             }

            foreach (string version in EMVersionsInDir)
            {
                var dirName = new DirectoryInfo(version).Name;
                cmbEMVersions.Items.Add(dirName);
            }


            if (args.Length >= 2)
            {
                ConfigPath = args[1];
                GetAAMPProperties(ConfigPath);
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
            extension = Path.GetExtension(ConfigPath);

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

            int i = 0;

            if (extension == ".aamp")
            {
                cmbEMVersions.Enabled = false;
                btnOpenAemp.Enabled = false;

                foreach (string version in AMBuilds)
                {
                    if (creatorversion == version)
                    {
                        cmbAMVersion.SelectedIndex = i;
                    }
                    i++;
                }

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

                string VersionPath = AMVersions[cmbAMVersion.SelectedIndex];
                string fullPath = appPath + @"\AMConsoles\" + VersionPath;


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

                toolStripStatusLabel1.Text = "Starting Console Version " + VersionPath;
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
        }
    }
}
