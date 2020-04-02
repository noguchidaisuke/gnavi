!function(d){"use strict";function o(n){return this.each(function(){var t=d(this),e=t.data("bs.carousel"),i=d.extend({},u.DEFAULTS,t.data(),"object"==typeof n&&n),s="string"==typeof n?n:i.slide;e||t.data("bs.carousel",e=new u(this,i)),"number"==typeof n?e.to(n):s?e[s]():i.interval&&e.pause().cycle()})}var u=function(t,e){this.$element=d(t),this.$indicators=this.$element.find(".carousel-indicators"),this.options=e,this.paused=null,this.sliding=null,this.interval=null,this.$active=null,this.$items=null,this.options.keyboard&&this.$element.on("keydown.bs.carousel",d.proxy(this.keydown,this)),"hover"==this.options.pause&&!("ontouchstart"in document.documentElement)&&this.$element.on("mouseenter.bs.carousel",d.proxy(this.pause,this)).on("mouseleave.bs.carousel",d.proxy(this.cycle,this))};u.VERSION="3.4.1",u.TRANSITION_DURATION=600,u.DEFAULTS={interval:5e3,pause:"hover",wrap:!0,keyboard:!0},u.prototype.keydown=function(t){if(!/input|textarea/i.test(t.target.tagName)){switch(t.which){case 37:this.prev();break;case 39:this.next();break;default:return}t.preventDefault()}},u.prototype.cycle=function(t){return t||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(d.proxy(this.next,this),this.options.interval)),this},u.prototype.getItemIndex=function(t){return this.$items=t.parent().children(".item"),this.$items.index(t||this.$active)},u.prototype.getItemForDirection=function(t,e){var i=this.getItemIndex(e);if(("prev"==t&&0===i||"next"==t&&i==this.$items.length-1)&&!this.options.wrap)return e;var s=(i+("prev"==t?-1:1))%this.$items.length;return this.$items.eq(s)},u.prototype.to=function(t){var e=this,i=this.getItemIndex(this.$active=this.$element.find(".item.active"));if(!(t>this.$items.length-1||t<0))return this.sliding?this.$element.one("slid.bs.carousel",function(){e.to(t)}):i==t?this.pause().cycle():this.slide(i<t?"next":"prev",this.$items.eq(t))},u.prototype.pause=function(t){return t||(this.paused=!0),this.$element.find(".next, .prev").length&&d.support.transition&&(this.$element.trigger(d.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},u.prototype.next=function(){if(!this.sliding)return this.slide("next")},u.prototype.prev=function(){if(!this.sliding)return this.slide("prev")},u.prototype.slide=function(t,e){var i=this.$element.find(".item.active"),s=e||this.getItemForDirection(t,i),n=this.interval,a="next"==t?"left":"right",r=this;if(s.hasClass("active"))return this.sliding=!1;var o=s[0],l=d.Event("slide.bs.carousel",{relatedTarget:o,direction:a});if(this.$element.trigger(l),!l.isDefaultPrevented()){if(this.sliding=!0,n&&this.pause(),this.$indicators.length){this.$indicators.find(".active").removeClass("active");var h=d(this.$indicators.children()[this.getItemIndex(s)]);h&&h.addClass("active")}var c=d.Event("slid.bs.carousel",{relatedTarget:o,direction:a});return d.support.transition&&this.$element.hasClass("slide")?(s.addClass(t),"object"==typeof s&&s.length&&s[0].offsetWidth,i.addClass(a),s.addClass(a),i.one("bsTransitionEnd",function(){s.removeClass([t,a].join(" ")).addClass("active"),i.removeClass(["active",a].join(" ")),r.sliding=!1,setTimeout(function(){r.$element.trigger(c)},0)}).emulateTransitionEnd(u.TRANSITION_DURATION)):(i.removeClass("active"),s.addClass("active"),this.sliding=!1,this.$element.trigger(c)),n&&this.cycle(),this}};var t=d.fn.carousel;d.fn.carousel=o,d.fn.carousel.Constructor=u,d.fn.carousel.noConflict=function(){return d.fn.carousel=t,this};var e=function(t){var e=d(this),i=e.attr("href");i&&(i=i.replace(/.*(?=#[^\s]+$)/,""));var s=e.attr("data-target")||i,n=d(document).find(s);if(n.hasClass("carousel")){var a=d.extend({},n.data(),e.data()),r=e.attr("data-slide-to");r&&(a.interval=!1),o.call(n,a),r&&n.data("bs.carousel").to(r),t.preventDefault()}};d(document).on("click.bs.carousel.data-api","[data-slide]",e).on("click.bs.carousel.data-api","[data-slide-to]",e),d(window).on("load",function(){d('[data-ride="carousel"]').each(function(){var t=d(this);o.call(t,t.data())})})}(jQuery);