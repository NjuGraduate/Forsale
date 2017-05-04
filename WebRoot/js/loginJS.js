
jQuery(document).ready(function() {
    /*
     表单 动画，空白检测
     */
    $('.login-form fieldset:first-child').fadeIn('slow');

    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea')
        .on('focus', function() {
            $(this).removeClass('input-error');
        });
    // 注册按钮的判定
    $('#regBtn').click(function () {
    	alert(1111);
        window.open('../WebRoot/register.jsp');
    })
    // 提交按钮
    $('.login-form').on('submit', function(e) {
        $(this).find('input[type="text"], input[type="password"], textarea').each(function() {
            if( $(this).val() == "" ) {
                e.preventDefault();
                $(this).addClass('input-error');
            }
            else {
                $(this).removeClass('input-error');
            }
        });

    });


});