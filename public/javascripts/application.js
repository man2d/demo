(function($){  

/** Регистрация **/
$(document).ready(function(){
	$('#user_password_password').showPassword({
	 linkClass: 'showPass',
	 linkText: 'Показать пароль',
	 showPasswordLinkText: 'Скрыть пароль',
	 showPasswordInputClass: 'password-showing',
	 linkRightOffset: 0,
	 linkTopOffset: 0
	});
	
	$('form.registration input').each(function(){
	  $(this).focusin(function() {
		if($(this).val() == $(this).attr('default')) {
			$(this).val('');
		}
	  }).focusout(function() {
	    if(!$(this).val()) $(this).val($(this).attr('default'));	
	  });
	});
	

});



/** Подбор **/
$('.filter_ul a').live('click', function() {
  $(this).parents('ul').children('li').removeClass('current');
  $(this).parents('li').addClass('current');
  $('form#filterForm input#'+$(this).attr('rel')).val($(this).attr('data')); 
  $('form#filterForm').submit();
});

/** Сравнение **/
$('.compare .toggle').live('click', function() {
	$(this).toggleClass('open').toggleClass('close');
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

/** Общее **/

$('.toggle').live('click', function() {
  $('#'+$(this).attr('rel')).slideToggle();
});

$('.yaht_load').live('mouseenter', function(){
  var el = $(this);  
  var index = $(this).prevAll().length;  
  $('.sub3').hide(); el.children('.sub3').css('top', "-"+(index*22).toString()+"px").show();
}).live('mouseleave', function() { $('.sub3').hide()});

/** Галерея **/

/*
$("div.gallery a").live('click', function() {
  $('div.gallery div.big img').attr('src', $(this).attr('rel'));
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

$('a.force').live('click', function() {
  document.location.href = $(this).attr('href');	
});*/

/** Слайдшоу **/
/*var int = self.setInterval( "slideSwitch()", 1000 );
$('.points a').click(function(){
	int=window.clearInterval(int)
});*/
/*$('.showPass').live('click', function() {
	if($(this).text() == 'Показать пароль') {
//		$('#user_password').attr('type', 'text');	
		alert('#user_password_password').val();
		$(this).text('Скрыть пароль');
	} else {
		$('#user_password').attr('type', 'password')
		$(this).text('Скрыть пароль');
	}
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
	        effect:'fade', //Specify sets like: 'fold,fade,sliceDown'
	        slices:1,
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