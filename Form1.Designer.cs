
namespace UWMConfigVersionSelector
{
    partial class Form1
    {
        /// <summary>
        /// Erforderliche Designervariable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Verwendete Ressourcen bereinigen.
        /// </summary>
        /// <param name="disposing">True, wenn verwaltete Ressourcen gelöscht werden sollen; andernfalls False.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Vom Windows Form-Designer generierter Code

        /// <summary>
        /// Erforderliche Methode für die Designerunterstützung.
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.cmbAMVersion = new System.Windows.Forms.ComboBox();
            this.lblOpenWithVersion = new System.Windows.Forms.Label();
            this.btnOpenAamp = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblHeader = new System.Windows.Forms.Label();
            this.cmbEMVersions = new System.Windows.Forms.ComboBox();
            this.btnOpenAemp = new System.Windows.Forms.Button();
            this.notifyIcon1 = new System.Windows.Forms.NotifyIcon(this.components);
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.grpOpenWithConsole = new System.Windows.Forms.GroupBox();
            this.btnUnloadConfig = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.ToolStripAbout = new System.Windows.Forms.ToolStripMenuItem();
            this.testToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.statusStrip1.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.grpOpenWithConsole.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // richTextBox1
            // 
            this.richTextBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBox1.Location = new System.Drawing.Point(6, 19);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(327, 96);
            this.richTextBox1.TabIndex = 1;
            this.richTextBox1.Text = "";
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(359, 270);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(147, 23);
            this.button2.TabIndex = 2;
            this.button2.Text = "Load Configuration";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // cmbAMVersion
            // 
            this.cmbAMVersion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAMVersion.FormattingEnabled = true;
            this.cmbAMVersion.Location = new System.Drawing.Point(10, 19);
            this.cmbAMVersion.Name = "cmbAMVersion";
            this.cmbAMVersion.Size = new System.Drawing.Size(147, 21);
            this.cmbAMVersion.TabIndex = 4;
            // 
            // lblOpenWithVersion
            // 
            this.lblOpenWithVersion.AutoSize = true;
            this.lblOpenWithVersion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOpenWithVersion.Location = new System.Drawing.Point(356, 165);
            this.lblOpenWithVersion.Name = "lblOpenWithVersion";
            this.lblOpenWithVersion.Size = new System.Drawing.Size(133, 16);
            this.lblOpenWithVersion.TabIndex = 5;
            this.lblOpenWithVersion.Text = "Open with version:";
            this.lblOpenWithVersion.Click += new System.EventHandler(this.lblOpenWithVersion_Click);
            // 
            // btnOpenAamp
            // 
            this.btnOpenAamp.Location = new System.Drawing.Point(10, 46);
            this.btnOpenAamp.Name = "btnOpenAamp";
            this.btnOpenAamp.Size = new System.Drawing.Size(147, 23);
            this.btnOpenAamp.TabIndex = 6;
            this.btnOpenAamp.Text = "Open AM Console";
            this.btnOpenAamp.UseVisualStyleBackColor = true;
            this.btnOpenAamp.Click += new System.EventHandler(this.btnOpenAamp_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1});
            this.statusStrip1.Location = new System.Drawing.Point(0, 304);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(696, 22);
            this.statusStrip1.TabIndex = 7;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(0, 17);
            // 
            // lblHeader
            // 
            this.lblHeader.AutoSize = true;
            this.lblHeader.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHeader.Location = new System.Drawing.Point(32, 68);
            this.lblHeader.Name = "lblHeader";
            this.lblHeader.Size = new System.Drawing.Size(385, 33);
            this.lblHeader.TabIndex = 10;
            this.lblHeader.Text = "UWM ConfigVersionSelector";
            // 
            // cmbEMVersions
            // 
            this.cmbEMVersions.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEMVersions.FormattingEnabled = true;
            this.cmbEMVersions.Location = new System.Drawing.Point(170, 19);
            this.cmbEMVersions.Name = "cmbEMVersions";
            this.cmbEMVersions.Size = new System.Drawing.Size(147, 21);
            this.cmbEMVersions.TabIndex = 13;
            // 
            // btnOpenAemp
            // 
            this.btnOpenAemp.Location = new System.Drawing.Point(170, 46);
            this.btnOpenAemp.Name = "btnOpenAemp";
            this.btnOpenAemp.Size = new System.Drawing.Size(147, 23);
            this.btnOpenAemp.TabIndex = 14;
            this.btnOpenAemp.Text = "Open EM Console";
            this.btnOpenAemp.UseVisualStyleBackColor = true;
            this.btnOpenAemp.Click += new System.EventHandler(this.btnOpenAemp_Click);
            // 
            // notifyIcon1
            // 
            this.notifyIcon1.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.notifyIcon1.ContextMenuStrip = this.contextMenuStrip1;
            this.notifyIcon1.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon1.Icon")));
            this.notifyIcon1.Text = "IvantiVersionSelector";
            this.notifyIcon1.Visible = true;
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ToolStripAbout,
            this.testToolStripMenuItem1});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(124, 80);
            // 
            // grpOpenWithConsole
            // 
            this.grpOpenWithConsole.Controls.Add(this.cmbAMVersion);
            this.grpOpenWithConsole.Controls.Add(this.cmbEMVersions);
            this.grpOpenWithConsole.Controls.Add(this.btnOpenAemp);
            this.grpOpenWithConsole.Controls.Add(this.btnOpenAamp);
            this.grpOpenWithConsole.Location = new System.Drawing.Point(349, 165);
            this.grpOpenWithConsole.Name = "grpOpenWithConsole";
            this.grpOpenWithConsole.Size = new System.Drawing.Size(335, 83);
            this.grpOpenWithConsole.TabIndex = 16;
            this.grpOpenWithConsole.TabStop = false;
            this.grpOpenWithConsole.Text = "Open with console";
            // 
            // btnUnloadConfig
            // 
            this.btnUnloadConfig.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUnloadConfig.Location = new System.Drawing.Point(519, 270);
            this.btnUnloadConfig.Name = "btnUnloadConfig";
            this.btnUnloadConfig.Size = new System.Drawing.Size(147, 23);
            this.btnUnloadConfig.TabIndex = 15;
            this.btnUnloadConfig.Text = "Unload Configuration";
            this.btnUnloadConfig.UseVisualStyleBackColor = true;
            this.btnUnloadConfig.Click += new System.EventHandler(this.btnUnloadConfig_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.richTextBox1);
            this.groupBox1.Location = new System.Drawing.Point(6, 165);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox1.Size = new System.Drawing.Size(338, 128);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Properties";
            // 
            // pictureBox3
            // 
            this.pictureBox3.Image = global::UWMConfigVersionSelector.Properties.Resources._8111415_switchcurved_switch_next_forward_arrow_icon;
            this.pictureBox3.Location = new System.Drawing.Point(160, 9);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(109, 56);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox3.TabIndex = 12;
            this.pictureBox3.TabStop = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pictureBox1.Image = global::UWMConfigVersionSelector.Properties.Resources.SVA_Logo;
            this.pictureBox1.Location = new System.Drawing.Point(521, 9);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(145, 80);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 8;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // ToolStripAbout
            // 
            this.ToolStripAbout.Image = global::UWMConfigVersionSelector.Properties.Resources._330401_about_details_help_info_information_icon;
            this.ToolStripAbout.Name = "ToolStripAbout";
            this.ToolStripAbout.Size = new System.Drawing.Size(123, 38);
            this.ToolStripAbout.Text = "About";
            this.ToolStripAbout.Click += new System.EventHandler(this.ToolStripAbout_Click);
            // 
            // testToolStripMenuItem1
            // 
            this.testToolStripMenuItem1.Image = global::UWMConfigVersionSelector.Properties.Resources._9055432_bxs_exit_icon;
            this.testToolStripMenuItem1.Name = "testToolStripMenuItem1";
            this.testToolStripMenuItem1.Size = new System.Drawing.Size(123, 38);
            this.testToolStripMenuItem1.Text = "Exit";
            this.testToolStripMenuItem1.Click += new System.EventHandler(this.testToolStripMenuItem1_Click);
            // 
            // Form1
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.ClientSize = new System.Drawing.Size(696, 326);
            this.Controls.Add(this.btnUnloadConfig);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.grpOpenWithConsole);
            this.Controls.Add(this.pictureBox3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.lblHeader);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.lblOpenWithVersion);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "UWM ConfigVersionSelector Version 1.2";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.DragDrop += new System.Windows.Forms.DragEventHandler(this.Form1_DragDrop);
            this.DragOver += new System.Windows.Forms.DragEventHandler(this.Form1_DragOver);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.grpOpenWithConsole.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.ComboBox cmbAMVersion;
        private System.Windows.Forms.Label lblOpenWithVersion;
        private System.Windows.Forms.Button btnOpenAamp;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblHeader;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.ComboBox cmbEMVersions;
        private System.Windows.Forms.Button btnOpenAemp;
        private System.Windows.Forms.NotifyIcon notifyIcon1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem ToolStripAbout;
        private System.Windows.Forms.ToolStripMenuItem testToolStripMenuItem1;
        private System.Windows.Forms.GroupBox grpOpenWithConsole;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnUnloadConfig;
    }
}

