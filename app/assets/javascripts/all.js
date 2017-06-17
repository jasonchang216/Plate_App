var main = function() {
    $('.menu').click(function () {
        $('.navigation').animate({
            left: "0px"
        }, 200);
    });

    $('.menu-close').click(function () {
        $('.navigation').animate({
            left: "-200px"
        }, 200);
    });
};

$(document).ready(main);
