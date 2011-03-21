$(document).ready(function (){  

   $('.contextMenu li.close a').live('click', function() {
	 $('.contextMenu').remove();
   });
   $('.context').live('click', function() {
     $('.contextMenu').remove();
	 var el = $(this);
	 var id = $(this).attr('id').split('_')[1];
	 var controller = $(this).attr('id').split('_')[0]+'s';

	 var url = '/admin/'+controller+'/'+id+'/menu';

	 $.get(url, function(result) {
		el.parents('span').append(result);
    });
   });

	var app = $.sammy('#pages', function() {


        //$('td.level_0 ul.tree li').show();
      this.get('#/', function(context) {
	
        $('ul.tree li.page_list_item').hide();
				
		//$('td.level_0 ul.tree li').show();
      });

      this.get('#/page/(.*?)', function(context) {

        $('ul.tree li.page_list_item').hide();
	    context.log(this.params['splat'][0]);
	    var ids = this.params['splat'][0].split('/');
	    var last_id = ids[ids.length-1];
	    
	    
	   
	    $.each(ids, function(key, val) {
		 if($('ul.tree li.parent_'+val).length != 0) {			
		   $('ul.tree li.parent_'+val).show();
		   $('table#pages td ul').removeClass('sortable');
		   $('table#pages td[class=level_'+last_id+'] ul').addClass('sortable');
		 } else {
		   //try load some new data or redirect to edit page!	

		  if($('a#page_'+val).parent('.parent').children('a.items').length) {
		    $.getJSON('/admin/items.json?page_id='+val, function(data) {
//			  	var items = new Array();
//				   items[0] = new Array();
/*				   $.each(data, function(key, val) {

				    var item = val.item;
				    if(!items[item.level]) items[item.level] = new Array();
		//		    context.log(item);
				    items[item.level][item.id] = item;
				  });*/
				 //context.log(items);
				var display = '';	

				    var key = $('table#pages td:last').attr('class').split("_")[1]+1;

				    html = '<td class="level_'+key+'"><ul class="tree pages'+sortable+'" id="items">';
				      for(id in data) {
//					   console.log(data[id]);
					    var item = data[id].item;
				//console.log(key);

					    html += '<li '+display+' class="page_list_item parent_'+item.page_id+'" id="item_'+item.id+'"><span class="parent"><a class="pic context" id="item_'+item.id+'" href="#"></a><a href="#/page/'+'">'+item.title+' '+item.lgth+'</a></span></li>';
				      }
				    html += '</ul></td>';
				    //context.log(html);
				    $('table#pages tr').append(html);
				$('ul#items').sortable(	{

					cursor: 'crosshair',
					items: 'li',

					opacity: 0.4,

					update: function(){
					$.ajax({
					type: 'post',
					data: $(this).sortable('serialize'),
					dataType: 'script',
					complete: function(request){
					$('ul.sortable').effect('highlight');
					},
					url: '/admin/sort/'+$(this).attr('id')})
					}
					});
				
		    });	
		  }
//		   window.location.href = '/admin/pages/'+last_id+'/edit';
		 }
	    });
	    $('ul.tree li.parent_0.page_list_item').show();
      });
    });
    

	$(function() {
		if($('table#pages').length){
		var last_level = 0;
		var display;
  		$.getJSON('/admin/pages.json', function(data){
		   var items = new Array();
		   items[0] = new Array();
		   $.each(data, function(key, val) {

		    var item = val.page;
		    if(!items[item.level]) items[item.level] = new Array();
//		    context.log(item);
		    items[item.level][item.id] = item;
		    if(item.level > last_level) {
			  last_level = item.level;
		    }
		  });
		 //context.log(items);

		  for(key in items) {
			if(key == last_level) {
				sortable = " sortable";
			} else {
				sortable = "";
			}
		    html = '<td class="level_'+key+'"><ul class="tree pages'+sortable+'" id="pages">';
		      for(id in items[key]) {
			    var page = items[key][id];
			    if(!page.parent_id) {
			      page.parent_id = 0;
			    }
		//console.log(key);
			    if(key != 0) {
				  display = 'style="display:none;"'
			    }
				items_load_class = '';
				if(page.resource == 'catalog/index') {
					items_load_class='class="items"';
				}
			    html += '<li '+display+' class="page_list_item parent_'+page.parent_id+'" id="page_'+page.id+'"><span class="parent"><a class="pic context" id="page_'+page.id+'" href="#"></a><a '+items_load_class+' href="#/page/'+page.admin_path+'">'+page.title+'</a></span></li>';
		      }
		    html += '</ul></td>';
		    //context.log(html);
		    $('table#pages tr').append(html);
		  }
		});
        $('ul.tree li.page_list_item').hide();
	  
        app.run('#/');
	}
    });

	
});

$(document).ready(function(){
	$('#page_title').keyup(function(){
	  if($(this).attr('data-new') == 'true') {
	    $('#page_slug').val(translit($(this).val()));
      }
	});
	
	$('a.collapse').live('click', function(){
		$('div.'+$(this).attr('rel')).toggle('slow');
	});
	$('textarea.ckeditor_textarea').ckeditor();

	var sortable_options = {
	
	cursor: 'crosshair',
	items: 'li.sort',

	opacity: 0.4,

	update: function(){
	$.ajax({
	type: 'post',
	data: $(this).sortable('serialize'),
	dataType: 'script',
	complete: function(request){
	$('ul.sortable').effect('highlight');
	},
	url: '/admin/sort/'+$(this).attr('id')})
	}
	};
	
	//$('ul.sortable').sortable();
	//$('li').disableSelection();
	$('ul.sortable').sortable({
	cursor: 'crosshair',
	items: 'li',
	opacity: 0.4,
	update: function(){
	$.ajax({
	type: 'post',
	data: $(this).sortable('serialize'),
	dataType: 'script',
	complete: function(request){
	$('ul.sortable').effect('highlight');
	},
	url: '/admin/sort/'+$(this).attr('id')})
	}
	});
	
	$('ul.pages li').live('click', function() {
		var id = $(this).attr('id').split("_")[1];
		$('li').removeClass('sort');
		$('li.parent_'+id).addClass('sort').parents('ul').addClass('sortable').sortable(sortable_options);
		
	});
});

function remove_fields(link) {  
     $(link).prev("input[type=hidden]").val("1");  
     $(link).closest(".fields").hide();  
}  
   
function add_fields(link, association, content) {  
     var new_id = new Date().getTime();  
     var regexp = new RegExp("new_" + association, "g");  
     $(link).parent().after(content.replace(regexp, new_id));  
     $('textarea.ckeditor_textarea').ckeditor();
}


function translit(textus) {
	var rusChars = new Array('а','б','в','г','д','е','ё','ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч','ц','ш','щ','э','ю','\я','ы','ъ','ь', ' ', '\'', '\"', '\#', '\$', '\%', '\&', '\*', '\,', '\:', '\;', '\<', '\>', '\?', '\[', '\]', '\^', '\{', '\}', '\|', '\!', '\@', '\(', '\)', '\-', '\=', '\+', '\/', '\\',' ');
	var transChars = new Array('a','b','v','g','d','e','jo','zh','z','i','j','k','l','m','n','o','p','r','s','t','u','f','h','ch','c','sh','csh','e','ju','ja','y','', '', ' ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '_');
	var from = textus.toString().toLowerCase();
    var to = "";
    var len = from.length;
    var character, isRus;
    for(var i=0; i < len; i++)
    {
      character = from.charAt(i,1);
      isRus = false;
      for(var j=0; j < rusChars.length; j++)
      {
        if(character == rusChars[j])
        {
          isRus = true;
          break;
        }
      }
    to += (isRus) ? transChars[j] : character;
    }
   return to.replace(' ','_');
}
