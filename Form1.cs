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
        string AampPath;

        public Form1()
        {
  
            InitializeComponent();

            string[] args = Environment.GetCommandLineArgs();    

            foreach (string version in AMCombined)
             {
                 cmbAMVersion.Items.Add(version);
             }

            if (args.Length >= 2)
            {
                AampPath = args[1];
                GetAAMPProperties(AampPath);
            }

        }

        
        private void button2_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "aamp file (*.aamp)|*.aamp|All files (*.*)|*.*";
            openFileDialog1.ShowDialog();

             AampPath = openFileDialog1.FileName;

            try
            {
                GetAAMPProperties(AampPath);
            }
            catch
            {

            }
        }

        public void GetAAMPProperties(string path)

        {
            cmbAMVersion.SelectedItem = null;

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

            int i = 0;

            foreach (string version in AMBuilds)
            {
                if (creatorversion == version)
                {
                    cmbAMVersion.SelectedIndex = i;
                }
                i++;
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
                AampPath = files.First();
                try
                {
                    GetAAMPProperties(AampPath);
                }
                catch
                {

                }
                
        }

        private void btnOpenAamp_Click(object sender, EventArgs e)
        {
            
            try
            {
                string appPath = Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);
                string VersionPath = AMVersions[cmbAMVersion.SelectedIndex];
                string fullPath = appPath +@"\"+ VersionPath;


                ProcessStartInfo startInfo = new ProcessStartInfo(fullPath + @"\AMConsole.exe");
                startInfo.WindowStyle = ProcessWindowStyle.Normal;

                if (AampPath == "")
                {
                    
                }
                else
                {
                    startInfo.Arguments = "\"" + AampPath + "\"";

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

    }
}
