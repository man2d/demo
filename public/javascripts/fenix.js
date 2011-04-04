//onload=function() {
//var divh = document.getElementById('qwe').offsetHeight;
//document.getElementById('qwe2').style.height = divh + 'px';
//}
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
		//file ie6_fix
		jQuery.each(jQuery(".file"), function() {
			jQuery(this).css("clear","none").after('<div class="clear"></div>');
			if (jQuery(this).height() < 30) jQuery(this).height(30);
		});
	}

	/*jQuery(".sProbegom").click(function() {
		alert("Hello world!");
	});*/
	
	//sendOrder
	jQuery('.sendOrderPos').css("display", "none");
	jQuery('.sendOrder').click(sendOrderAnim);
	function sendOrderAnim() {
		jQuery('.sendOrderPos').find('.sendOrderForm, .arrow').animate({opacity: "toggle"}, 300);
		jQuery('.sendOrderPos').animate({height: "toggle"}, 300);
	}
	
	//phone map
	jQuery('.mapPos').css("display", "none");
	jQuery('.phone').children('a').click(mapAnim);
	jQuery('.map .close').click(mapAnim);
	function mapAnim() {
		jQuery('.phone').find('.map, .arrow').animate({opacity: "toggle"}, 400);
		jQuery('.phone').find('.mapPos').animate({height: "toggle"}, 400);
	}
	
	//enter 
	jQuery('.enterFormPos').css("display", "none");
	var state = "x";
	jQuery('.enterFormPos').mouseleave(function() {
		state = "out";
		jQuery('body').bind('click', formsHandler);
	}).mouseenter(function() {
		state = "in";
		jQuery('body').unbind('click', formsHandler);
	});
	function formsHandler() {
		formAnim();
		state = "x";
	};
	jQuery(".enter").click(formAnim);
	function formAnim(animatedObj) {
		state = "x";
		jQuery('body').unbind('click', formsHandler);
		if (jQuery(".enter").hasClass("active")) {
			jQuery(".enter").removeClass("active");
		} else {
			jQuery(".enter").addClass("active");
		}
		jQuery('.enterForm').animate({opacity: "toggle"}, 300);
		jQuery('.enterFormPos').animate({
			height: "toggle"
		}, 300, function() {
			jQuery('body').unbind('click', formsHandler);
			if (jQuery(".enter").hasClass("active")) {
				if (state != "in") jQuery('body').bind('click', formsHandler);
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
	jQuery(".mapBg img").load(function () {	updateWallpaper(); });
	jQuery(window).resize(function () {	updateWallpaper(); });
	
	//tip
	var tipVisible = false;
	var prevTip = "";
	jQuery(".tip_container").css("top", -1000);
	function setTipPos(tipObj) {
		jQuery(".tip_data").css("height","auto");
		if (isIE6) {
			jQuery(".tip_data").width(310);
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
	jQuery(".tip").live('click', function() {
		var id = $(this).attr('title');
		var query_string;
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
			if(id) {
				query_string = id;
			}
			jQuery.get("/hints/"+query_string, function(data) {
				jQuery(".tip_data").html(data);
				//устанавливаем новое позиционирование
				setTipPos(tipObj);
				//проявляем подсказку
				var offsetY = 8;
				if (isIE6) offsetY = 0;
				jQuery(".tip_container").animate({
					top: tipObj.offset().top - offsetY
				}, 1500, "easeOutElastic", function() {	});
			});
		});
	});
	
	
	//yacht yacht_tip_container yacht_tip_data yacht_tip_dataWrap
	jQuery(".yacht .pict").children("a").click(function() {
		if (!yachtTipVisible) yachtTipShowAnim();
		else yachtTipHideAnim();
	});
	jQuery(".yacht .pict").find(".close").click(yachtTipHideAnim);
	var tipPos = jQuery(".yacht_tip_container").css("bottom");
	if (tipPos) tipPos = tipPos.slice(0, -2)
	jQuery(".yacht_tip_container").css("bottom","-2000px");
	jQuery(".yacht_tip_container").find(".arrow, .yacht_tip_data, .close, .yacht_tip_dataWrap").css("opacity",0);
	jQuery(".tempTipData").parent().css("position","absolute").css("bottom","-2000px"); //прячем за краями временный контейнер для подсказок
	//jQuery(".tempTipData").parent().css("position","absolute").css("bottom","200px"); //прячем за краями временный контейнер для подсказок
	var yachtTipVisible = false;
	//обновление подсказки
	jQuery(".yacht").find(".refresh").click(refreshYachtTip);
	function refreshYachtTip() {
		var currH = jQuery(".yacht_tip_dataWrap").outerHeight();
		jQuery(".yacht_tip_dataWrap").height(currH);
		
		if (jQuery.browser.msie == true) jQuery(".yacht_tip_dataWrap img").stop().animate({opacity: 0}, 300);
		jQuery(".yacht_tip_dataWrap").stop().animate({
			opacity: 0
		}, 300, function() { // после того как спрятали текущий контент
			//тут подгружаем новый контент внутрь .tempTipData
			jQuery(".tempTipData").append('123<img src="images/tipPic2.jpg" />');
			{// и когда он загружен, проявляем его
				var newH = jQuery(".tempTipData").outerHeight(); // узнаем высоту новго контента
				jQuery(".yacht_tip_dataWrap").animate({
					height: newH
				}, 400, function() {
					jQuery(".yacht_tip_data").css("height","auto");
					jQuery(".yacht_tip_dataWrap").html(jQuery(".tempTipData").html());
					if (jQuery.browser.msie == true) {
						jQuery(".yacht_tip_dataWrap img").animate({opacity: 0}, 0);
						jQuery(".yacht_tip_dataWrap img").stop().animate({opacity: 1}, 300);
					}
					jQuery(".yacht_tip_dataWrap").animate({
						opacity: 1
					}, 300);
				});
			}
		});
	};
	function yachtTipShowAnim() {
		yachtTipVisible = true;
		jQuery(".yacht_tip_container").css("bottom",-1000);
		jQuery(".yacht_tip_dataWrap").height(jQuery(".tempTipData").outerHeight()).html(jQuery(".tempTipData").html());
		jQuery(".yacht_tip_container").css("bottom", -jQuery(".yacht_tip_container").height());
		if (jQuery.browser.msie == true) jQuery(".yacht_tip_dataWrap img").stop().animate({opacity: 0}, 0);
		//обновляем контент
		refreshYachtTip();
		
		jQuery(".yacht_tip_container").find(".arrow, .yacht_tip_data, .close").stop().animate({
			opacity: 1
		}, 400);
		jQuery(".yacht_tip_container").stop().animate({
			bottom: tipPos
		}, 400);
	};
	function yachtTipHideAnim() {
		yachtTipVisible = false;
		if (jQuery.browser.msie == true) jQuery(".yacht_tip_dataWrap img").stop().animate({opacity: 0}, 300);
		
		jQuery(".yacht_tip_dataWrap").stop().animate({
			opacity: 0
		}, 300);
		jQuery(".yacht_tip_container").find(".arrow, .yacht_tip_data, .close").stop().animate({
			opacity: 0
		}, 300);
		jQuery(".yacht_tip_container").stop().animate({
			bottom: -jQuery(".yacht_tip_container").height()
		}, 400);
	}
	
	// refresh
	var refreshAnimObj;
	var refreshAnimTimer;
	var refreshAnimPos = -66;
	var refreshAnimInterval = 22;
	jQuery(".refresh").mouseenter (function() {
		refreshAnimObj = jQuery(this);
		refreshAnimTimer = setInterval (refreshAnim, 30);
	}).mouseleave (function() {
		clearInterval(refreshAnimTimer);
	});
	function refreshAnim() {
		refreshAnimPos -= refreshAnimInterval;
		if (refreshAnimPos <= -220) refreshAnimPos = 0;
		jQuery(refreshAnimObj).css("background-position", refreshAnimPos+"px 0px");
	};
	
	//mainMenu
	{
		if (isIE6) jQuery(".sub1").width(jQuery(".sub1").parent().width());
		
		jQuery(".sub1, .sub2, .sub3").css("display","none");
		if (jQuery.browser.msie != true) jQuery(".sub1, .sub2, .sub3").css("opacity", 0);
		
		jQuery(".main_menu li, .sub1 li, .sub2 li").mouseenter(showMenu).mouseleave(hideMenu);
		
		function showMenu() {
			jQuery(this).children("ul, .sub3").stop();
			jQuery(this).children("ul, .sub3").css('display', 'inline');
			if (jQuery.browser.msie != true) {
				jQuery(this).children("ul, .sub3").animate({
					opacity: 1
				  }, 300, function() {
					 // this.style.removeAttribute('filter');
					// Animation complete.
				  });
			} else {
				jQuery(this).children("ul, .sub3").css("display", "inline");
				if (isIE6) {jQuery(".sub1").css("paddingTop", "0px").children("li").eq(0).css("marginTop", "30px");	}
			}
		}
		function hideMenu() {
			jQuery(this).children().stop();
			if (jQuery.browser.msie != true) {
				jQuery(this).children("ul, .sub3").animate({
					opacity: 0
				  }, 300, function() {
					// Animation complete.
					jQuery(this).css('display', 'none');
				  });
			} else {jQuery(this).children("ul, .sub3").css("display", "none");}
		}
		
		jQuery(".sub1").mouseleave(function() {
			//jQuery(".sub1").delay()
		});
	}
	
	//.blog_comments ul li .post 
	jQuery.each(jQuery(".blog_comments .post"), function() {
		if (jQuery(this).width() < 300) jQuery(this).width(300);
	});
	//.typical .right
	jQuery.each(jQuery(".typical .right"), function() {
		if (jQuery(this).width() < 500) jQuery(this).width(500);
	});
	
	
});

function updateWallpaper() {
	if (jQuery(".wrap").height() < jQuery(document).height()) {
		jQuery(".wrap").css("background-position", "100% 100%");
		jQuery(".mapBg").css("background-position", "50% 100%");
	}
	var z1 = jQuery("body").width() / jQuery("body").height();
	var z2 = jQuery(".mapBg img").width() / jQuery(".mapBg img").height();
	if (z1 > z2) {
		jQuery(".mapBg img").width("100%");
		jQuery(".mapBg img").height("auto");
	} else {
		jQuery(".mapBg img").width("auto");
		jQuery(".mapBg img").height("100%");
	}
}
