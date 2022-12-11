(function ($) {
    'use strict';

    $(document).on('ready', function () {

        /* [ Mobile Menu ]
        -------------------------------------------- */
        $('.menu').slicknav({
            prependTo: ".mobile-nav",
            duration: 300,
            animateIn: 'fadeIn',
            animateOut: 'fadeOut',
            closeOnClick: true,
        });

        /* [ Sticky Header ]
        -------------------------------------------- */
        jQuery(window).on('scroll', function () {
            if ($(this).scrollTop() > 200)
                $('.header').addClass("sticky");
            else
                $('.header').removeClass("sticky");
        });

        /* [ Mobile Search ]
        -------------------------------------------- */
        $('.mobile-search a').on("click", function () {
            $('.mobile-search').toggleClass('active');
        });

        /* [ Slider Range ]
        -------------------------------------------- */
        $(function () {
            let slider = $('#slider-range')
            slider.slider({
                range: true,
                min: 0,
                max: 5000000,
                values: [0, 1000000],
                slide: function (_event, ui) {
                    $('.from').val(ui.values[0])
                    $('.to').val(ui.values[1])
                }
            });
            $('#amount').val(slider.slider("values", 0) + "đ" + " - " + slider.slider("values", 1) + "đ");
        });

        /* [ Home Slider ]
        -------------------------------------------- */
        $('.home-slider').owlCarousel({
            items: 1,
            autoplay: true,
            autoplayTimeout: 5000,
            smartSpeed: 400,
            animateIn: 'fadeIn',
            animateOut: 'fadeOut',
            autoplayHoverPause: true,
            loop: true,
            nav: true,
            merge: true,
            dots: false,
            navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                300: {
                    items: 1,
                },
                480: {
                    items: 2,
                },
                768: {
                    items: 3,
                },
                1170: {
                    items: 4,
                },
            }
        });

        /* [ Newest Slider ]
        -------------------------------------------- */
        $('.newest-slider').owlCarousel({
            items: 1,
            autoplay: true,
            autoplayTimeout: 5000,
            smartSpeed: 400,
            animateIn: 'fadeIn',
            animateOut: 'fadeOut',
            autoplayHoverPause: true,
            loop: true,
            nav: true,
            merge: true,
            dots: false,
            navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                300: {
                    items: 1,
                },
                480: {
                    items: 2,
                },
                768: {
                    items: 3,
                },
                1170: {
                    items: 4,
                },
            }
        });

        /* [ Quick View Slider ]
        -------------------------------------------- */
        $('.product-slider-active').owlCarousel({
            items: 1,
            autoplay: true,
            autoplayTimeout: 5000,
            smartSpeed: 400,
            autoplayHoverPause: true,
            nav: true,
            loop: true,
            merge: true,
            dots: false,
            navText: ['<i class=" ti-arrow-left"></i>', '<i class=" ti-arrow-right"></i>'],
        });

        /* [ Home List 4 ]
        -------------------------------------------- */
        $('.home-slider-4').owlCarousel({
            items: 1,
            autoplay: true,
            autoplayTimeout: 5000,
            smartSpeed: 400,
            autoplayHoverPause: true,
            nav: true,
            loop: true,
            merge: true,
            dots: false,
            navText: ['<i class=" ti-arrow-left"></i>', '<i class=" ti-arrow-right"></i>'],
        });

        /* [ Countdown ]
        -------------------------------------------- */
        $('[data-countdown]').each(function () {
            const $this = $(this),
                finalDate = $(this).data('countdown');
            $this.countdown(finalDate, function (event) {
                $this.html(event.strftime(
                    '<div class="cdown"><span class="days"><strong>%-D</strong><p>Days.</p></span></div><div class="cdown"><span class="hour"><strong> %-H</strong><p>Hours.</p></span></div> <div class="cdown"><span class="minutes"><strong>%M</strong> <p>MINUTES.</p></span></div><div class="cdown"><span class="second"><strong> %S</strong><p>SECONDS.</p></span></div>'
                ));
            });
        });

        /* [ Flex Slider ]
        -------------------------------------------- */
        (function ($) {
            'use strict';
            $('.flexslider-thumbnails').flexslider({
                animation: "slide",
                controlNav: "thumbnails",
            });
        })(jQuery);

        /* [ Cart Plus-Minus Button ]
        -------------------------------------------- */
        const CartPlusMinus = $('.cart-plus-minus');
        CartPlusMinus.prepend('<div class="dec qtybutton">-</div>');
        CartPlusMinus.append('<div class="inc qtybutton">+</div>');
        $(".qtybutton").on("click", function () {
            let newVal;
            const $button = $(this);
            const oldValue = $button.parent().find("input").val();
            if ($button.text() === "+") {
                newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 0)
                    newVal = parseFloat(oldValue) - 1;
                else
                    newVal = 1;
            }
            $button.parent().find("input").val(newVal);
        });

        /* [ Extra Scroll ]
        -------------------------------------------- */
        $('.scroll').on("click", function (e) {
            const anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $(anchor.attr('href')).offset().top - 0
            }, 900);
            e.preventDefault();
        });

        /* [ Checkbox ]
        -------------------------------------------- */
        $('input[type="checkbox"]').change(function () {
            if ($(this).is(':checked'))
                $(this).parent("label").addClass("checked");
            else
                $(this).parent("label").removeClass("checked");
        });

        /* [ Product Page Quantity Counter ]
        -------------------------------------------- */
        $('.qty-box .quantity-right-plus').on('click', function () {
            const $qty = $('.qty-box .input-number');
            const currentVal = parseInt($qty.val(), 10);
            if (!isNaN(currentVal))
                $qty.val(currentVal + 1);
        });
        $('.qty-box .quantity-left-minus').on('click', function () {
            const $qty = $('.qty-box .input-number');
            const currentVal = parseInt($qty.val(), 10);
            if (!isNaN(currentVal) && currentVal > 1)
                $qty.val(currentVal - 1);
        });

        /* [ Video Popup ]
        -------------------------------------------- */
        $('.video-popup').magnificPopup({
            type: 'iframe',
            removalDelay: 300,
            mainClass: 'mfp-fade'
        });

        /* [ Scroll Up ]
        -------------------------------------------- */
        $.scrollUp({
            scrollText: '<span><i class="fa fa-angle-up"></i></span>',
            easingType: 'easeInOutExpo',
            scrollSpeed: 900,
            animation: 'fade'
        });

    });

    /* [ Nice Select ]
    -------------------------------------------- */
    $('select').niceSelect();

    /* [ Others ]
    -------------------------------------------- */
    $(function () {
        const slider = $('#slider-range')
        slider.slider({
            range: true,
            min: 0,
            max: 500,
            values: [0, 500],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + slider.slider("values", 0) + " - $" + slider.slider("values", 1));
    });

    /* [ Preloader ]
    -------------------------------------------- */
    $('.preloader').delay(0).fadeOut('slow');
    setTimeout(function () {
        // After 2s, the no-scroll class of the body will be removed
        $('body').removeClass('no-scroll');
    }, 0);

    // $('.header-menu .nav a[data-category-type]').on('click', function () {
    //     const type = $(this).attr('data-category-type')
    //     window.location.href = 'products?category_type=' + type
    //     return false
    // })

})(jQuery);
