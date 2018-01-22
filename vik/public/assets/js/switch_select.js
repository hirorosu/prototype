$(function(){

    $('.text').css('display','none');

    $('.tabMenu li').on("click", function() {
        var index = $('.tabMenu li').index(this);
        $('.textArea li').css('display','none');
        $('.textArea li').eq(index).css('display','block');

        $('.tabMenu li').removeClass('now');
        $(this).addClass('now');
    });
});