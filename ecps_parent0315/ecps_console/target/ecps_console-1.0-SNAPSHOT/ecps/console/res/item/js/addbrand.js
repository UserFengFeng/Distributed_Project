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