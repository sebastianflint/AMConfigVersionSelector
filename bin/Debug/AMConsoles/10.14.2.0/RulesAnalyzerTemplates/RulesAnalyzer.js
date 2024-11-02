var language = navigator.browserLanguage;
if (language === "") language = "en-us";
var regValue = getLanguageFromHost();
if (regValue !== "") language = regValue;

var translations = getTranslations();
var explanationsXML = getExplanationsXML();

var filterIncludeOverwriteRenameRequests = true;

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

    xmlDoc.load(explanationsXML);
    if (xmlDoc.parseError.errorCode)
    {
        alert("Error loading XML: " + xmlDoc.parseError.reason);
    }

    // reparse the document
    var xslProc = xslt.createProcessor();
    xslProc.input = xmlDoc;
       
    xslProc.addParameter("explain", item);

    //Translations
    xslProc.addParameter("explanationof", translations["explanationof"]);
    xslProc.addParameter("group", translations["group"]);
    xslProc.addParameter("default", translations["adefault"]);
    xslProc.addParameter("user", translations["user"]);
    xslProc.addParameter("aaduser", translations["aaduser"]);
    xslProc.addParameter("aadgroup", translations["aadgroup"]);
    xslProc.addParameter("device", translations["device"]);
    xslProc.addParameter("exemptions", translations["exemptions"]);
    xslProc.addParameter("custom", translations["custom"]);
    xslProc.addParameter("process", translations["process"]);
    xslProc.addParameter("deny", translations["deny"]);
    xslProc.addParameter("allow", translations["allow"]);
    xslProc.addParameter("matchedterm", translations["matchedterm"]);
    xslProc.addParameter("trustedownership", translations["trustedownership"]);
    xslProc.addParameter("denyscriptfileprogram", translations["denyscriptfileprogram"]);
    xslProc.addParameter("systemprocess", translations["systemprocess"]);
    xslProc.addParameter("clientmappeddrive", translations["clientmappeddrive"]);
    xslProc.addParameter("prohibitedmedia", translations["prohibitedmedia"]);
    xslProc.addParameter("remotefile", translations["remotefile"]);
    xslProc.addParameter("localfile", translations["localfile"]);
    xslProc.addParameter("none", translations["none"]);
    xslProc.addParameter("limit", translations["limit"]);
    xslProc.addParameter("exempt", translations["exempt"]);
    xslProc.addParameter("accessiblesignature", translations["accessiblesignature"]);
    xslProc.addParameter("prohibitedsignature", translations["prohibitedsignature"]);
    xslProc.addParameter("accessiblefile", translations["accessiblefile"]);
    xslProc.addParameter("prohibitedfile", translations["prohibitedfile"]);
    xslProc.addParameter("prohibitedfolder", translations["prohibitedfolder"]);
    xslProc.addParameter("accessiblefolder", translations["accessiblefolder"]);
    xslProc.addParameter("accessibledrive", translations["accessibledrive"]);
    xslProc.addParameter("prohibiteddrive", translations["prohibiteddrive"]);
    xslProc.addParameter("fileextension", translations["fileextension"]);
    xslProc.addParameter("selfauthorized", translations["selfauthorized"]);
    xslProc.addParameter("fileexists", translations["fileexists"]);
    xslProc.addParameter("filenotfound", translations["filenotfound"]);
    xslProc.addParameter("internal", translations["internal"]);
    xslProc.addParameter("logon", translations["logon"]);
    xslProc.addParameter("noconfiguration", translations["noconfiguration"]);
    xslProc.addParameter("safespacefile", translations["safespacefile"]);
    xslProc.addParameter("safespacesignature", translations["safespacesignature"]);
    xslProc.addParameter("safespacefolder", translations["safespacefolder"]);
    xslProc.addParameter("safespace", translations["safespace"]);
    xslProc.addParameter("selfauthorizednative", translations["selfauthorizednative"]);
    xslProc.addParameter("selfauthorizedinasafespace", translations["selfauthorizedinasafespace"]);
    xslProc.addParameter("scripted", translations["scripted"]);
    xslProc.addParameter("trustedapplication", translations["trustedapplication"]);
    xslProc.addParameter("trustedcontent", translations["trustedcontent"]);
    xslProc.addParameter("trustedvendors", translations["trustedvendors"]);
    xslProc.addParameter("certificatevalid", translations["certificatevalid"]);
    xslProc.addParameter("defaultroute", translations["defaultroute"]);
    xslProc.addParameter("networkitemresource", translations["networkitemresource"]);
    xslProc.addParameter("networkitemhost", translations["networkitemhost"]);
    xslProc.addParameter("userrightsmodified", translations["userrightsmodified"]);
    xslProc.addParameter("userrightselevated", translations["userrightselevated"]);
    xslProc.addParameter("userrightsrestricted", translations["userrightsrestricted"]);
    xslProc.addParameter("activex", translations["activex"]);
    xslProc.addParameter("activexelevated", translations["activexelevated"]);
    xslProc.addParameter("activexrestricted", translations["activexrestricted"]);
    xslProc.addParameter("file", translations["file"]);
    xslProc.addParameter("builtinfile", translations["builtinfile"]);
    xslProc.addParameter("signature", translations["signature"]);
    xslProc.addParameter("folder", translations["folder"]);
    xslProc.addParameter("selfelevated", translations["selfelevated"]);
    xslProc.addParameter("userrequestedrulechange", translations["userrequestedrulechange"]);
    xslProc.addParameter("builtincomcomponent", translations["builtincomcomponent"]);
    xslProc.addParameter("uninstallcontrol", translations["uninstallcontrol"]);
    xslProc.addParameter("servicecontrol", translations["servicecontrol"]);
    xslProc.addParameter("eventlogcontrol", translations["eventlogcontrol"]);
    xslProc.addParameter("prohibitedwinstoreapp", translations["prohibitedwinstoreapp"]);
    xslProc.addParameter("accessiblewinstoreapp", translations["accessiblewinstoreapp"]);
    xslProc.addParameter("windowsstorepackagedapp", translations["windowsstorepackagedapp"]);
    xslProc.addParameter("prohibitedwinstoreapppublisher", translations["prohibitedwinstoreapppublisher"]);
    xslProc.addParameter("accessiblewinstoreapppublisher", translations["accessiblewinstoreapppublisher"]);
    xslProc.addParameter("urldirect", translations["urldirect"]);
    xslProc.addParameter("redirectedurl", translations["redirectedurl"]);
    xslProc.addParameter("urlallow", translations["urlallow"]);
    xslProc.addParameter("allowedurl", translations["allowedurl"]);
    xslProc.addParameter("urlelevate", translations["urlelevate"]);
    xslProc.addParameter("elevatedwebsite", translations["elevatedwebsite"]);
    xslProc.addParameter("exemptfromurlredirection", translations["exemptfromurlredirection"]);
    xslProc.addParameter("exemptfromurlelevation", translations["exemptfromurlelevation"]);
    xslProc.addParameter("userrightsdefault", translations["userrightsdefault"]);
    xslProc.addParameter("processterminationcontrolfile", translations["processterminationcontrolfile"]);
    xslProc.addParameter("processterminationcontrolfolder", translations["processterminationcontrolfolder"]);
    xslProc.addParameter("uacreplacement", translations["uacreplacement"]);
    //Translations End

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

    // Restore any scroll position before the individual request was shown.
    if (typeof window.scrollPosBeforeRequest != "undefined") {
        window.scrollTo(window.scrollPosBeforeRequest.x, window.scrollPosBeforeRequest.y);
    }
}



function showSingleRequest(id) {
    // create the parser for the document
    var xslt = new ActiveXObject("Msxml2.XSLTemplate");
    var xslDoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument");

    xslDoc.async = false;
    xslDoc.resolveExternals = false;
    xslDoc.validateOnParse = false;

    xslDoc.load("RequestView.xsl");
    if (xslDoc.parseError.errorCode) {
        alert("Error loading XSL: " + xslDoc.parseError.reason);
    }

    xslt.stylesheet = xslDoc;

    var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");

    xmlDoc.async = false;
    xmlDoc.resolveExternals = false;
    xmlDoc.validateOnParse = false;

    xmlDoc.load("FileItem.xml");
    if (xmlDoc.parseError.errorCode) {
        alert("Error loading XML: " + xmlDoc.parseError.reason);
    }

    // reparse the document
    var xslProc = xslt.createProcessor();
    xslProc.input = xmlDoc;

    xslProc.addParameter("display-filter", "single");
    xslProc.addParameter("request-filter", id);

    //Translations
    xslProc.addParameter("requestinformation", translations["requestinformation"]);
    xslProc.addParameter("fileinformation", translations["fileinformation"]);
    xslProc.addParameter("userinformation", translations["userinformation"]);
    xslProc.addParameter("overallresult", translations["overallresult"]);
    xslProc.addParameter("ruleresult", translations["ruleresult"]);
    xslProc.addParameter("user", translations["user"]);
    xslProc.addParameter("aaduser", translations["aaduser"]);
    xslProc.addParameter("aadgroup", translations["aadgroup"]);
    xslProc.addParameter("timinginformation", translations["timinginformation"]);
    xslProc.addParameter("time", translations["time"]);
    xslProc.addParameter("allow", translations["allow"]);
    xslProc.addParameter("default", translations["adefault"]);
    xslProc.addParameter("defaultrules", translations["defaultrules"]);
    xslProc.addParameter("exemptions", translations["exemptions"]);
    xslProc.addParameter("none", translations["none"]);
    xslProc.addParameter("group", translations["group"]);
    xslProc.addParameter("exempt", translations["exempt"]);
    xslProc.addParameter("execute", translations["execute"]);
    xslProc.addParameter("overwrite", translations["overwrite"]);
    xslProc.addParameter("rename", translations["rename"]);
    xslProc.addParameter("printpage", translations["printpage"]);
    xslProc.addParameter("return", translations["areturn"]);
    xslProc.addParameter("summary", translations["summary"]);
    xslProc.addParameter("urlinformation", translations["urlinformation"]);
    xslProc.addParameter("requestedurl", translations["requestedurl"]);
    xslProc.addParameter("redirectionurl", translations["redirectionurl"]);
    xslProc.addParameter("browser", translations["browser"]);
    xslProc.addParameter("file", translations["file"]);
    xslProc.addParameter("arguments", translations["arguments"]);
    xslProc.addParameter("owner", translations["owner"]);
    xslProc.addParameter("device", translations["device"]);
    xslProc.addParameter("parent", translations["parent"]);
    xslProc.addParameter("type", translations["type"]);
    xslProc.addParameter("deny", translations["deny"]);
    xslProc.addParameter("userprivilegesmodified", translations["userprivilegesmodified"]);
    xslProc.addParameter("urldirect", translations["urldirect"]);
    xslProc.addParameter("urlelevate", translations["urlelevate"]);
    xslProc.addParameter("urlallow", translations["urlallow"]);
    xslProc.addParameter("impersonating", translations["impersonating"]);
    xslProc.addParameter("session", translations["session"]);
    xslProc.addParameter("clients", translations["clients"]);
    xslProc.addParameter("computer", translations["computer"]);
    xslProc.addParameter("organisationalunit", translations["organisationalunit"]);
    xslProc.addParameter("computergroups", translations["computergroups"]);
    xslProc.addParameter("ruleinformation", translations["ruleinformation"]);
    xslProc.addParameter("executedfrom", translations["executedfrom"]);
    xslProc.addParameter("matchedfilemetadata", translations["matchedfilemetadata"]);
    xslProc.addParameter("productversionminimum", translations["productversionminimum"]);
    xslProc.addParameter("productversionmaximum", translations["productversionmaximum"]);
    xslProc.addParameter("fileversionminimum", translations["fileversionminimum"]);
    xslProc.addParameter("fileversionmaximum", translations["fileversionmaximum"]);
    xslProc.addParameter("vendorname", translations["vendorname"]);
    xslProc.addParameter("companyname", translations["companyname"]);
    xslProc.addParameter("productname", translations["productname"]);
    xslProc.addParameter("filedescription", translations["filedescription"]);
    xslProc.addParameter("target", translations["target"]);
    xslProc.addParameter("trustedownership", translations["trustedownership"]);
    xslProc.addParameter("userprivilegeselevated", translations["userprivilegeselevated"]);
    xslProc.addParameter("allowedsignature", translations["allowedsignature"]);
    xslProc.addParameter("deniedsignature", translations["deniedsignature"]);
    xslProc.addParameter("allowedfile", translations["allowedfile"]);
    xslProc.addParameter("deniedfile", translations["deniedfile"]);
    xslProc.addParameter("deniedfolder", translations["deniedfolder"]);
    xslProc.addParameter("allowedfolder", translations["allowedfolder"]);
    xslProc.addParameter("alloweddrive", translations["alloweddrive"]);
    xslProc.addParameter("denieddrive", translations["denieddrive"]);
    xslProc.addParameter("userprivilegesrestricted", translations["userprivilegesrestricted"]);
    xslProc.addParameter("deniedwinstoreapp", translations["deniedwinstoreapp"]);
    xslProc.addParameter("allowedwinstoreapp", translations["allowedwinstoreapp"]);
    xslProc.addParameter("systemprocess", translations["systemprocess"]);
    xslProc.addParameter("uacreplacement", translations["uacreplacement"]);
    xslProc.addParameter("processingtime", translations["processingtime"]);
    xslProc.addParameter("date", translations["date"]);
    xslProc.addParameter("reason", translations["reason"]);
    //Translations End

    xslProc.transform();

    // Store the current scroll position so we can return to it
    window.scrollPosBeforeRequest = getScrollPositionXY();

    // display the request div and hide the main div
    var elementDiv = document.getElementById("request_view");
    var mainDiv = document.getElementById("main");

    mainDiv.style.visibility = "hidden";
    elementDiv.innerHTML = xslProc.output;

    // Get the date and sent it to the host to convert to current culture
    var dateValue = elementDiv.document.getElementById("date");
    dateValue.innerText = window.external.SetDateToCorrectCulture(dateValue.innerText);

    elementDiv.style.visibility = "visible";

    window.scroll(0, 0);
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
    xslProc.addParameter("user-filter", user);
    xslProc.addParameter("filterIncludeOverwriteRenameRequests", filterIncludeOverwriteRenameRequests);

    //Translations
    xslProc.addParameter("applicationcontrolagent", translations["applicationcontrolagent"]);
    xslProc.addParameter("user", translations["user"]);
    xslProc.addParameter("starttime", translations["starttime"]);
    xslProc.addParameter("currentlyviewing", translations["currentlyviewing"]);
    xslProc.addParameter("userprivilegesmodified", translations["userprivilegesmodified"]);
    xslProc.addParameter("requests", translations["requests"]);
    xslProc.addParameter("for", translations["afor"]);
    xslProc.addParameter("browsercontrol", translations["browsercontrol"]);
    xslProc.addParameter("closewindow", translations["closewindow"]);
    xslProc.addParameter("requestinformation", translations["requestinformation"]);
    xslProc.addParameter("requestgeneratedusingconfiguration", translations["requestgeneratedusingconfiguration"]);
    xslProc.addParameter("version", translations["version"]);
    xslProc.addParameter("fileinformation", translations["fileinformation"]);
    xslProc.addParameter("file", translations["file"]);
    xslProc.addParameter("prohibitedurl", translations["prohibitedurl"]);
    xslProc.addParameter("redirectedurl", translations["redirectedurl"]);
    xslProc.addParameter("owner", translations["owner"]);
    xslProc.addParameter("parent", translations["parent"]);
    xslProc.addParameter("device", translations["device"]);
    xslProc.addParameter("type", translations["type"]);
    xslProc.addParameter("execute", translations["execute"]);
    xslProc.addParameter("overwrite", translations["overwrite"]);
    xslProc.addParameter("rename", translations["rename"]);
    xslProc.addParameter("result", translations["result"]);
    xslProc.addParameter("userinformation", translations["userinformation"]);
    xslProc.addParameter("impersonating", translations["impersonating"]);
    xslProc.addParameter("session", translations["session"]);
    xslProc.addParameter("client", translations["client"]);
    xslProc.addParameter("computer", translations["computer"]);
    xslProc.addParameter("timinginformation", translations["timinginformation"]);
    xslProc.addParameter("time", translations["time"]);
    xslProc.addParameter("date", translations["date"]);
    xslProc.addParameter("processingtime", translations["processingtime"]);
    xslProc.addParameter("ruleinformation", translations["ruleinformation"]);
    xslProc.addParameter("milliseconds", translations["milliseconds"]);
    xslProc.addParameter("executedfrom", translations["executedfrom"]);
    xslProc.addParameter("rulename", translations["rulename"]);
    xslProc.addParameter("explanation", translations["explanation"]);
    xslProc.addParameter("printpage", translations["printpage"]);
    xslProc.addParameter("return", translations["areturn"]);
    xslProc.addParameter("therequestscontainedinthisfileweregeneratedinthfollowingperiod", translations["therequestscontainedinthisfileweregeneratedinthfollowingperiod"]);
    xslProc.addParameter("firstrequest", translations["firstrequest"]);
    xslProc.addParameter("lastrequest", translations["lastrequest"]);
    xslProc.addParameter("on", translations["on"]);
    xslProc.addParameter("thefollowingtableprovidesasummaryoftherequeststhatarecontainedwiththefile", translations["thefollowingtableprovidesasummaryoftherequeststhatarecontainedwiththefile"]);
    xslProc.addParameter("total", translations["total"]);
    xslProc.addParameter("allowed", translations["allowed"]);
    xslProc.addParameter("denied", translations["denied"]);
    xslProc.addParameter("viewtherequestsbyprocessingtime", translations["viewtherequestsbyprocessingtime"]);
    xslProc.addParameter("all", translations["all"]);
    xslProc.addParameter("filterOverwriteRenameCheckboxText", translations["filterOverwriteRenameCheckboxText"]);
    //Translations End

    xslProc.transform();    
    

    // ensure that the main DIV is visible and the request DIV is hidden	
    var elementDiv = document.getElementById("request_view");
    var mainDiv = document.getElementById("main");
    
    elementDiv.style.visibility = "hidden";

    mainDiv.innerHTML = xslProc.output;
    mainDiv.style.visibility = "visible";
}


function getLanguageFromHost() {

  // Go to the AMConsole and get the language to use
  return window.external.GetLanguage();
}

function getTranslations() {

    switch (language.toLowerCase()) {
        case "de":
        case "de-de":
            return deTranslations();

        case "es":
        case "es-es":
            return esTranslations();

        case "fr":
        case "fr-fr":
            return frTranslations();

        case "it":
        case "it-it":
            return itTranslations();

        case "ja":
        case "ja-jp":
            return jaTranslations();

        case "nl":
        case "nl-nl":
            return nlTranslations();

        case "pt-BR":
            return ptbrTranslations();

        case "ru":
        case "ru-ru":
            return ruTranslations();

        case "zh-hans":
        case "zh-cn":
        case "zh-sg":
        case "zh-chs":
            return zhhansTranslations();

        case "zh-hant":
        case "zh-tw":
        case "zh-hk":
        case "zh-mo":
        case "zh-cht":
            return zhhantTranslations();

        default:
            return enTranslations();
    }
}

function getExplanationsXML() {
   
    var explanations = "Explanations.xml";

    switch (language.toLowerCase()) {
        case "de":
        case "de-de":
            explanations = "Explanations-de.xml";
            break;
        case "es":
        case "es-es":
            explanations = "Explanations-es.xml";
            break;
        case "fr":
        case "fr-fr":
            explanations = "Explanations-fr.xml";
            break;
        case "it":
        case "it-it":
            explanations = "Explanations-it.xml";
            break;
        case "ja":
        case "ja-jp":
            explanations = "Explanations-ja.xml";
            break;
        case "nl":
        case "nl-nl":
            explanations = "Explanations-nl.xml";
            break;
        case "pt-BR":
            explanations = "Explanations-pt-BR.xml";
            break;
        case "ru":
        case "ru-ru":
            explanations = "Explanations-ru.xml";
            break;
        case "zh-hans":
        case "zh-cn":
        case "zh-sg":
        case "zh-chs":
            explanations = "Explanations-zh-Hans.xml";
            break;
        case "zh-hant":
        case "zh-tw":
        case "zh-hk":
        case "zh-mo":
        case "zh-cht":
            explanations = "Explanations-zh-hant.xml";
            break;
    }

    return explanations;
}


function getScrollPositionXY() {
    return { x: document.body.scrollLeft, y: document.body.scrollTop };
}

function handleFilterIncludeOverwriteRenameClick(cb) {

    filterIncludeOverwriteRenameRequests = cb.checked;    

    showRequests("summary", "none");
}
