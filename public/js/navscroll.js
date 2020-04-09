$(function() {
    $(window).scroll(function() {
        if ($(window).scrollTop() >= 566) {
            $("header.desktop").addClass("dark");
        } else {
            $("header.desktop").removeClass("dark");
        }
    });
});