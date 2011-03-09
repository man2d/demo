$(function() {
	
	$('.editable').aloha();
	$('.editable').click(function() {
		var id = $(this).attr('id');
		if(!$('#'+id+'_save').length) {
		  $(this).after('<a class="save" id="'+id+'_save">сохранить</a>');
	    }
 	});

    $('.save').live('click', function(){
	  var el_id = $(this).prev(".editable").attr("id");
	  var controller = el_id.split("_")[0];
      var id = el_id.split("_")[1];
      var field = el_id.split("_")[2];
      var content = $('#'+el_id).html();
     // var json = eval('{_method: "PUT", '+controller+': {'+field+':"' +content+ '"}}');
      var json_text = '{_method: "PUT", '+controller+': {'+field+':"' +content+ '"}}';
     var json = eval('(' + json_text + ')');

//      var json = {_method: "put", post: {announce: "XYI"}};
	  $.post("/admin/"+controller+"s/"+id+".json", json);
    });
})