/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./public/assets/sass/app.scss":
/*!*************************************!*\
  !*** ./public/assets/sass/app.scss ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ "./resources/js/app.js":
/*!*****************************!*\
  !*** ./resources/js/app.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


(function ($) {
  var wind_ = $(window),
      body_ = $('body');
  feather.replace({
    'stroke-width': 1.5
  });
  $(document).on('click', '[data-toggle="fullscreen"]', function () {
    $(this).toggleClass('active-fullscreen');

    if (document.fullscreenEnabled) {
      if ($(this).hasClass("active-fullscreen")) {
        document.documentElement.requestFullscreen();
      } else {
        document.exitFullscreen();
      }
    } else {
      alert("Your browser does not support fullscreen.");
    }

    return false;
  });
  $(document).on('click', '.overlay', function () {
    $.removeOverlay();

    if (body_.hasClass('horizontal-navigation')) {
      $('.horizontal-navigation').removeClass('open');
    } else {
      $('.navigation').removeClass('open');
    }

    body_.removeClass('navigation-show');
  });
  $(document).on('click', '[data-sidebar-target]', function () {
    var target = $(this).data('sidebar-target');
    $('body').addClass('no-scroll');
    $('.sidebar-group').addClass('show');
    $('.sidebar-group .sidebar').removeClass('show');
    $('.sidebar-group .sidebar' + target).addClass('show');
    return false;
  });
  $(document).on('click', '.sidebar-group', function (e) {
    if ($(e.target).is($('.sidebar-group'))) {
      $('.sidebar-group').removeClass('show');
      $('body').removeClass('no-scroll');
      $('.sidebar-group .sidebar').removeClass('show');
    }
  }); // Active pages, automatically show on the menu

  $('.navigation .navigation-menu-body .navigation-menu-group ul li a.active').closest('ul').parent('li').addClass('open').closest('ul').parent('li').addClass('open');
  $('.navigation .navigation-menu-body .navigation-menu-group ul li a.active').closest('div').addClass('open');
  $('.navigation .navigation-menu-tab [data-nav-target="#' + $('.navigation .navigation-menu-body .navigation-menu-group ul li a.active').closest('div').attr('id') + '"]').addClass('active');
  $('body.horizontal-navigation .horizontal-navigation ul li a.active').closest('ul').parent('li').addClass('open').closest('ul').parent('li').addClass('open');
  /*------------- create/remove overlay -------------*/

  $.createOverlay = function () {
    if ($('.overlay').length < 1) {
      body_.addClass('no-scroll').append('<div class="overlay"></div>');
      $('.overlay').addClass('show');
    }
  };

  $.removeOverlay = function () {
    body_.removeClass('no-scroll');
    $('.overlay').remove();
  };
  /*------------- create/remove overlay -------------*/


  $('[data-backround-image]').each(function (e) {
    $(this).css("background", 'url(' + $(this).data('backround-image') + ')');
  });
  /*------------- page loader -------------*/

  wind_.on('load', function () {
    $('.preloader').fadeOut(400, function () {
      setTimeout(function () {
        toastr.options = {
          timeOut: 2000,
          progressBar: true,
          showMethod: "slideDown",
          hideMethod: "slideUp",
          showDuration: 200,
          hideDuration: 200,
          positionClass: "toast-top-center"
        };
        toastr.success('Welcome Roxana Roussell.');
        $('.theme-switcher').removeClass('open');
      }, 500); // $('.theme-switcher').css('opacity', 1);
    });
  });
  /*------------- page loader -------------*/

  /*------------- side menu (sub menü arrow) -------------*/

  wind_.on('load', function () {
    setTimeout(function () {
      $('.navigation .navigation-menu-body ul li a').each(function () {
        var $this = $(this);

        if ($this.next('ul').length) {
          $this.append('<i class="sub-menu-arrow ti-angle-up"></i>');
        }
      });
      $('.navigation .navigation-menu-body ul li.open>a>.sub-menu-arrow').removeClass('ti-plus').addClass('ti-minus').addClass('rotate-in');
      $('body.horizontal-navigation .horizontal-navigation ul li a').each(function () {
        var $this = $(this);

        if ($this.next('ul').length) {
          $this.append('<i class="sub-menu-arrow ti-angle-right"></i>');
        }
      });
    }, 200);
  });
  /*------------- side menu (sub menü arrow) -------------*/

  $(document).on('click', '[data-action="navigation-toggler"]', function () {
    if (body_.hasClass('horizontal-navigation')) {
      $('.horizontal-navigation').toggleClass('open');
    } else {
      $('.navigation').toggleClass('open');
    }

    $.createOverlay();
  });
  $(document).on('click', '[data-nav-target]', function () {
    var $this = $(this),
        target = $this.data('nav-target');

    if (body_.hasClass('navigation-toggle-one')) {
      body_.addClass('navigation-show');
    }

    if (body_.hasClass('horizontal-navigation')) {
      $('.navigation .navigation-menu-body').show();
    }

    $('.navigation .navigation-menu-body .navigation-menu-group > div').removeClass('open');
    $('.navigation .navigation-menu-body .navigation-menu-group ' + target).addClass('open');
    $('[data-nav-target]').removeClass('active');
    $this.addClass('active');
    $this.tooltip('hide');
    return false;
  });
  var c = $('.header .header-left .header-logo').clone();
  $('.navigation .navigation-header').append(c.addClass('navigation-logo').removeClass('header-logo'));
  $(document).on('click', '.navigation-toggler a', function () {
    if (wind_.width() < 1200) {
      $.createOverlay();
      body_.addClass('navigation-show');
    } else {
      if (!body_.hasClass('navigation-toggle-one') && !body_.hasClass('navigation-toggle-two')) {
        body_.addClass('navigation-toggle-one');
      } else if (body_.hasClass('navigation-toggle-one') && !body_.hasClass('navigation-toggle-two')) {
        body_.addClass('navigation-toggle-two');
        body_.removeClass('navigation-toggle-one');
      } else if (!body_.hasClass('navigation-toggle-one') && body_.hasClass('navigation-toggle-two')) {
        body_.removeClass('navigation-toggle-two');
        body_.removeClass('navigation-toggle-one');
      }
    }

    return false;
  });
  $(document).on('click', '.header-toggler a', function () {
    $('.header ul.navbar-nav').toggleClass('open');
    return false;
  });
  $(document).on('click', '*', function (e) {
    if (!$(e.target).is($('.navigation, .navigation *, .navigation-toggler *')) && body_.hasClass('navigation-toggle-one')) {
      body_.removeClass('navigation-show');
    }
  });
  $(document).on('click', '*', function (e) {
    if (!$(e.target).is('.header ul.navbar-nav, .header ul.navbar-nav *, .header-toggler, .header-toggler *')) {
      $('.header ul.navbar-nav').removeClass('open');
    }
  });
  /*------------- form validation -------------*/

  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation'); // Loop over them and prevent submission

    Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }

        form.classList.add('was-validated');
      }, false);
    });
  }, false);
  /*------------- form validation -------------*/

  /*------------- responsive html table -------------*/

  var table_responsive_stack = $(".table-responsive-stack");
  table_responsive_stack.find("th").each(function (i) {
    $(".table-responsive-stack td:nth-child(" + (i + 1) + ")").prepend('<span class="table-responsive-stack-thead">' + $(this).text() + ":</span> ");
    $(".table-responsive-stack-thead").hide();
  });
  table_responsive_stack.each(function () {
    var thCount = $(this).find("th").length,
        rowGrow = 100 / thCount + "%";
    $(this).find("th, td").css("flex-basis", rowGrow);
  });

  function flexTable() {
    if (wind_.width() < 768) {
      $(".table-responsive-stack").each(function (i) {
        $(this).find(".table-responsive-stack-thead").show();
        $(this).find("thead").hide();
      }); // window is less than 768px
    } else {
      $(".table-responsive-stack").each(function (i) {
        $(this).find(".table-responsive-stack-thead").hide();
        $(this).find("thead").show();
      });
    }
  }

  flexTable();

  window.onresize = function (event) {
    flexTable();
  };
  /*------------- responsive html table -------------*/

  /*------------- header search -------------*/


  $(document).on('click', '[data-toggle="search"], [data-toggle="search"] *', function () {
    $('.header .header-body .header-search').show().find('.form-control').focus();
    return false;
  });
  $(document).on('click', '.close-header-search, .close-header-search svg', function () {
    $('.header .header-body .header-search').hide();
    return false;
  });
  $(document).on('click', '*', function (e) {
    if (!$(e.target).is($('.header, .header *, [data-toggle="search"], [data-toggle="search"] *'))) {
      $('.header .header-body .header-search').hide();
    }
  });
  /*------------- header search -------------*/

  /*------------- custom accordion -------------*/

  $(document).on('click', '.accordion.custom-accordion .accordion-row a.accordion-header', function () {
    var $this = $(this);
    $this.closest('.accordion.custom-accordion').find('.accordion-row').not($this.parent()).removeClass('open');
    $this.parent('.accordion-row').toggleClass('open');
    return false;
  });
  /*------------- custom accordion -------------*/

  /*------------- responsive table dropdown -------------*/

  var dropdownMenu,
      table_responsive = $('.table-responsive');
  table_responsive.on('show.bs.dropdown', function (e) {
    dropdownMenu = $(e.target).find('.dropdown-menu');
    body_.append(dropdownMenu.detach());
    var eOffset = $(e.target).offset();
    dropdownMenu.css({
      'display': 'block',
      'top': eOffset.top + $(e.target).outerHeight(),
      'left': eOffset.left,
      'width': '184px',
      'font-size': '14px'
    });
    dropdownMenu.addClass("mobPosDropdown");
  });
  table_responsive.on('hide.bs.dropdown', function (e) {
    $(e.target).append(dropdownMenu.detach());
    dropdownMenu.hide();
  });
  /*------------- responsive table dropdown -------------*/

  /*------------- chat -------------*/

  $(document).on('click', '.chat-block .chat-sidebar .chat-sidebar-content .list-group .list-group-item', function () {
    $('.chat-block .chat-content').addClass('chat-mobile-open');
    return false;
  });
  $(document).on('click', '.chat-block .chat-content .mobile-chat-close-btn a', function () {
    $('.chat-block .chat-content').removeClass('chat-mobile-open');
    return false;
  });
  /*------------- chat -------------*/

  /*------------- aside menu toggle -------------*/

  $(document).on('click', '.navigation ul li a', function () {
    var $this = $(this);

    if ($this.next('ul').length) {
      var sub_menu_arrow = $this.find('.sub-menu-arrow');
      sub_menu_arrow.toggleClass('rotate-in');
      $this.next('ul').toggle(200);
      $this.parent('li').siblings().find('ul').not($this.parent('li').find('ul')).slideUp(200);
      $this.next('ul').find('li ul').slideUp(200);
      $this.next('ul').find('li>a').find('.sub-menu-arrow').removeClass('ti-minus').addClass('ti-plus');
      $this.next('ul').find('li>a').find('.sub-menu-arrow').removeClass('rotate-in');
      $this.parent('li').siblings().not($this.parent('li').find('ul')).find('>a').find('.sub-menu-arrow').removeClass('ti-minus').addClass('ti-plus');
      $this.parent('li').siblings().not($this.parent('li').find('ul')).find('>a').find('.sub-menu-arrow').removeClass('rotate-in');

      if (sub_menu_arrow.hasClass('rotate-in')) {
        setTimeout(function () {
          sub_menu_arrow.removeClass('ti-plus').addClass('ti-minus');
        }, 200);
      } else {
        sub_menu_arrow.removeClass('ti-minus').addClass('ti-plus');
      }

      if (!body_.hasClass('horizontal-side-menu') && wind_.width() >= 1200) {
        setTimeout(function (e) {
          $('.navigation .navigation-menu-body').getNiceScroll().resize();
        }, 300);
      }

      return false;
    }
  });
  $(document).on('click', '.horizontal-navigation ul li a', function () {
    var $this = $(this);

    if ($this.next('ul').length) {
      $this.next('ul').toggle(200);
      $this.parent('li').siblings().find('ul').not($this.parent('li').find('ul')).slideUp(200);
      $this.next('ul').find('li ul').slideUp(200);
      return false;
    }
  });
  /*------------- aside menu toggle -------------*/

  /*------------- other -------------*/

  $(document).on('click', '.dropdown-menu', function (e) {
    e.stopPropagation();
  });
  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget),
        recipient = button.data('whatever'),
        modal = $(this);
    modal.find('.modal-title').text('New message to ' + recipient);
    modal.find('.modal-body input').val(recipient);
  });
  $('[data-toggle="tooltip"]').tooltip({
    container: 'body'
  });
  $('[data-toggle="popover"]').popover();
  $('.carousel').carousel();

  if (wind_.width() >= 992) {
    $('.card-scroll').niceScroll();
    $('.table-responsive').niceScroll();
    $('.sidebar-group .sidebar').niceScroll();
    $('.app-block .app-content .app-lists').niceScroll();
    $('.app-block .app-sidebar .app-sidebar-menu').niceScroll();
    $('.chat-block .chat-sidebar .chat-sidebar-content').niceScroll();
    var chat_messages = $('.chat-block .chat-content .messages');

    if (chat_messages.length) {
      chat_messages.niceScroll({
        horizrailenabled: false
      });
      chat_messages.getNiceScroll(0).doScrollTop(chat_messages.get(0).scrollHeight, -1);
    }
  }

  if (!body_.hasClass('small-navigation') && !body_.hasClass('horizontal-navigation') && wind_.width() >= 992) {
    $('.navigation .navigation-menu-body').niceScroll();
  }

  $('.dropdown-menu ul.list-group').niceScroll();
})(jQuery);

/***/ }),

/***/ 0:
/*!*****************************************************************!*\
  !*** multi ./resources/js/app.js ./public/assets/sass/app.scss ***!
  \*****************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! C:\wamp64\www\themeforest\nago\resources\js\app.js */"./resources/js/app.js");
module.exports = __webpack_require__(/*! C:\wamp64\www\themeforest\nago\public\assets\sass\app.scss */"./public/assets/sass/app.scss");


/***/ })

/******/ });