$(document).ready(function() {

    $('#new_message').on('submit', function(e){
        var self = this;
        e.preventDefault();
        payload=({
            url: "/messages",
            data: $(self).serialize(),
            dataType: "json",
            method: "POST"
        })

        $.ajax(payload).success(function(data){
            alert(data.message);
            $(self).find("input[type='text'], textarea").val('');
        })
        .fail(function(data){
            if (data.responseText){
                text = JSON.parse(data.responseText);
                alert("错误: " + text.message);
            };
        })
    })

    /* Scroll hire me button to contact page */
    $('.hire-me').click(function() {
        $('html, body').animate({
            scrollTop: $($(this).attr('href')).offset().top
        }, 500);
        return false;
    });

    /* For Bootstrap current state on portfolio sorting */

    $('ul.nav-pills li a').click(function(e) {
        $('ul.nav-pills li.active').removeClass('active')
        $(this).parent('li').addClass('active')
    })

    /* portfolio mixitup */

    // $(window).load(function() {
    //     var $container = $('.grid-wrapper');
    //     // $container.isotope({
    //     //     filter: '*',
    //     //     animationOptions: {
    //     //         duration: 750,
    //     //         easing: 'linear',
    //     //         queue: false
    //     //     }
    //     // });

    //     $container.isotope({
    //         filter: '*',
    //         itemSelector: '.mix',
    //         masonry: {
    //             isFitWidth: true,
    //         },
    //     });

    //     $('.grid-controls li a').click(function() {
    //         $('.grid-controls .current').removeClass('current');
    //         $(this).addClass('current');

    //         var selector = $(this).attr('data-filter');
    //         $container.isotope({
    //             filter: selector,
    //             animationOptions: {
    //                 duration: 750,
    //                 easing: 'linear',
    //                 queue: false
    //             }
    //         });
    //         return false;
    //     });
    // });

    /* fullPage.js */
    var fullpage_anchors = [];
    $('#main-menu').find('li a').map(function(){
        fullpage_anchors.push($(this).attr('data-menuanchor'));
    });
    console.log(fullpage_anchors)
    $('.fullpage').fullpage({
        //Navigation
        menu: '#main-menu',
        anchors: fullpage_anchors,
        navigation: true,
        navigationPosition: 'right',
        navigationTooltips: fullpage_anchors,
        showActiveTooltips: true,
        slidesNavigation: true,
        slidesNavPosition: 'bottom',

        //Accessibility
        keyboardScrolling: true,
        animateAnchor: true,
        recordHistory: true,
    });

    /* VEGAS Home Slider */

    $.vegas('slideshow', {
        backgrounds: [

            {
                src: '/img/slider/01.jpg',
                fade: 1000
            }, {
                src: '/img/slider/02.jpg',
                fade: 1000
            }, {
                src: '/img/slider/03.jpg',
                fade: 1000
            }, {
                src: '/img/slider/04.jpg',
                fade: 1000
            }
        ]
    })('overlay', {
        src: '/img/overlays/16.png'
    });
    $("#vegas-next").click(function() {
        $.vegas('next');
    });
    $("#vegas-prev").click(function() {
        $.vegas('previous');
    });


});
