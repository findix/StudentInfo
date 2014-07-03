/**
 * 输入框被点击
 */
function onClick() {

    //对函数的第一个参数进行判断
    if (arguments[0]) {
        var obj = arguments[0];
    } else {
        return false;
    }

    //获取.tooltip
    var tooltip = $(obj).siblings('.tooltip');
    //.tooltip如果存在，就滑出
    if (tooltip.length != 0) {
        //对函数第二个参数进行判断
        if (arguments[1]) {
            var text = arguments[1];
        } else {
            text = tooltip.data('text');
        }
        //设置提示框文字
        tooltip.text(text);
        //滑出提示框
        tooltip.animate({left: '120%'});
    }
    ;
}

/**
 * 输入框失去焦点
 */
function onBlur() {
    //对函数的第一个参数进行判断
    if (arguments[0]) {
        var obj = arguments[0];
    } else {
        return false;
    }

    //获取.tooltip
    var tooltip = $(obj).siblings('.tooltip');
    //.tooltip如果存在，就滑入
    if (tooltip.length != 0) {
        tooltip.animate({left: '20%'});
    }
    ;
}

/**
 * 表单验证
 */
function checkForm() {
    //对函数的第一个参数进行判断
    if (arguments[0]) {
        //获取当前表单
        var form = arguments[0];
    } else {
        return false;
    }

    //验证规则汇总
    var id = new RegExp(/[0-9]{10}/);//匹配数字10次，用于工号匹配
    var password = new RegExp(/\w{6,16}/);//字母6到16次，用于密码匹配
    var chinese = new RegExp(/[^\u4e00-\u9fa5]|^$/);//匹配中文以外的字符，用于真实姓名验证
    var email = new RegExp(/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/);//用于邮箱格式验证

    //用户名username验证(同样适用身份证验证)
    if (form.username != undefined && !id.test(form.username.value)) {
        //不符合匹配规则
        onClick($(form.username)[0], '工号不规范，应为10位数字');
        //阻止页面跳转
        return false;
    }
    ;

    //密码password验证
    if (form.password != undefined && !password.test(form.password.value)) {
        //不符合匹配规则
        onClick($(form.password)[0], '新的密码不规范，应为6~16位字母和数字');
        //阻止页面跳转
        return false;
    }
    ;

    //用户类型type验证
    if ($(form).find('.option_result').text() == '用户类型') {
        //用户没有勾选
        onClick($('.option_result')[0], '请选择用户类型');
        //阻止页面跳转
        return false;
    }
    ;

    //真实姓名realname验证
    if (form.realname != undefined && chinese.test(form.realname.value)) {
        //有非中文字符
        onClick($(form.realname)[0], '姓名不规范');
        //阻止页面跳转
        return false;
    }
    ;

    //真实身份证号码id验证
    if (form.ID != undefined && !id.test(form.ID.value)) {
        //不符合匹配规则
        onClick($(form.ID)[0], '身份证号码不规范，应为10位数字');
        //阻止页面跳转
        return false;
    }
    ;

    //邮箱email验证
    if (form.email != undefined && !email.test(form.email.value)) {
        //不符合匹配规则
        onClick($(form.email)[0], '不是有效地电子邮件地址');
        //阻止页面跳转
        return false;
    }
    ;
}


$(document).ready(function () {
    /**
     * 展开/收起下拉列表
     */
    $('.option').click(function () {
        $(this).children('.option_list').slideToggle(100);
        $(this).toggleClass('active');
    });

    /**
     * 设置option的值
     */
    $('.option_list li').click(function () {
        //获取选择的值
        var text = $(this).text();
        //设置option的值
        $(this).parent().siblings('.option_result').text(text);
        //如果存在就收起提示栏
        var tooltip = $(this).parent();//原生js的parentNode是属性而不是方法
        if (tooltip.length != 0) {
            onBlur(tooltip[0]);//需要传入原生js对象
        }
        ;
    });

    /**
     * 切换到注册栏
     */
    $('#register_link').click(function () {
        //滑出#login栏，滑入#register栏
        $('#login').animate({left: '-100%'}, 400, function () {
            $('#register').animate({left: '50%'});
        });
    });

    /**
     * 切换到登陆栏
     */
    $('#login_link').click(function () {
        //滑出#register栏，滑入#login栏
        $('#register').animate({left: '120%'}, 400, function () {
            $('#login').animate({left: '50%'});
        });
    });

    /**
     * 登录
     */
    $('#login_btn').click(function () {
        var $obj = $(this);
        $obj.text('登录中...');
        setTimeout(function () {
            $obj.text('登录');
        }, 5000);
    });

    /**
     * 注册
     */
    $('#register_btn').click(function () {
        var $obj = $(this);
        $obj.text('注册中...');
        setTimeout(function () {
            $obj.text('注册');
        }, 5000);
    });


});