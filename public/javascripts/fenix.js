onload=function() {
//var divh = document.getElementById('qwe').offsetHeight;
//document.getElementById('qwe2').style.height = divh + 'px';
}
 jQuery(document).ready(function() {
	 
	//узнаем ие6
	var isIE6 = false;
	if (jQuery.browser.msie == true)
	if (jQuery.browser.version <= 6)
		isIE6 = true;
		
	if (isIE6) {
		//forms ie6_fix
		jQuery.each(jQuery(".example, .errorInfo"), function() {
			if (jQuery.trim(jQuery(this).html()) == "")
				jQuery(this).height(0);
		});
		//bgPic ie6_fix
		jQuery(".bgPic").remove();
		jQuery(".head").before('<div class="bgPic"></div>');
		//shadow ie6_fix
		jQuery.each(jQuery(".dataShadowWrap"), function() {
			var h = jQuery(this).height();
			var w = jQuery(this).width();
			if ((h%2) != 0)	jQuery(this).height(++h);
			if ((w%2) != 0)	jQuery(this).width(++w);
		});
		//ie6_fix для h1
		jQuery("h1 span").parent().css('float', 'left').after('<div class="clear"></div');
		//ie6_fix для h2
		var actionsZcount = 1000;
		jQuery.each(jQuery("h2 .actions"), function() {
			jQuery(this).parent().css('z-index', actionsZcount--).css('position', 'relative');
		});
		//ie6_fix для tags
		jQuery(".blog_postInfo .tags").after('<div class="clear"></div');
	}

	/*jQuery(".sProbegom").click(function() {
		alert("Hello world!");
	});*/
	//настраиваем фоны
	//jQuery(':css(position,absolute)').css("background","red");
//	jQuery.each(jQuery("*"), function() {
//		if (jQuery(this).css("position") == "absolute")
//			jQuery(this).css("border", "solid 1px red")//.css("background-color","red");
//	});
	
	
	
	
	
	//file ie6_fix
	jQuery.each(jQuery(".file"), function() {
		jQuery(this).css("clear","none").after('<div class="clear"></div>');
		if (jQuery(this).height() < 30) jQuery(this).height(30);
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
		jQuery('.enterForm').animate({opacity: "toggle"}, 300);
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
	
	//blog_comments
	jQuery(".showCommentForm").click(function() {
		jQuery(this).parent().find(".addComment").slideToggle();
	});
	
	
	//sProbegom
	for (var i=1; i < jQuery(".sProbegom").children().length; i++) {
		if (((i+1)%5) == 0)
			jQuery(".sProbegom").children("li:eq("+i+")").css('margin-right', '-200px').css('clear', 'right').after('<div class="clear"></div>');
		//if (((i+0)%5) == 0)
			//jQuery(".sProbegom").children("li:eq("+i+")")
			//jQuery(".sProbegom").children("li:eq("+i+")").css('clear', 'both').css('background-color', 'red');
	}
	//filterResult
	for (var i=1; i < jQuery(".filterResult ul").children().length; i++) {
		//jQuery(this).children().css('background-color', 'red');
		if (((i+1)%5) == 0)
			jQuery(".filterResult ul").children("li:eq("+i+")").css('margin-right', '-200px').css('clear', 'right').after('<div class="clear"></div>');
	}

	//sub3
	jQuery(".sub3").parent().mouseover(function() {
		var pos = jQuery(this).position();
		jQuery(this).children(".sub3").css("top", -pos.top);
	});

	//поиск
	jQuery(".search input").focusin(function() {
		if (jQuery(this).val() == "Поиск")
			jQuery(this).val("");
	});
	jQuery(".search input").focusout(function() {
		if (jQuery.trim(jQuery(this).val()) == "")
			jQuery(this).val("Поиск");
	});
	
	//настройка фона
	if (jQuery(".wrap").height() < jQuery(document).height()) {
		jQuery(".wrap").css("background-position", "100% 100%");
		jQuery(".mapBg").css("background-position", "50% 100%");
	}
	
	//tip
	var tipVisible = false;
	var prevTip = "";
	jQuery(".tip_container").css("top", -1000);
	function setTipPos(tipObj) {
		jQuery(".tip_data").css("height","auto");
		if (isIE6) {
			jQuery(".tip_data").width(310)//.height(jQuery(".tip_data").height()+1); //ie6_fix
		}
		//alert(jQuery(".tip_data").height());
		//получаем позицию подсказки
		var pos = tipObj.offset();
		//получаем вертикальное процентное позиционирование
		var persent = (pos.top*100)/jQuery(document).height();
		//получаем вертикальное смещение на основе верт. поз-я
		var margin = (jQuery(".tip_data").innerHeight() - 40)/100 * persent;
		
		//устанавливаем новые свойства
		jQuery(".tip_container").css("margin-top",margin * -1);
		jQuery(".tip_container .arrow").css("top",margin+(tipObj.height()/2-10));
		//для стрелки и горизонтального смещения
		var offsetX = (jQuery(document).width()/2)-pos.left;
		var offsetMargin = 12;
		if ((jQuery(document).width()/2) < pos.left) {
			if (isIE6) offsetMargin = 3;
			offsetX += jQuery(".tip_container").width()+offsetMargin;
			jQuery(".tip_container .arrow").removeClass("rArrow");
		} else {
			if (isIE6) offsetMargin += 10;
			offsetX -= tipObj.width()+offsetMargin;
			jQuery(".tip_container .arrow").addClass("rArrow");
		}
		//jQuery(".tip_container").css("left",pos.left+offsetX);
		jQuery(".tip_container").css("margin-left", -offsetX);
	};
	jQuery(".tip_data").children(".close").click(function() {
		tipVisible = false;
		prevTip = "";
		jQuery(".tip_container").stop().animate({
			top: (0 - jQuery(".tip_container").height())
		}, 500);
	});
	jQuery(".tip").click(function() {
		var tipObj = jQuery(this);
		var hideSpeed = 0;
		if (tipVisible) hideSpeed = 500;
		//прячем подсказку
		jQuery(".tip_container").stop().animate({
			top: (0 - jQuery(".tip_container").height())
		}, hideSpeed, function() {
			//прячем при клике на ту же сслылку
			if (prevTip == tipObj.html()) {
				prevTip = "";
				tipVisible = false;
				return;
			}
			prevTip = tipObj.html();
			tipVisible = true;
			//устанавливаем новый контент
			jQuery(".tip_data p").html(tipObj.html());
			//устанавливаем новое позиционирование
			setTipPos(tipObj);
			//проявляем подсказку
			var offsetY = 8;
			if (isIE6) offsetY = 0
			jQuery(".tip_container").animate({
				top: tipObj.offset().top - offsetY
			}, 1500, "easeOutElastic", function() {
			});
		});
	});
	
});
