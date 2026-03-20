// Module:	ControlSizingManager
//
// Description: Implements "docking" behaviour like you would see in .NET Windows. The main "container"
//		div is passed to the constructure (theDivName). All other controls are managed in this
//		context. You also pass in the document object so it never has to ask for any additional 
//              parameters (see ControlSizingManager Constructor)
//

	// Position/Sizing Flags
	//
	var CONTROLSIZINGMANAGER_LEFT		=  1;
	var CONTROLSIZINGMANAGER_RIGHT   	=  2;
	var CONTROLSIZINGMANAGER_TOP		=  4;
	var CONTROLSIZINGMANAGER_BOTTOM  	=  8;
	var CONTROLSIZINGMANAGER_ALL     	= 15;


// Method:	ControlSizingManager_PositionInfo (Constructor)
// Description: Describes the position of a single control to be managed. The flags indicate how 
//		the control will be "docked". All parameters are in pixels. 
//
function	ControlSizingManager_PositionInfo(left, top, right, bottom, flags)
{
	this.m_left   = left;
	this.m_top    = top;
	this.m_right  = right;
	this.m_bottom = bottom;
	this.m_flags  = flags;
}



// Method:	ControlSizingManager (Constructor)
// Description: Manages the docking of windows and controls within 'theDivName'. You construct
//		an instance of this object and then call .Manage() for each control you want to manage. 
//
function	ControlSizingManager(theDivName, theDocument)
{
	// The name of the all encompassing DIV that acts as a container.
	//
	this.m_divName = theDivName;

	this.m_document = theDocument;

	this.m_iMinWidth  = 0x80000000;
	this.m_iMinHeight = 0x80000000;
	this.m_iMaxWidth  = 0x7FFFFFFF;
	this.m_iMaxHeight = 0x7FFFFFFF;

	this.m_padding    = 0;

	this.SetMinimumSize = SetMinimumSize;
	this.SetMaximumSize = SetMaximumSize;
	this.Manage         = Manage;
	this.OnSize	    = OnSize;

	this.m_controls = new Object;
	


	// Changes the minimum size of the controlling Div. 
	// 
	function	SetMinimumSize(minWidth, minHeight)
	{
		this.m_iMinWidth = minWidth;
		this.m_iMinHeight = minHeight;
	}



	// Sets the maximum size of the controlling Div.
	// 
	function	SetMaximumSize(maxWidth, maxHeight)
	{
		this.m_iMaxWidth = maxWidth;
		this.m_iMaxHeight = maxHeight;
	}



	// Method:	Manage
	// Description: Manages a control (div, or any "block" component).
	//		sizingFlags - Combation of the CONTROLSIZINGMANAGE_XXX flags
	// 
	function	Manage(controlName, sizingFlags)
	{
		// Obtain the position information of the controlling DIV and the one to manage. 
		//
		var rectParent  = new ControlSizingManager_PositionInfo();
		var rectChild   = new ControlSizingManager_PositionInfo();
		var rectManaged = new ControlSizingManager_PositionInfo();
	
		rectParent.m_left      = this.m_document.all(this.m_divName).style.pixelLeft;
		rectParent.m_right     = this.m_document.all(this.m_divName).style.pixelWidth + rectParent.m_left;
		rectParent.m_top       = this.m_document.all(this.m_divName).style.pixelTop;
		rectParent.m_bottom    = this.m_document.all(this.m_divName).style.pixelHeight + rectParent.m_top;

		rectChild.m_left      = this.m_document.all(controlName).style.pixelLeft;
		rectChild.m_right     = this.m_document.all(controlName).style.pixelWidth + rectChild.m_left;
		rectChild.m_top       = this.m_document.all(controlName).style.pixelTop;
		rectChild.m_bottom    = this.m_document.all(controlName).style.pixelHeight + rectChild.m_top;

		// Decide the bounds of the managed rectangle. Assume defaults. 
		//
		rectManaged.m_left   = 0x80000000;
		rectManaged.m_right  = 0x80000000;
		rectManaged.m_top    = 0x80000000;
		rectManaged.m_bottom = 0x80000000;

		if(sizingFlags & CONTROLSIZINGMANAGER_LEFT)
		{
			rectManaged.m_left = rectChild.m_left - rectParent.m_left;
		}

		if(sizingFlags & CONTROLSIZINGMANAGER_TOP)
		{
			rectManaged.m_top = rectChild.m_top - rectParent.m_top;
		}

		if(sizingFlags & CONTROLSIZINGMANAGER_RIGHT)
		{
			rectManaged.m_right = rectParent.m_right - rectChild.m_right;
		}

		if(sizingFlags & CONTROLSIZINGMANAGER_BOTTOM)
		{
			rectManaged.m_bottom = rectParent.m_bottom - rectChild.m_bottom;
		}

		rectManaged.m_flags = sizingFlags;

		// Store the control name for later use... 
		//
		this.m_controls[controlName] = rectManaged;
	}



	// Method:	OnSize
	// Description: Call this from the document body OnSize() handler. 
	//
	function	OnSize()
	{
		// First of all, ensure that the size of the enclosing DIV will not 		
		//
		var theWidth  = this.m_document.body.clientWidth  - this.m_padding;
		var theHeight = this.m_document.body.clientHeight - this.m_padding;

		if(theWidth < this.m_iMinWidth) theWidth = this.m_iMinWidth;
		if(theWidth > this.m_iMaxWidth) theWidth = this.m_iMaxWidth;

		if(theHeight < this.m_iMinHeight) theHeight = this.m_iMinHeight;
		if(theHeight > this.m_iMaxHeight) theHeight = this.m_iMaxHeight;

		this.m_document.all(this.m_divName).style.pixelWidth  = theWidth;
		this.m_document.all(this.m_divName).style.pixelHeight = theHeight;

		for(theControl in this.m_controls)
		{
			var thePosition = this.m_controls[theControl];

			// ASSERTION: thePostion is the position information for the control we are 
			//	      repositioning. 
			var rectParent  = new ControlSizingManager_PositionInfo();
			var rectChild   = new ControlSizingManager_PositionInfo();
	
			rectParent.m_left      = this.m_document.all(this.m_divName).style.pixelLeft;
			rectParent.m_right     = this.m_document.all(this.m_divName).style.pixelWidth + rectParent.m_left;
			rectParent.m_top       = this.m_document.all(this.m_divName).style.pixelTop;
			rectParent.m_bottom    = this.m_document.all(this.m_divName).style.pixelHeight + rectParent.m_top;

			rectChild.m_left      = this.m_document.all(theControl).style.pixelLeft;
			rectChild.m_right     = this.m_document.all(theControl).style.pixelWidth + rectChild.m_left;
			rectChild.m_top       = this.m_document.all(theControl).style.pixelTop;
			rectChild.m_bottom    = this.m_document.all(theControl).style.pixelHeight + rectChild.m_top;			

			// We will update the properties of rectChild as we determine 
			// its bounds. 
			//
			if(thePosition.m_flags & CONTROLSIZINGMANAGER_RIGHT)
			{
				if(thePosition.m_right != 0x80000000)
				{
					var cx = rectChild.m_right - rectChild.m_left;
					rectChild.m_right = rectParent.m_right - thePosition.m_right;
					rectChild.m_left = rectChild.m_right - cx;
				}
			}

			if(thePosition.m_flags & CONTROLSIZINGMANAGER_LEFT)
			{
				if(thePosition.m_left != 0x80000000)
				{
					rectChild.m_left = rectParent.m_left + thePosition.m_left;
				}
			}

			if(thePosition.m_flags & CONTROLSIZINGMANAGER_BOTTOM)
			{
				if(thePosition.m_bottom != 0x80000000)
				{
					var cy = rectChild.m_bottom - rectChild.m_top;
					rectChild.m_bottom = rectParent.m_bottom - thePosition.m_bottom;
					rectChild.m_top = rectChild.m_bottom - cy;
				}
			}

			if(thePosition.m_flags & CONTROLSIZINGMANAGER_TOP)
			{
				if(thePosition.m_top != 0x80000000)
				{
					rectChild.m_top = rectParent.m_top + thePosition.m_top;
				}
			}

			// ASSERTION: We have the position of the control we want in rectChild. Update the 
			//	      controls on the display. 
			this.m_document.all(theControl).style.pixelLeft  = rectChild.m_left;
			this.m_document.all(theControl).style.pixelWidth = rectChild.m_right - rectChild.m_left;
			this.m_document.all(theControl).style.pixelTop   = rectChild.m_top;
			this.m_document.all(theControl).style.pixelHeight= rectChild.m_bottom - rectChild.m_top;
		}
	}
}
