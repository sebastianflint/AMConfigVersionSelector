namespace UWMConfigVersionSelector
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
                components.Dispose();
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.pnlTitleBar = new System.Windows.Forms.Panel();
            this.lblAppTitle = new System.Windows.Forms.Label();
            this.lblVersion = new System.Windows.Forms.Label();
            this.btnWinMinimize = new System.Windows.Forms.Button();
            this.btnWinClose = new System.Windows.Forms.Button();
            this.pnlMenuBar = new System.Windows.Forms.Panel();
            this.btnMenuOptions = new System.Windows.Forms.Button();
            this.ctxOptions = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.mnuOpenEMReleases = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuOpenAMReleases = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuOpenAMConsoles = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuOpenEMConsoles = new System.Windows.Forms.ToolStripMenuItem();
            this.pnlMain = new System.Windows.Forms.Panel();
            this.pnlHero = new System.Windows.Forms.Panel();
            this.lblAppIcon = new System.Windows.Forms.Label();
            this.lblHeroTitle = new System.Windows.Forms.Label();
            this.lblHeroSub = new System.Windows.Forms.Label();
            this.lblSvaLogo = new System.Windows.Forms.Label();
            this.pnlLoadConfig = new System.Windows.Forms.Panel();
            this.lblLoadHeader = new System.Windows.Forms.Label();
            this.pnlDropZone = new System.Windows.Forms.Panel();
            this.lblDropIcon = new System.Windows.Forms.Label();
            this.lblDropHint = new System.Windows.Forms.Label();
            this.lblDropSub = new System.Windows.Forms.Label();
            this.pnlProperties = new System.Windows.Forms.Panel();
            this.lblPropsHeader = new System.Windows.Forms.Label();
            this.rtbProperties = new System.Windows.Forms.RichTextBox();
            this.pnlConsole = new System.Windows.Forms.Panel();
            this.lblConsoleHeader = new System.Windows.Forms.Label();
            this.lblAMLabel = new System.Windows.Forms.Label();
            this.cmbAMVersion = new System.Windows.Forms.ComboBox();
            this.btnOpenAamp = new System.Windows.Forms.Button();
            this.lblEMLabel = new System.Windows.Forms.Label();
            this.cmbEMVersions = new System.Windows.Forms.ComboBox();
            this.btnOpenAemp = new System.Windows.Forms.Button();
            this.btnUnloadConfig = new System.Windows.Forms.Button();
            this.pnlStatusBar = new System.Windows.Forms.Panel();
            this.picStatusDot = new System.Windows.Forms.PictureBox();
            this.lblStatusText = new System.Windows.Forms.Label();
            this.lblStatusRight = new System.Windows.Forms.Label();
            this.notifyIcon1 = new System.Windows.Forms.NotifyIcon(this.components);
            this.ctxTray = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.mnuTrayAbout = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuTrayUpdate = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuTrayExit = new System.Windows.Forms.ToolStripMenuItem();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.pnlTitleBar.SuspendLayout();
            this.pnlMenuBar.SuspendLayout();
            this.ctxOptions.SuspendLayout();
            this.pnlMain.SuspendLayout();
            this.pnlHero.SuspendLayout();
            this.pnlLoadConfig.SuspendLayout();
            this.pnlDropZone.SuspendLayout();
            this.pnlProperties.SuspendLayout();
            this.pnlConsole.SuspendLayout();
            this.pnlStatusBar.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picStatusDot)).BeginInit();
            this.ctxTray.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlTitleBar
            // 
            this.pnlTitleBar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.pnlTitleBar.Controls.Add(this.lblAppTitle);
            this.pnlTitleBar.Controls.Add(this.lblVersion);
            this.pnlTitleBar.Controls.Add(this.btnWinMinimize);
            this.pnlTitleBar.Controls.Add(this.btnWinClose);
            this.pnlTitleBar.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlTitleBar.Location = new System.Drawing.Point(0, 0);
            this.pnlTitleBar.Name = "pnlTitleBar";
            this.pnlTitleBar.Size = new System.Drawing.Size(780, 38);
            this.pnlTitleBar.TabIndex = 4;
            this.pnlTitleBar.MouseDown += new System.Windows.Forms.MouseEventHandler(this.TitleBar_MouseDown);
            // 
            // lblAppTitle
            // 
            this.lblAppTitle.AutoSize = true;
            this.lblAppTitle.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.lblAppTitle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.lblAppTitle.Location = new System.Drawing.Point(14, 12);
            this.lblAppTitle.Name = "lblAppTitle";
            this.lblAppTitle.Size = new System.Drawing.Size(182, 14);
            this.lblAppTitle.TabIndex = 0;
            this.lblAppTitle.Text = "UWM ConfigVersionSelector";
            // 
            // lblVersion
            // 
            this.lblVersion.AutoSize = true;
            this.lblVersion.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.lblVersion.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(79)))), ((int)(((byte)(140)))), ((int)(((byte)(255)))));
            this.lblVersion.Location = new System.Drawing.Point(210, 12);
            this.lblVersion.Name = "lblVersion";
            this.lblVersion.Size = new System.Drawing.Size(35, 14);
            this.lblVersion.TabIndex = 1;
            this.lblVersion.Text = "v4.0";
            // 
            // btnWinMinimize
            // 
            this.btnWinMinimize.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.btnWinMinimize.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnWinMinimize.FlatAppearance.BorderSize = 0;
            this.btnWinMinimize.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(39)))), ((int)(((byte)(58)))));
            this.btnWinMinimize.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnWinMinimize.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.btnWinMinimize.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.btnWinMinimize.Location = new System.Drawing.Point(704, 0);
            this.btnWinMinimize.Name = "btnWinMinimize";
            this.btnWinMinimize.Size = new System.Drawing.Size(38, 38);
            this.btnWinMinimize.TabIndex = 2;
            this.btnWinMinimize.TabStop = false;
            this.btnWinMinimize.Text = "─";
            this.btnWinMinimize.UseVisualStyleBackColor = false;
            this.btnWinMinimize.Click += new System.EventHandler(this.BtnWinMinimize_Click);
            // 
            // btnWinClose
            // 
            this.btnWinClose.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.btnWinClose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnWinClose.FlatAppearance.BorderSize = 0;
            this.btnWinClose.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(90)))), ((int)(((byte)(90)))));
            this.btnWinClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnWinClose.Font = new System.Drawing.Font("Segoe UI", 11F);
            this.btnWinClose.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.btnWinClose.Location = new System.Drawing.Point(742, 0);
            this.btnWinClose.Name = "btnWinClose";
            this.btnWinClose.Size = new System.Drawing.Size(38, 38);
            this.btnWinClose.TabIndex = 3;
            this.btnWinClose.TabStop = false;
            this.btnWinClose.Text = "✕";
            this.btnWinClose.UseVisualStyleBackColor = false;
            this.btnWinClose.Click += new System.EventHandler(this.BtnWinClose_Click);
            // 
            // pnlMenuBar
            // 
            this.pnlMenuBar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.pnlMenuBar.Controls.Add(this.btnMenuOptions);
            this.pnlMenuBar.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlMenuBar.Location = new System.Drawing.Point(0, 38);
            this.pnlMenuBar.Name = "pnlMenuBar";
            this.pnlMenuBar.Size = new System.Drawing.Size(780, 30);
            this.pnlMenuBar.TabIndex = 3;
            // 
            // btnMenuOptions
            // 
            this.btnMenuOptions.BackColor = System.Drawing.Color.Transparent;
            this.btnMenuOptions.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnMenuOptions.FlatAppearance.BorderSize = 0;
            this.btnMenuOptions.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(39)))), ((int)(((byte)(58)))));
            this.btnMenuOptions.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuOptions.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuOptions.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.btnMenuOptions.Location = new System.Drawing.Point(4, 1);
            this.btnMenuOptions.Name = "btnMenuOptions";
            this.btnMenuOptions.Size = new System.Drawing.Size(90, 28);
            this.btnMenuOptions.TabIndex = 0;
            this.btnMenuOptions.TabStop = false;
            this.btnMenuOptions.Text = "Options ▾";
            this.btnMenuOptions.UseVisualStyleBackColor = false;
            this.btnMenuOptions.Click += new System.EventHandler(this.BtnMenuOptions_Click);
            // 
            // ctxOptions
            // 
            this.ctxOptions.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(30)))), ((int)(((byte)(41)))));
            this.ctxOptions.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.ctxOptions.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.ctxOptions.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuOpenEMReleases,
            this.mnuOpenAMReleases,
            this.mnuOpenAMConsoles,
            this.mnuOpenEMConsoles});
            this.ctxOptions.Name = "ctxOptions";
            this.ctxOptions.Size = new System.Drawing.Size(177, 92);
            // 
            // mnuOpenEMReleases
            // 
            this.mnuOpenEMReleases.Name = "mnuOpenEMReleases";
            this.mnuOpenEMReleases.Size = new System.Drawing.Size(176, 22);
            this.mnuOpenEMReleases.Text = "Open EM Releases";
            this.mnuOpenEMReleases.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // mnuOpenAMReleases
            // 
            this.mnuOpenAMReleases.Name = "mnuOpenAMReleases";
            this.mnuOpenAMReleases.Size = new System.Drawing.Size(176, 22);
            this.mnuOpenAMReleases.Text = "Open AM Releases";
            this.mnuOpenAMReleases.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // mnuOpenAMConsoles
            // 
            this.mnuOpenAMConsoles.Name = "mnuOpenAMConsoles";
            this.mnuOpenAMConsoles.Size = new System.Drawing.Size(176, 22);
            this.mnuOpenAMConsoles.Text = "Open AM Consoles";
            this.mnuOpenAMConsoles.Click += new System.EventHandler(this.openAMConsolesToolStripMenuItem_Click);
            // 
            // mnuOpenEMConsoles
            // 
            this.mnuOpenEMConsoles.Name = "mnuOpenEMConsoles";
            this.mnuOpenEMConsoles.Size = new System.Drawing.Size(176, 22);
            this.mnuOpenEMConsoles.Text = "Open EM Consoles";
            this.mnuOpenEMConsoles.Click += new System.EventHandler(this.openEMConsolesToolStripMenuItem_Click);
            // 
            // pnlMain
            // 
            this.pnlMain.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(13)))), ((int)(((byte)(15)))), ((int)(((byte)(20)))));
            this.pnlMain.Controls.Add(this.pnlHero);
            this.pnlMain.Controls.Add(this.pnlLoadConfig);
            this.pnlMain.Controls.Add(this.pnlProperties);
            this.pnlMain.Controls.Add(this.pnlConsole);
            this.pnlMain.Controls.Add(this.btnUnloadConfig);
            this.pnlMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlMain.Location = new System.Drawing.Point(0, 68);
            this.pnlMain.Name = "pnlMain";
            this.pnlMain.Size = new System.Drawing.Size(780, 414);
            this.pnlMain.TabIndex = 2;
            // 
            // pnlHero
            // 
            this.pnlHero.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(13)))), ((int)(((byte)(15)))), ((int)(((byte)(20)))));
            this.pnlHero.Controls.Add(this.lblAppIcon);
            this.pnlHero.Controls.Add(this.lblHeroTitle);
            this.pnlHero.Controls.Add(this.lblHeroSub);
            this.pnlHero.Controls.Add(this.lblSvaLogo);
            this.pnlHero.Location = new System.Drawing.Point(20, 16);
            this.pnlHero.Name = "pnlHero";
            this.pnlHero.Size = new System.Drawing.Size(740, 60);
            this.pnlHero.TabIndex = 0;
            // 
            // lblAppIcon
            // 
            this.lblAppIcon.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(124)))), ((int)(((byte)(92)))), ((int)(((byte)(252)))));
            this.lblAppIcon.Font = new System.Drawing.Font("Segoe UI", 20F);
            this.lblAppIcon.ForeColor = System.Drawing.Color.White;
            this.lblAppIcon.Location = new System.Drawing.Point(0, 4);
            this.lblAppIcon.Name = "lblAppIcon";
            this.lblAppIcon.Size = new System.Drawing.Size(50, 50);
            this.lblAppIcon.TabIndex = 0;
            this.lblAppIcon.Text = "⚙";
            this.lblAppIcon.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblHeroTitle
            // 
            this.lblHeroTitle.AutoSize = true;
            this.lblHeroTitle.Font = new System.Drawing.Font("Segoe UI Semibold", 13F);
            this.lblHeroTitle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(232)))), ((int)(((byte)(236)))), ((int)(((byte)(248)))));
            this.lblHeroTitle.Location = new System.Drawing.Point(62, 10);
            this.lblHeroTitle.Name = "lblHeroTitle";
            this.lblHeroTitle.Size = new System.Drawing.Size(260, 25);
            this.lblHeroTitle.TabIndex = 1;
            this.lblHeroTitle.Text = "UWM Config Version Selector";
            // 
            // lblHeroSub
            // 
            this.lblHeroSub.AutoSize = true;
            this.lblHeroSub.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.lblHeroSub.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.lblHeroSub.Location = new System.Drawing.Point(63, 36);
            this.lblHeroSub.Name = "lblHeroSub";
            this.lblHeroSub.Size = new System.Drawing.Size(210, 14);
            this.lblHeroSub.TabIndex = 2;
            this.lblHeroSub.Text = "UWM / SVA Infrastructure Tool";
            this.lblHeroSub.Visible = false;
            // 
            // lblSvaLogo
            // 
            this.lblSvaLogo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(30)))), ((int)(((byte)(41)))));
            this.lblSvaLogo.Font = new System.Drawing.Font("Segoe UI Semibold", 11F);
            this.lblSvaLogo.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.lblSvaLogo.Location = new System.Drawing.Point(640, 10);
            this.lblSvaLogo.Name = "lblSvaLogo";
            this.lblSvaLogo.Size = new System.Drawing.Size(60, 36);
            this.lblSvaLogo.TabIndex = 3;
            this.lblSvaLogo.Text = "SVA";
            this.lblSvaLogo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // pnlLoadConfig
            // 
            this.pnlLoadConfig.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.pnlLoadConfig.Controls.Add(this.lblLoadHeader);
            this.pnlLoadConfig.Controls.Add(this.pnlDropZone);
            this.pnlLoadConfig.Location = new System.Drawing.Point(20, 88);
            this.pnlLoadConfig.Name = "pnlLoadConfig";
            this.pnlLoadConfig.Size = new System.Drawing.Size(355, 148);
            this.pnlLoadConfig.TabIndex = 1;
            // 
            // lblLoadHeader
            // 
            this.lblLoadHeader.AutoSize = true;
            this.lblLoadHeader.Font = new System.Drawing.Font("Segoe UI", 7.5F);
            this.lblLoadHeader.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(68)))), ((int)(((byte)(96)))));
            this.lblLoadHeader.Location = new System.Drawing.Point(14, 10);
            this.lblLoadHeader.Name = "lblLoadHeader";
            this.lblLoadHeader.Size = new System.Drawing.Size(126, 12);
            this.lblLoadHeader.TabIndex = 0;
            this.lblLoadHeader.Text = "▸  LOAD CONFIGURATION";
            // 
            // pnlDropZone
            // 
            this.pnlDropZone.AllowDrop = true;
            this.pnlDropZone.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(30)))), ((int)(((byte)(41)))));
            this.pnlDropZone.Controls.Add(this.lblDropIcon);
            this.pnlDropZone.Controls.Add(this.lblDropHint);
            this.pnlDropZone.Controls.Add(this.lblDropSub);
            this.pnlDropZone.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pnlDropZone.Location = new System.Drawing.Point(14, 32);
            this.pnlDropZone.Name = "pnlDropZone";
            this.pnlDropZone.Size = new System.Drawing.Size(326, 102);
            this.pnlDropZone.TabIndex = 1;
            this.pnlDropZone.Click += new System.EventHandler(this.DropZone_Click);
            this.pnlDropZone.DragDrop += new System.Windows.Forms.DragEventHandler(this.DropZone_DragDrop);
            this.pnlDropZone.DragOver += new System.Windows.Forms.DragEventHandler(this.DropZone_DragOver);
            // 
            // lblDropIcon
            // 
            this.lblDropIcon.AutoSize = true;
            this.lblDropIcon.Font = new System.Drawing.Font("Segoe UI", 22F);
            this.lblDropIcon.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.lblDropIcon.Location = new System.Drawing.Point(130, 8);
            this.lblDropIcon.Name = "lblDropIcon";
            this.lblDropIcon.Size = new System.Drawing.Size(59, 41);
            this.lblDropIcon.TabIndex = 0;
            this.lblDropIcon.Text = "📂";
            // 
            // lblDropHint
            // 
            this.lblDropHint.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.lblDropHint.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.lblDropHint.Location = new System.Drawing.Point(0, 52);
            this.lblDropHint.Name = "lblDropHint";
            this.lblDropHint.Size = new System.Drawing.Size(326, 20);
            this.lblDropHint.TabIndex = 1;
            this.lblDropHint.Text = "Drop config file or click to browse";
            this.lblDropHint.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblDropSub
            // 
            this.lblDropSub.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.lblDropSub.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(68)))), ((int)(((byte)(96)))));
            this.lblDropSub.Location = new System.Drawing.Point(0, 74);
            this.lblDropSub.Name = "lblDropSub";
            this.lblDropSub.Size = new System.Drawing.Size(326, 18);
            this.lblDropSub.TabIndex = 2;
            this.lblDropSub.Text = "Supports: .aamp  •  .aemp";
            this.lblDropSub.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // pnlProperties
            // 
            this.pnlProperties.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.pnlProperties.Controls.Add(this.lblPropsHeader);
            this.pnlProperties.Controls.Add(this.rtbProperties);
            this.pnlProperties.Location = new System.Drawing.Point(388, 88);
            this.pnlProperties.Name = "pnlProperties";
            this.pnlProperties.Size = new System.Drawing.Size(372, 148);
            this.pnlProperties.TabIndex = 2;
            // 
            // lblPropsHeader
            // 
            this.lblPropsHeader.AutoSize = true;
            this.lblPropsHeader.Font = new System.Drawing.Font("Segoe UI", 7.5F);
            this.lblPropsHeader.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(68)))), ((int)(((byte)(96)))));
            this.lblPropsHeader.Location = new System.Drawing.Point(14, 10);
            this.lblPropsHeader.Name = "lblPropsHeader";
            this.lblPropsHeader.Size = new System.Drawing.Size(75, 12);
            this.lblPropsHeader.TabIndex = 0;
            this.lblPropsHeader.Text = "▸  PROPERTIES";
            // 
            // rtbProperties
            // 
            this.rtbProperties.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(30)))), ((int)(((byte)(41)))));
            this.rtbProperties.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.rtbProperties.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.rtbProperties.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.rtbProperties.Location = new System.Drawing.Point(14, 32);
            this.rtbProperties.Name = "rtbProperties";
            this.rtbProperties.ReadOnly = true;
            this.rtbProperties.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.rtbProperties.Size = new System.Drawing.Size(344, 102);
            this.rtbProperties.TabIndex = 1;
            this.rtbProperties.TabStop = false;
            this.rtbProperties.Text = "(No configuration loaded)";
            // 
            // pnlConsole
            // 
            this.pnlConsole.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.pnlConsole.Controls.Add(this.lblConsoleHeader);
            this.pnlConsole.Controls.Add(this.lblAMLabel);
            this.pnlConsole.Controls.Add(this.cmbAMVersion);
            this.pnlConsole.Controls.Add(this.btnOpenAamp);
            this.pnlConsole.Controls.Add(this.lblEMLabel);
            this.pnlConsole.Controls.Add(this.cmbEMVersions);
            this.pnlConsole.Controls.Add(this.btnOpenAemp);
            this.pnlConsole.Location = new System.Drawing.Point(20, 252);
            this.pnlConsole.Name = "pnlConsole";
            this.pnlConsole.Size = new System.Drawing.Size(740, 110);
            this.pnlConsole.TabIndex = 3;
            // 
            // lblConsoleHeader
            // 
            this.lblConsoleHeader.AutoSize = true;
            this.lblConsoleHeader.Font = new System.Drawing.Font("Segoe UI", 7.5F);
            this.lblConsoleHeader.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(68)))), ((int)(((byte)(96)))));
            this.lblConsoleHeader.Location = new System.Drawing.Point(14, 10);
            this.lblConsoleHeader.Name = "lblConsoleHeader";
            this.lblConsoleHeader.Size = new System.Drawing.Size(120, 12);
            this.lblConsoleHeader.TabIndex = 0;
            this.lblConsoleHeader.Text = "▸  OPEN WITH CONSOLE";
            // 
            // lblAMLabel
            // 
            this.lblAMLabel.AutoSize = true;
            this.lblAMLabel.Font = new System.Drawing.Font("Segoe UI", 7.5F);
            this.lblAMLabel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(79)))), ((int)(((byte)(140)))), ((int)(((byte)(255)))));
            this.lblAMLabel.Location = new System.Drawing.Point(14, 34);
            this.lblAMLabel.Name = "lblAMLabel";
            this.lblAMLabel.Size = new System.Drawing.Size(67, 12);
            this.lblAMLabel.TabIndex = 1;
            this.lblAMLabel.Text = "● AM Console";
            // 
            // cmbAMVersion
            // 
            this.cmbAMVersion.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(39)))), ((int)(((byte)(58)))));
            this.cmbAMVersion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAMVersion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbAMVersion.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.cmbAMVersion.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(232)))), ((int)(((byte)(236)))), ((int)(((byte)(248)))));
            this.cmbAMVersion.Location = new System.Drawing.Point(14, 52);
            this.cmbAMVersion.Name = "cmbAMVersion";
            this.cmbAMVersion.Size = new System.Drawing.Size(170, 23);
            this.cmbAMVersion.TabIndex = 0;
            // 
            // btnOpenAamp
            // 
            this.btnOpenAamp.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(79)))), ((int)(((byte)(140)))), ((int)(((byte)(255)))));
            this.btnOpenAamp.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnOpenAamp.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(79)))), ((int)(((byte)(140)))), ((int)(((byte)(255)))));
            this.btnOpenAamp.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(79)))), ((int)(((byte)(140)))), ((int)(((byte)(255)))));
            this.btnOpenAamp.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnOpenAamp.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnOpenAamp.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(79)))), ((int)(((byte)(140)))), ((int)(((byte)(255)))));
            this.btnOpenAamp.Location = new System.Drawing.Point(14, 80);
            this.btnOpenAamp.Name = "btnOpenAamp";
            this.btnOpenAamp.Size = new System.Drawing.Size(170, 24);
            this.btnOpenAamp.TabIndex = 1;
            this.btnOpenAamp.Text = "Open AM Console";
            this.btnOpenAamp.UseVisualStyleBackColor = false;
            this.btnOpenAamp.Click += new System.EventHandler(this.btnOpenAamp_Click);
            // 
            // lblEMLabel
            // 
            this.lblEMLabel.AutoSize = true;
            this.lblEMLabel.Font = new System.Drawing.Font("Segoe UI", 7.5F);
            this.lblEMLabel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(124)))), ((int)(((byte)(92)))), ((int)(((byte)(252)))));
            this.lblEMLabel.Location = new System.Drawing.Point(200, 34);
            this.lblEMLabel.Name = "lblEMLabel";
            this.lblEMLabel.Size = new System.Drawing.Size(66, 12);
            this.lblEMLabel.TabIndex = 2;
            this.lblEMLabel.Text = "● EM Console";
            // 
            // cmbEMVersions
            // 
            this.cmbEMVersions.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(39)))), ((int)(((byte)(58)))));
            this.cmbEMVersions.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEMVersions.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbEMVersions.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.cmbEMVersions.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(232)))), ((int)(((byte)(236)))), ((int)(((byte)(248)))));
            this.cmbEMVersions.Location = new System.Drawing.Point(200, 52);
            this.cmbEMVersions.Name = "cmbEMVersions";
            this.cmbEMVersions.Size = new System.Drawing.Size(170, 23);
            this.cmbEMVersions.TabIndex = 2;
            this.cmbEMVersions.DropDown += new System.EventHandler(this.cmbEMVersions_DropDown);
            this.cmbEMVersions.MouseEnter += new System.EventHandler(this.cmbEMVersions_MouseEnter);
            this.cmbEMVersions.MouseHover += new System.EventHandler(this.cmbEMVersions_MouseHover);
            // 
            // btnOpenAemp
            // 
            this.btnOpenAemp.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(124)))), ((int)(((byte)(92)))), ((int)(((byte)(252)))));
            this.btnOpenAemp.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnOpenAemp.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(124)))), ((int)(((byte)(92)))), ((int)(((byte)(252)))));
            this.btnOpenAemp.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(124)))), ((int)(((byte)(92)))), ((int)(((byte)(252)))));
            this.btnOpenAemp.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnOpenAemp.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnOpenAemp.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(124)))), ((int)(((byte)(92)))), ((int)(((byte)(252)))));
            this.btnOpenAemp.Location = new System.Drawing.Point(200, 80);
            this.btnOpenAemp.Name = "btnOpenAemp";
            this.btnOpenAemp.Size = new System.Drawing.Size(170, 24);
            this.btnOpenAemp.TabIndex = 3;
            this.btnOpenAemp.Text = "Open EM Console";
            this.btnOpenAemp.UseVisualStyleBackColor = false;
            this.btnOpenAemp.Click += new System.EventHandler(this.btnOpenAemp_Click);
            this.btnOpenAemp.MouseHover += new System.EventHandler(this.btnOpenAemp_MouseHover);
            // 
            // btnUnloadConfig
            // 
            this.btnUnloadConfig.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(255)))), ((int)(((byte)(90)))), ((int)(((byte)(90)))));
            this.btnUnloadConfig.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUnloadConfig.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(90)))), ((int)(((byte)(90)))));
            this.btnUnloadConfig.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(255)))), ((int)(((byte)(90)))), ((int)(((byte)(90)))));
            this.btnUnloadConfig.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUnloadConfig.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnUnloadConfig.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(90)))), ((int)(((byte)(90)))));
            this.btnUnloadConfig.Location = new System.Drawing.Point(20, 380);
            this.btnUnloadConfig.Name = "btnUnloadConfig";
            this.btnUnloadConfig.Size = new System.Drawing.Size(740, 34);
            this.btnUnloadConfig.TabIndex = 5;
            this.btnUnloadConfig.Text = "✕  Unload Configuration";
            this.btnUnloadConfig.UseVisualStyleBackColor = false;
            this.btnUnloadConfig.Click += new System.EventHandler(this.btnUnloadConfig_Click);
            // 
            // pnlStatusBar
            // 
            this.pnlStatusBar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(19)))), ((int)(((byte)(22)))), ((int)(((byte)(30)))));
            this.pnlStatusBar.Controls.Add(this.picStatusDot);
            this.pnlStatusBar.Controls.Add(this.lblStatusText);
            this.pnlStatusBar.Controls.Add(this.lblStatusRight);
            this.pnlStatusBar.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.pnlStatusBar.Location = new System.Drawing.Point(0, 482);
            this.pnlStatusBar.Name = "pnlStatusBar";
            this.pnlStatusBar.Size = new System.Drawing.Size(780, 28);
            this.pnlStatusBar.TabIndex = 5;
            // 
            // picStatusDot
            // 
            this.picStatusDot.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(68)))), ((int)(((byte)(96)))));
            this.picStatusDot.Location = new System.Drawing.Point(16, 10);
            this.picStatusDot.Name = "picStatusDot";
            this.picStatusDot.Size = new System.Drawing.Size(8, 8);
            this.picStatusDot.TabIndex = 0;
            this.picStatusDot.TabStop = false;
            // 
            // lblStatusText
            // 
            this.lblStatusText.AutoSize = true;
            this.lblStatusText.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.lblStatusText.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(122)))), ((int)(((byte)(130)))), ((int)(((byte)(160)))));
            this.lblStatusText.Location = new System.Drawing.Point(30, 7);
            this.lblStatusText.Name = "lblStatusText";
            this.lblStatusText.Size = new System.Drawing.Size(175, 14);
            this.lblStatusText.TabIndex = 1;
            this.lblStatusText.Text = "Ready — no config loaded";
            // 
            // lblStatusRight
            // 
            this.lblStatusRight.AutoSize = true;
            this.lblStatusRight.Font = new System.Drawing.Font("Consolas", 8.5F);
            this.lblStatusRight.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(61)))), ((int)(((byte)(68)))), ((int)(((byte)(96)))));
            this.lblStatusRight.Location = new System.Drawing.Point(530, 7);
            this.lblStatusRight.Name = "lblStatusRight";
            this.lblStatusRight.Size = new System.Drawing.Size(217, 14);
            this.lblStatusRight.TabIndex = 2;
            this.lblStatusRight.Text = "UWM ConfigVersionSelector v4.0";
            // 
            // notifyIcon1
            // 
            this.notifyIcon1.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.notifyIcon1.ContextMenuStrip = this.ctxTray;
            this.notifyIcon1.Text = "UWM ConfigVersionSelector";
            this.notifyIcon1.Visible = true;
            // 
            // ctxTray
            // 
            this.ctxTray.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuTrayAbout,
            this.mnuTrayUpdate,
            this.mnuTrayExit});
            this.ctxTray.Name = "ctxTray";
            this.ctxTray.Size = new System.Drawing.Size(172, 70);
            // 
            // mnuTrayAbout
            // 
            this.mnuTrayAbout.Name = "mnuTrayAbout";
            this.mnuTrayAbout.Size = new System.Drawing.Size(171, 22);
            this.mnuTrayAbout.Text = "About";
            this.mnuTrayAbout.Click += new System.EventHandler(this.ToolStripAbout_Click);
            // 
            // mnuTrayUpdate
            // 
            this.mnuTrayUpdate.Name = "mnuTrayUpdate";
            this.mnuTrayUpdate.Size = new System.Drawing.Size(171, 22);
            this.mnuTrayUpdate.Text = "Check for Updates";
            this.mnuTrayUpdate.Click += new System.EventHandler(this.toolStripUpdate_Click);
            // 
            // mnuTrayExit
            // 
            this.mnuTrayExit.Name = "mnuTrayExit";
            this.mnuTrayExit.Size = new System.Drawing.Size(171, 22);
            this.mnuTrayExit.Text = "Exit";
            this.mnuTrayExit.Click += new System.EventHandler(this.testToolStripMenuItem1_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.Filter = "(*.aamp, *.aemp)|*.aamp;*.aemp|All files (*.*)|*.*";
            this.openFileDialog1.Title = "Select Configuration File";
            // 
            // timer1
            // 
            this.timer1.Interval = 800;
            this.timer1.Tick += new System.EventHandler(this.Timer1_Tick);
            // 
            // Form1
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(13)))), ((int)(((byte)(15)))), ((int)(((byte)(20)))));
            this.ClientSize = new System.Drawing.Size(780, 510);
            this.Controls.Add(this.pnlMain);
            this.Controls.Add(this.pnlMenuBar);
            this.Controls.Add(this.pnlTitleBar);
            this.Controls.Add(this.pnlStatusBar);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "UWM ConfigVersionSelector v3.1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.DragDrop += new System.Windows.Forms.DragEventHandler(this.Form1_DragDrop);
            this.DragOver += new System.Windows.Forms.DragEventHandler(this.Form1_DragOver);
            this.pnlTitleBar.ResumeLayout(false);
            this.pnlTitleBar.PerformLayout();
            this.pnlMenuBar.ResumeLayout(false);
            this.ctxOptions.ResumeLayout(false);
            this.pnlMain.ResumeLayout(false);
            this.pnlHero.ResumeLayout(false);
            this.pnlHero.PerformLayout();
            this.pnlLoadConfig.ResumeLayout(false);
            this.pnlLoadConfig.PerformLayout();
            this.pnlDropZone.ResumeLayout(false);
            this.pnlDropZone.PerformLayout();
            this.pnlProperties.ResumeLayout(false);
            this.pnlProperties.PerformLayout();
            this.pnlConsole.ResumeLayout(false);
            this.pnlConsole.PerformLayout();
            this.pnlStatusBar.ResumeLayout(false);
            this.pnlStatusBar.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picStatusDot)).EndInit();
            this.ctxTray.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        // ── Field declarations ───────────────────────────────────────────
        private System.Windows.Forms.Panel pnlTitleBar;
        private System.Windows.Forms.Label lblAppTitle;
        private System.Windows.Forms.Label lblVersion;
        private System.Windows.Forms.Button btnWinClose;
        private System.Windows.Forms.Button btnWinMinimize;

        private System.Windows.Forms.Panel pnlMenuBar;
        private System.Windows.Forms.Button btnMenuOptions;
        private System.Windows.Forms.ContextMenuStrip ctxOptions;
        private System.Windows.Forms.ToolStripMenuItem mnuOpenEMReleases;
        private System.Windows.Forms.ToolStripMenuItem mnuOpenAMReleases;
        private System.Windows.Forms.ToolStripMenuItem mnuOpenAMConsoles;
        private System.Windows.Forms.ToolStripMenuItem mnuOpenEMConsoles;

        private System.Windows.Forms.Panel pnlMain;
        private System.Windows.Forms.Panel pnlHero;
        private System.Windows.Forms.Label lblAppIcon;
        private System.Windows.Forms.Label lblHeroTitle;
        private System.Windows.Forms.Label lblHeroSub;
        private System.Windows.Forms.Label lblSvaLogo;

        private System.Windows.Forms.Panel pnlLoadConfig;
        private System.Windows.Forms.Label lblLoadHeader;
        private System.Windows.Forms.Panel pnlDropZone;
        private System.Windows.Forms.Label lblDropIcon;
        private System.Windows.Forms.Label lblDropHint;
        private System.Windows.Forms.Label lblDropSub;

        private System.Windows.Forms.Panel pnlProperties;
        private System.Windows.Forms.Label lblPropsHeader;
        private System.Windows.Forms.RichTextBox rtbProperties;

        private System.Windows.Forms.Panel pnlConsole;
        private System.Windows.Forms.Label lblConsoleHeader;
        private System.Windows.Forms.Label lblAMLabel;
        private System.Windows.Forms.ComboBox cmbAMVersion;
        private System.Windows.Forms.Button btnOpenAamp;
        private System.Windows.Forms.Label lblEMLabel;
        private System.Windows.Forms.ComboBox cmbEMVersions;
        private System.Windows.Forms.Button btnOpenAemp;

        private System.Windows.Forms.Button btnUnloadConfig;

        private System.Windows.Forms.Panel pnlStatusBar;
        private System.Windows.Forms.PictureBox picStatusDot;
        private System.Windows.Forms.Label lblStatusText;
        private System.Windows.Forms.Label lblStatusRight;

        private System.Windows.Forms.NotifyIcon notifyIcon1;
        private System.Windows.Forms.ContextMenuStrip ctxTray;
        private System.Windows.Forms.ToolStripMenuItem mnuTrayAbout;
        private System.Windows.Forms.ToolStripMenuItem mnuTrayUpdate;
        private System.Windows.Forms.ToolStripMenuItem mnuTrayExit;

        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.Timer timer1;

        // Alias für Rückwärtskompatibilität mit Form1.cs
        private System.Windows.Forms.RichTextBox richTextBox1 => this.rtbProperties;
    }
}