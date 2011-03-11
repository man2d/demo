// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function slideSwitch(el) {
	
    var active = jQuery('#slideShow img.active');


    if ( active.length == 0 ) active = jQuery('#slideShow img:last');

    var next =  active.next().length ? active.next()
        : jQuery('#slideShow img:first');

    active.addClass('last-active');

    next.css({opacity: 0.0})
        .addClass('active')
        .animate({opacity: 1.0}, 1000, function() {
            active.removeClass('active last-active');
        });
}

(function($){  


$('ul.tabs a').live('click', function() {
  $('div#tabs > div').hide();
  $('ul.tabs li').removeClass('current');
  $(this).parents('li').addClass('current');
  $('div#tabs > div#'+$(this).attr('rel')).show();	
});

$('a[rel=interior]').live('click', function() {
	$('#interior').css('position', 'relative').css('left','0').css('top', '0');
});
$('a[rel=exterior]').live('click', function() {
	$('#exterior').css('position', 'relative').css('left','0').css('top', '0');
});

$('.toggle').live('click', function() {
  $('#'+$(this).attr('rel')).slideToggle();
});

$('.yaht_load').live('mouseenter', function(){
  var id = $(this).attr('id').split('_')[1];
  var el = $(this);
  $.get('/items/'+id, function(data){
    el.append(data);
  });
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


/** Слайдшоу **/
/*var int = self.setInterval( "slideSwitch()", 1000 );
$('.points a').click(function(){
	int=window.clearInterval(int)
});*/
  
})(jQuery);

jQuery(document).ready(function(){
  

});

(function($) {
	
});

