

function showExplanation(item)
{
	var xslt = new ActiveXObject("Msxml2.XSLTemplate");	
	var xslDoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument");
	
	xslDoc.async = false;
	xslDoc.resolveExternals = false;
	xslDoc.validateOnParse = false;
    xslDoc.load("Explanations.xsl");
	if (xslDoc.parseError.errorCode)
	{
		alert("Error loading XSL: " + xslDoc.parseError.reason);
	}

    xslt.stylesheet = xslDoc;
        
    var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
		        
	xmlDoc.async = false;
	xmlDoc.resolveExternals = false;
	xmlDoc.validateOnParse = false;
	
	xmlDoc.load("Explanations.xml");
	if (xmlDoc.parseError.errorCode)
	{
		alert("Error loading XML: " + xmlDoc.parseError.reason);
	}

	// reparse the document
    var xslProc = xslt.createProcessor();
    xslProc.input = xmlDoc;
	   
    xslProc.addParameter("explain", item);
	xslProc.transform();    	
	
	
	var oPopup = window.createPopup();
	var oPopupBody = oPopup.document.body;
	oPopupBody.style.border = "solid blue 3px";
	oPopupBody.innerHTML = xslProc.output;
	oPopup.show(500, 300, 400, 250, document.body);
}



function printPage()
{
	window.print();
}


function closeSingleRequest()
{
	var elementDiv = document.getElementById("request_view");
	var mainDiv = document.getElementById("main");

	elementDiv.style.visibility = "hidden";
	mainDiv.style.visibility = "visible";
}



function showSingleRequest(id)
{
	// create the parser for the document
	var xslt = new ActiveXObject("Msxml2.XSLTemplate");	
	var xslDoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument");
	
	xslDoc.async = false;
	xslDoc.resolveExternals = false;
	xslDoc.validateOnParse = false;
    xslDoc.load("RequestView.xsl");
	if (xslDoc.parseError.errorCode)
	{
		alert("Error loading XSL: " + xslDoc.parseError.reason);
	}

    xslt.stylesheet = xslDoc;
        
    var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
		        
	xmlDoc.async = false;
	xmlDoc.resolveExternals = false;
	xmlDoc.validateOnParse = false;
	
	xmlDoc.load("FileItem.xml");
	if (xmlDoc.parseError.errorCode)
	{
		alert("Error loading XML: " + xmlDoc.parseError.reason);
	}

	// reparse the document
    var xslProc = xslt.createProcessor();
    xslProc.input = xmlDoc;
	   
    xslProc.addParameter("display-filter", "single");
    xslProc.addParameter("request-filter", id);
	xslProc.transform();    

	// display the request div and hide the main div
	var elementDiv = document.getElementById("request_view");
	var mainDiv = document.getElementById("main");

	mainDiv.style.visibility = "hidden";
	elementDiv.innerHTML = xslProc.output;
	elementDiv.style.visibility = "visible";

	window.scroll(0,0);
}



function showRequests(filter, user)
{
	// create the relevant objects to enable us to re-parse the document
	var xslt = new ActiveXObject("Msxml2.XSLTemplate");	
	var xslDoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument");
	
	xslDoc.async = false;
	xslDoc.resolveExternals = false;
	xslDoc.validateOnParse = false;
    xslDoc.load("FileView.xsl");

    xslt.stylesheet = xslDoc;
        
    var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
		        
	xmlDoc.async = false;
	xmlDoc.resolveExternals = false;
	xmlDoc.validateOnParse = false;
	
	xmlDoc.load("FileItem.xml");
	if (xmlDoc.parseError.errorCode)
	{
		alert("Error loading XML: " + xmlDoc.parseError.reason);
	}

	// reparse the document
    var xslProc = xslt.createProcessor();
    xslProc.input = xmlDoc;
	   
    xslProc.addParameter("display-filter", filter);
    xslProc.addParameter("user-filter", user)
	xslProc.transform();    
	

	// ensure that the main DIV is visible and the request DIV is hidden	
	var elementDiv = document.getElementById("request_view");
	var mainDiv = document.getElementById("main");
	
	elementDiv.style.visibility = "hidden";

	mainDiv.innerHTML = xslProc.output;
	mainDiv.style.visibility = "visible";
}

