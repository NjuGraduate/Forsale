/**
 * Created by lcx on 2017/4/13.
 */
$(document).ready(function () {
    var index = 0;
    var timer = null;
    $(".lib span").click(function () {
        index = $(this).index();
        $(".adPic img").eq(index) .fadeIn().siblings().fadeOut();  //eq是对应序列
        $(".lib span").eq(index).addClass("defaultSpan").siblings().removeClass("defaultSpan");

    });
    //点击左右按钮
    $('.right').click(function () {
        index>=4?index=0:index++;
        $('.adPic img').eq(index).fadeIn().siblings().fadeOut();
        $('.lib span').eq(index).addClass("defaultSpan").siblings().removeClass("defaultSpan");
    });
    $(".left").click(function () {
        index<=0?index=4:index--;
        $(".adPic img").eq(index).fadeIn().siblings().fadeOut();
        $(".lib span").eq(index).addClass("defaultSpan").siblings().removeClass("defaultSpan");
    });
    timer = setInterval(function () {
        index>=4?index=0:index++;
        $(".lib span").eq(index).trigger("click");
    },2000);
});