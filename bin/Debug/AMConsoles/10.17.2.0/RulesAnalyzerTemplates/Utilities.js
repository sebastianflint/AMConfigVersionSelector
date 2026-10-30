// Module:	Utilities
// Description: Provides a number of helper utilities that we need in the GUI. To use this, create a global object
//              called "Utility" and then invoke the individual methods at will. 
//
// Author:      Graham Stephenson, 19-Oct-2004
//


// Method:      Utilities (Constructor)
// Description: Construct the object you will use for access methods. Technically, we could just use global
//              methods to provide this functionality but it is far better encapsulated inside an object. 
// 
function	Utilities()
{
	this.CollectionToCSVString = CollectionToCSVString;



	// Method:	CollectionToCSVString
	// Description: Given a collection, this will concatenate the "property" value from each entry into
	//              a string and return it. 
	//
	function	CollectionToCSVString(theCollection, theProperty)
	{
		var e = new Enumerator(theCollection);
		var strResult = "";
		var comma = "";

		// alert(theCollection.XML);
		// alert(theProperty);	
	
		while(!e.atEnd())
		{
			var theItem = e.item();

			strResult = strResult + comma;
			strResult = strResult + theItem[theProperty];

			comma = ", ";

			e.moveNext();
		}

		return strResult;
	}
}
