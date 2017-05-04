/**
 * Created by lcx on 2017/4/28.
 */
function checkForm(){
    var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var mail = document.getElementById("form-email").value;
    if(checkPassword()){
        if (filter.test(mail))
            return true;
        else {
            alert('您的电子邮件格式不正确');
            return false;
        }
    }else{
        return false;
    }
}
function checkPassword() {
    // 校验密码:
    // 获得密码框的值:
    var password = document.getElementById("form-password").value;
    // 校验确认密码:
    var repeatPassword = document.getElementById("form-repeat-password").value;
    if(repeatPassword != password){
        alert("两次密码输入不一致!");
        return false;
    }
}
function checkUserEmail() {
    // 获得文件框值:
    var email = document.getElementById("form-email").value;
    alert("请确认您的邮箱是第一次在本网站注册！");
}