//onload=function() {
//var divh = document.getElementById('qwe').offsetHeight;
//document.getElementById('qwe2').style.height = divh + 'px';
//}
 jQuery(document).ready(function() {

	/*jQuery(".sProbegom").click(function() {
		alert("Hello world!");
	});*/
	//shadow fix 
	jQuery.each(jQuery(".dataShadowWrap"), function() {
		var h = jQuery(this).height();
		var w = jQuery(this).width();
		if ((h%2) != 0)	jQuery(this).height(++h);
		if ((w%2) != 0)	jQuery(this).width(++w);
	});
	
	
	//enter 
	jQuery('.enterFormPos').css("display", "none");
	var state = "x";
	jQuery('.enterFormPos').mouseleave(function() {
		state = "out";
		jQuery('body').bind('click', formsHandler);
	}).mouseenter(function() {
		state = "in";
		jQuery('body').unbind();
	});
	function formsHandler() {
		eFormAnim();
		state = "x";
		jQuery('body').unbind();
	};
	jQuery(".enter").click(eFormAnim);
	function eFormAnim() {
		state = "x";
		jQuery('body').unbind();
		if (jQuery(".enter").hasClass("active")) {
			jQuery(".enter").removeClass("active");
		} else {
			jQuery(".enter").addClass("active");
		}
		jQuery('.enterForm').animate({
			opacity: "toggle"
		}, 300);
		jQuery('.enterFormPos').animate({
			height: "toggle"
		}, 300, function() {
			if (jQuery(".enter").hasClass("active")) {
				if (state == "out" || state == "x") {
					jQuery('body').unbind();
					jQuery('body').bind('click', formsHandler);
				} else {
					jQuery('body').unbind();
				}
			}
		});
	}
	
	
	for (var i=1; i < jQuery(".sProbegom").children().length; i++) {
		if (((i+1)%5) == 0)
			jQuery(".sProbegom").children("li:eq("+i+")").css('margin-right', '-200px').css('clear', 'right').after('<div class="clear"></div>');
		//if (((i+0)%5) == 0)
			//jQuery(".sProbegom").children("li:eq("+i+")")
			//jQuery(".sProbegom").children("li:eq("+i+")").css('clear', 'both').css('background-color', 'red');
	}
	//alert(jQuery(".wrap").height());
	//sub3
	jQuery(".sub3").parent().mouseover(function() {
		var pos = jQuery(this).position();
		jQuery(this).children(".sub3").css("top", -pos.top);
	});
	
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
