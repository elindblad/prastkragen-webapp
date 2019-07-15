$(function() {
    console.log($(window).scrollTop())
    $(window).scroll(function() {
        if ($(window).scrollTop() >= 566) {
            $("header.desktop").addClass("dark");
        } else {
            $("header.desktop").removeClass("dark");
        }
        // if ($(window).scrollTop() >= 165) {
        //     $("nav.headermobile").addClass("fixed");
        // } else {
        //     $("nav.headermobile").removeClass("fixed");
        // }
    });
});