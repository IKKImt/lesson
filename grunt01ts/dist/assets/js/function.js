//jQuery.noConflict();
//var j$ = jQuery;


$(function(){

	// Rollover
	$('a img').hover(function(){
		$(this).attr('src', $(this).attr('src').replace('_off', '_on'));},
		function(){
			if (!$(this).hasClass('currentPage')) {
			$(this).attr('src', $(this).attr('src').replace('_on', '_off'));
		}
	});
	// Rollover end


	// Page Top
	jQuery.easing.quart = function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	};

	jQuery(document).ready(function(){
		jQuery('a[href*=#]').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
				var $target = jQuery(this.hash);
				$target = $target.length && $target || jQuery('[name=' + this.hash.slice(1) +']');
				if ($target.length) {
					var targetOffset = $target.offset().top;
					jQuery('html,body').animate({ scrollTop: targetOffset }, 1200, 'quart');
					return false;
				}
			}
		});
	});
	// Page Top end


	// auto height
	// $("").autoHeight({column:2,clear:1});
	$('.gnBoxFrameList ul li').autoHeight({height: 'height'});
	$('#upside .box').autoHeight();
	// auto height end

});