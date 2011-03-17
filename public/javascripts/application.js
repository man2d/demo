(function($){  

/*
	$('a[rel=interior]').live('click', function() {
		$('#interior').css('position', 'relative').css('left','0').css('top', '0');
	});
	$('a[rel=exterior]').live('click', function() {
		$('#exterior').css('position', 'relative').css('left','0').css('top', '0');
	});


$('ul.tabs a, .sub3 a').live('click', function() {
  $('div#tabs > div').hide();
  $('ul.tabs li').removeClass('current');
  $(this).parents('li').addClass('current');
  $('div#tabs > div#'+$(this).attr('rel')).show();	
});
*/

$('.filter_ul a').live('click', function() {
  $(this).parents('ul').children('li').removeClass('current');
  $(this).parents('li').addClass('current');
  $('form#filterForm input#'+$(this).attr('rel')).val($(this).attr('data'));
  $('form#filterForm').submit();
});

$('.comparison').live('click', function(){
  $(this).toggleClass('add').toggleClass('remove');	
  if($(this).text() == "Добавить к сравнению") {
	$(this).text("Убрать из сравнения");
  } else {
	$(this).text("Добавить к сравнению");	
  }
});
var from=1;
$('.compare_result .prev').live('click', function(){
	if(from >= 2) {
	from--;
	$('.row_'+(from+5).toString()).animate({width: 0, opacity: 0}, 1000);
	$('.row_'+(from).toString()).animate({width: 136, opacity: 1}, 1000);	
	$('.compare_result .next').show();
	if(from == 1) $(this).hide();
	} else {
		$(this).hide();
	}
});
$('.compare_result .next').live('click', function(){
	if(compareItems-5 >= from) {
	from++;
	$('.row_'+(from-1).toString()).animate({width: 0, opacity: 0}, 1000);	
	$('.row_'+(from+4).toString()).animate({width: 136, opacity: 1}, 1000);
	$('.compare_result .prev').show();
	if(from+4 == compareItems) $(this).hide();
	} else {
		$(this).hide();
	}
});

$('.toggle').live('click', function() {
  $('#'+$(this).attr('rel')).slideToggle();
});

$('.yaht_load').live('mouseenter', function(){
  var id = $(this).attr('id').split('_')[1];
  var el = $(this);
//  if(!$(this).children("div.sub3").length) {

  $.get('/items/'+id, function(data){
    el.append(data);
    el.removeClass('yaht_load');
  });
//  }
});

$('#carinfo_toggle').live('click', function() {
  $('table.carinfo_table').show();
  $('#carinfo_description').hide();
  $(this).addClass('current'); $('#description_toggle').removeClass('current');
});
$('#description_toggle').live('click', function() { 
  $('table.carinfo_table').hide();
  $('#carinfo_description').show();
  $(this).addClass('current'); $('#carinfo_toggle').removeClass('current');
});

$("div.gallery a").live('click', function() {
  $('div.gallery div.big img').attr('src', $(this).attr('rel'));
});

/*$('a.force').live('click', function() {
  document.location.href = $(this).attr('href');	
});*/

/** Слайдшоу **/
/*var int = self.setInterval( "slideSwitch()", 1000 );
$('.points a').click(function(){
	int=window.clearInterval(int)
});*/
  
})(jQuery);


jQuery(document).ready(function(){
//	$('.ContentFlow a').fancybox();
  //	var hash = window.location.hash.replace('#', '');
  //	if(hash) {
   //   $('a[rel='+hash+']').click;
//	  $('div#tabs').children('div').hide();
//	  $('div#'+hash).show();
//	}
});

$(window).load(function() {
    $('#slider').nivoSlider({
	        effect:'fold', //Specify sets like: 'fold,fade,sliceDown'
	        slices:15,
	        animSpeed:500, //Slide transition speed
	        pauseTime:3000,
	        startSlide:0, //Set starting Slide (0 index)
	        directionNav:false, //Next and Prev
	        directionNavHide:true, //Only show on hover
	        controlNav:true, //1,2,3...
	        controlNavThumbs:false, //Use thumbnails for Control Nav
	        controlNavThumbsFromRel:false, //Use image rel for thumbs
	        controlNavThumbsSearch: '.jpg', //Replace this with...
	        controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
	        keyboardNav:true, //Use left and right arrows
	        pauseOnHover:true, //Stop animation while hovering
	        manualAdvance:false, //Force manual transitions
	        captionOpacity:1.0, //Universal caption opacity
	        beforeChange: function(){},
	        afterChange: function(){},
	        slideshowEnd: function(){}, //Triggers after all slides have been shown
	        lastSlide: function(){}, //Triggers when last slide is shown
	        afterLoad: function(){} //Triggers when slider has loaded
	    });
});