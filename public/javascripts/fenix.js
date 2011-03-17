//onload=function() {
//var divh = document.getElementById('qwe').offsetHeight;
//document.getElementById('qwe2').style.height = divh + 'px';
//}
 jQuery(document).ready(function() {

	/*jQuery(".sProbegom").click(function() {
		alert("Hello world!");
	});*/
	for (var i=1; i < jQuery(".sProbegom").children().length; i++) {
		if (((i+1)%5) == 0)
			jQuery(".sProbegom").children("li:eq("+i+")").css('margin-right', '-200px').css('clear', 'right').after('<div class="clear"></div>');
		//if (((i+0)%5) == 0)
			//jQuery(".sProbegom").children("li:eq("+i+")")
			//jQuery(".sProbegom").children("li:eq("+i+")").css('clear', 'both').css('background-color', 'red');
	}
	//alert(jQuery(".wrap").height());
	//настраиваем фоны при маленькой высоте контента
	if (jQuery(".wrap").height() < 1338) {
		jQuery(".wrap").css('height', '100%').css('background-position', 'bottom');
		jQuery(".mapBg").addClass("bottom");
		//jQuery(".mapBg").css('background-position', '50% 100%');
	}
	
	//var w = jQuery("body").width();
	//ie6_fix со скрытием ul
	jQuery(".main_menu li li").mouseout(function() {
		//alert(jQuery(this));
		//jQuery(this).children("ul").hide();
	});
	//ie6_fix для h1
	jQuery("h1 span").parent().css('float', 'left');
	//alert(w);
	
	//поиск
	jQuery(".search input").focusin(function() {
		if (jQuery(this).val() == "Поиск")
			jQuery(this).val("");
	});
	jQuery(".search input").focusout(function() {
		if (jQuery.trim(jQuery(this).val()) == "")
			jQuery(this).val("Поиск");
	});
	//jQuery(".sProbegom").children("li:eq(4)").css('background-color', 'red').css('margin-right', '-200px')
});
