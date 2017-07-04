var main = function() {
    $('.menu').click(function () {
        $('.navigation').animate({
            left: "0px"
        }, 200);
    });

    $('.menu').click(function () {
        $('.menu').animate({
            left: "-250px"
        }, 200);
    });

    $('.menu-close').click(function () {
        $('.navigation').animate({
            left: "-250px"
        }, 200);
    });

    $('.menu-close').click(function () {
        $('.menu').animate({
            left: "0px"
        }, 200);
    });

    $(document).ready(function () {
        $('.notice').animate({bottom: "0px"}, 1000);
        $('.notice').delay(4000).animate({bottom: "-70px"}, 1000);
    });
};

$(document).ready(main);
