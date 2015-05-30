$.fn.bttabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		obj.click(function() {
			$(selector).removeClass('selected');
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).fadeIn();
			
			var tabmodule = $(this).attr('data-crs');
			
			loadslider(tabmodule);
			
			$(selector).not(this).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};

function checkDevices($module){
	if(getWidthBrowser() > 767){
		$('.content_tabs'+$module).show();
		$('.home_filter_content h3').addClass('color_active');
	}
	else {
		$('.content_tabs'+$module).hide();
		$('.home_filter_content h3').removeClass('color_active');
		var $tabs = $(".head_tabs");
		$tabs.each(function() {
		
			//  Here we get the active element
			var parent = $(this).parent();
			if($(parent).hasClass('active')){
				
				var href = $(parent).find("a").attr("href");
				$(href).show();
				//break;
			}
		});
	}
}

function execCarousel($module,$carousel,$limit,$width) {
	
	$($carousel).carouFredSel({
		responsive: true,
		width: '100%',
		height: 'variable',
		prev: $($carousel).attr("data-prev"),
		next: $($carousel).attr("data-next"),
		auto: false,
		swipe: {
				onTouch : false
			},
		items: {
				width: $width,
				height: 'variable',
				visible: {
					min: 1,
					max: $limit
				}
			},
		scroll: {
				direction : 'left',    //  The direction of the transition.
				duration  : 900,   //  The duration of the transition.
			},
		onCreate: function () {
			$(window).smartresize(function(){
				$('#tabs_content_container'+$module+' div.one-product').css("height",'');	
				$('#tabs_content_container'+$module+' div.one-product').css("height",getMaxHeight('#tabs_content_container'+$module+' div.one-product'));	
			});
		}
	});
}

function initCarousel($use_tab,$module,$use_scrolling_panel,$limit,$width){
	
	var $tabs = $("#tabs"+$module+" li.active").first();

	var $carousel = $($tabs).find("a").attr("data-crs");
		//	Here we call function "execCarousel"
	execCarousel($module,$carousel,$limit,$width);
	
	
}

function getMaxHeight($elms) {
	var maxHeight = 0;
	$($elms).each(function () {
	
		var height = $(this).outerHeight();
		if (height > maxHeight) {
			maxHeight = height;
		}
	});
	return maxHeight;
};