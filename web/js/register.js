//验证用户名
function check_userName() {
    var userName = document.getElementById("name").value;
    var regName = /^[a-zA-Z]\w{4,16}$/;
    if (userName == "" || userName.trim() == "") {
        document.getElementById("err_name").innerHTML = "请输入用户名";
        return false;
    } else if (!regName.test(userName)) {
        document.getElementById("err_name").innerHTML = "由英文字母和数字组成的4-16位字符，以字母开头";
        return false;
    } else {
        document.getElementById("err_name").innerHTML = "ok!!!";
        return true;
    }
}

//验证密码
function check_passWord() {
    var passWord = document.getElementById("pwd").value;
    var regPwd = /^(\w){4,20}$/;
    if (passWord == "" || passWord.trim() == "") {
        document.getElementById("err_pwd").innerHTML = "请输入密码";
        return false;
    } else if (!regPwd.test(passWord)) {
        document.getElementById("err_pwd").innerHTML = "由4-20个字母、数字、下划线组成";
        return false;
    } else {
        document.getElementById("err_pwd").innerHTML = "ok!!!";
        return true;
    }
}

//验证昵称
    function check_nickName() {
        var nickName = document.getElementById("nick").value;
        var regName = /[\u4e00-\u9fa5]{2,6}/;
        if (nickName == "" || nickName.trim() == "") {
            document.getElementById("err_nick").innerHTML = "请输入昵称";
            return false;
        } else if (!regName.test(nickName)) {
            document.getElementById("err_nick").innerHTML = "由2-6个汉字组成";
            return false;
        } else {
            document.getElementById("err_nick").innerHTML = "ok!!!";
            return true;
        }
    }


//验证手机号
    function check_phone() {
        var phone = document.getElementById("phone").value;
        var regPhone =  /^1[3-578]{1}\d{9}$/;
        if (phone == "" || phone.trim() == "") {
            document.getElementById("err_phone").innerHTML = "请输入手机号";
            return false;
        } else if (!regPhone.test(phone)) {
            document.getElementById("err_phone").innerHTML = "手机号由11位数字组成，且以13,15,18开头";
            return false;
        } else {
            document.getElementById("err_phone").innerHTML = "ok!!!";
            return true;
        }
    }


    function showImage(file){
    if(check_image()){
        var image= document.getElementById("image");
        var adv = document.getElementById("adv");
        var reader = new FileReader();
        reader.onload = function(evt){adv.src = evt.target.result;}
        reader.readAsDataURL(file.files[0]);
        return true;
    }
    }
    
    function check_image() {
        var path = document.getElementById("image").value;
        var extStart = path.lastIndexOf('.'),
            ext = path.substring(extStart, path.length).toUpperCase();
        if (path.length == 0){
            alert("请上传图片!");
            return false;
        }else if(ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG' && ext !== '.GIF'){
            alert("图片格式不对!");
            resetFile();
            return false;
        }else {
            return true
        }
    }
//验证地址
function check_address() {
    var address = document.getElementById("address").value;
    var regAdd = /[\u4e00-\u9fa5]{2,6}/;
    if (address == "" || address.trim() == "") {
        document.getElementById("err_add").innerHTML = "请输入地址";
        return false;
    } else if (!regAdd.test(address)) {
        document.getElementById("err_add").innerHTML = "由2-6个汉字组成";
        return false;
    } else {
        document.getElementById("err_add").innerHTML = "ok!!!";
        return true;
    }
}

$(document).ready(function () {
    $("body").on('click','#send',function () {
        if (check_userName()==true&&check_image()==true&&check_address()==true&&check_phone()==true&&check_nickName()==true){
            $(this).prop("type","submit");
        } else {
            alert("填写信息")
        }
    })
})