function submitUpload() {
    var option = {
        url: path + "/upload/uploadPic.do", // 上传的url
        dataType: "text", // 回调值的数据类型
        success: function (responseText) {
            var jsonObh = $.parseJSON(responseText);
            $("#imgsImgSrc").attr("src", jsonObh.realPath)
            $("#imgs").val(jsonObh.relativePath)
            $("#lastRealPath").val(jsonObh.realPath)
        },
        error: function () {
            alert("系统错误!");
        }
    }
    // 使用ajax方式提交表单，上传文件
    $("#form111").ajaxSubmit(option);
}

$(function () {
    $("#form111").submit(function () {
        var isSubit = true
        // 校验必填字段
        $(this).find("[reg2]").each(function () {
            var val = $(this).val().trim();
            // 获得正则
            var reg = $(this).attr("reg2");
            //  获得提示信息
            var tip = $(this).attr("tip");
            // 创建正则表达式的对象
            var regExp = new RegExp(reg);
            if (!regExp.test(val)) {
                $(this).next("span").html("<font color='red'>" + tip + "</font>");
                isSubit = false
                // 在jquery中跳出循环用return false
                return false
            } else {
                // 判断当前的input是品牌名称
                var inputName = $(this).attr("name")
                if (inputName == "brandName") {
                    // 校验品牌名称
                    var result = validBrandName(val);
                    if (result == "error") {
                        $(this).next("span").html("<font color='red'>品牌名称已存在</font>");
                        isSubit = false
                        // 在jquery中跳出循环用return false
                        return false
                    } else {
                        $(this).next("span").html("");
                    }
                } else {
                    $(this).next("span").html("");
                }
            }
        })

        $(this).find("[reg1]").each(function () {
            var val = $(this).val().trim();
            // 获得正则
            var reg = $(this).attr("reg1");
            //  获得提示信息
            var tip = $(this).attr("tip");
            // 创建正则表达式的对象
            var regExp = new RegExp(reg);
            if (val !== null && val !== "" && !regExp.test(val)) {
                $(this).next("span").html("<font color='red'>" + tip + "</font>");
                isSubit = false
                // 在jquery中跳出循环用return false
                return false
            } else {
                $(this).next("span").html("");
            }
        })
        // 防止表单二次提交
        if (isSubit) {
            tipShow("#refundLoadDiv")
        }
        return isSubit;
    })

    $("#form111").find("[reg2]").blur(function () {
        var val = $(this).val().trim();
        // 获得正则
        var reg = $(this).attr("reg2");
        //  获得提示信息
        var tip = $(this).attr("tip");
        // 创建正则表达式的对象
        var regExp = new RegExp(reg);
        if (!regExp.test(val)) {
            $(this).next("span").html("<font color='red'>" + tip + "</font>");
        } else {
            // 判断当前的input是品牌名称
            var inputName = $(this).attr("name")
            if (inputName == "brandName") {
                // 校验品牌名称
                var result = validBrandName(val);
                if (result == "error") {
                    $(this).next("span").html("<font color='red'>品牌名称已存在</font>");

                } else {
                    $(this).next("span").html("");
                }
            } else {
                $(this).next("span").html("");
            }
        }
    })

    $("#form111").find("[reg1]").blur(function () {
        var val = $(this).val().trim();
        // 获得正则
        var reg = $(this).attr("reg1");
        //  获得提示信息
        var tip = $(this).attr("tip");
        // 创建正则表达式的对象
        var regExp = new RegExp(reg);
        if (val !== null && val !== "" && !regExp.test(val)) {
            $(this).next("span").html("<font color='red'>" + tip + "</font>");
        } else {
            $(this).next("span").html("");
        }
    })
})

/**
 * 品牌名称重复性校验
 * ajax: 默认异步的
 * @param brandName
 * @returns {string}
 */
function validBrandName(brandName) {
    var result = "success"
    $.ajax({
        url: path + "/item/validBrandName.do",
        type: 'post',
        async: false, // 把ajax设置为同步
        data: {
            brandName: brandName
        },
        dataType: "text",
        success: function (responseText) {
            result = responseText;
        },
        error: function () {
            alert("系统错误");
        }
    })
    return result;
}