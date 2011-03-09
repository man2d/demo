/*function getTypo(textus) {

});*/
//return newData;
var createXMLHttpRequest = function()
{
	// In IE, using the native XMLHttpRequest for local files may throw
	// "Access is Denied" errors.
	if ( !CKEDITOR.env.ie || location.protocol != 'file:' )
		try { return new XMLHttpRequest(); } catch(e) {}

	try { return new ActiveXObject( 'Msxml2.XMLHTTP' ); } catch (e) {}
	try { return new ActiveXObject( 'Microsoft.XMLHTTP' ); } catch (e) {}

	return null;
};

	var typographCmd =
	{
		exec : function( editor )
		{
			//console.log(editor.element.getHtml());
//			console.log(editor.element);
//			editor.element.
	       // editor.fire( 'paste', { 'text' : 'clipboardText' } );
	        //console.log(editor);
			//editor.element.setHtml("asdfasdfsadfasfd");
			var myData = editor.element.getHtml();
//			console.log(editor.element.getHtml());
			console.log(myData);
			var xhr = new createXMLHttpRequest();
			xhr.open('GET', '/', true);
			xhr.send(null);
			var newData = xhr.responseText;
			alert(xhr.responseText);
			console.log(xhr);
			console.log(editor);
			console.log(newData);
//			var newData = "asdf";
			
			var newData = CKEDITOR.ajax.loadXml('/admin/typograph/typograph', 'asdf');
			//console.log(window.getTypo(myData));
			//console.log(newData);
			editor.setData(newData);
		}
		
	};	
CKEDITOR.plugins.add('typograph', {
	init: function(editor) {
		var command = editor.addCommand("typograph", typographCmd);
     	editor.ui.addButton("typograph",{
			label:"В типографию",
			command: "typograph",
			icon:this.path+"gmap.png"
		});
	}
});