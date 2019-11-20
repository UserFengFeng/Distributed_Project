$(function () {
    // 获得上下架状态
    var showStatus = parseInt($("#showStatus").val(), 10);
    if (showStatus == 1) {
        $("#label4").attr("class", "here");
    } else if (showStatus == 0) {
        $("#label5").attr("class", "here");
    } else {
        $("#label6").attr("class", "here");
    }
})