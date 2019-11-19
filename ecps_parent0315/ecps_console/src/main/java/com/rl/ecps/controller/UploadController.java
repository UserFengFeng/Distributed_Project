package com.rl.ecps.controller;

import com.rl.ecps.utils.ECPSUtils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

/*
 * (1)上传文件：
 * 1.依赖表单
 * 2.表单的请求方式是post
 * 3.表单的enctype="multipart/form-data"
 * 4.表单中必须要有file类型的input
 * (2)做成提交文件上传弄得表单，但是页面不能跳转
 *   需用我们用jquery.form.js插件 （以ajax的方式来提交表单）
 * (3)设置springmvc的复杂类型的数据解析器
 * (4)把  文件服务器  变成非只读，以便于我们可以上传图片和删除图片
 * (5)回传绝对路径和相对路径
 *      目的显示缩略图，相对路径保存到数据库中
 * */
@Controller
@RequestMapping("/upload")
public class UploadController {

    @RequestMapping("/uploadPic.do")
    public void uploadPic(HttpServletRequest request, PrintWriter pw, String lastRealPath) throws IOException {
        // 强制转换request
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
        // 从表单中获得文件
        // 获得文件类型input的name
        Iterator<String> fileNames = mr.getFileNames();
        String inpuName = fileNames.next();

        // 获得文件
        MultipartFile file = mr.getFile(inpuName);
        byte[] mfs = file.getBytes();

        // 定义上传后的文件名称
        String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        Random random = new Random();
        for (int i = 0; i < 3; i++) {
            fileName = fileName + random.nextInt(10);
        }

        // 获得后缀名
        String originalFilename = file.getOriginalFilename(); // 原始文件名
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        // 要上传文件的绝对路径
        String realPath = ECPSUtils.readProp("upload_file_path") + "/upload/" + fileName + suffix;
        String relativePath = "/upload/" + fileName + suffix; // 相对路径

        // 由于需要在不同主机上上传，不能通过流的方式写文件，必须使用jersey
        Client client = Client.create(); // 创建jersey客户端

        // 判断是不是第一次上传
        if(StringUtils.isNotBlank(lastRealPath)) {
            WebResource resource = client.resource(lastRealPath);
            resource.delete();
        }

        // 指定要上传的具体地址,参数就是要上传的绝对路径
        WebResource resource = client.resource(realPath);
        // 文件上传到文件服务器中
        resource.put(mfs);
        // 使用json对象把绝对路径和相对路径写进去
        JSONObject json = new JSONObject();
        json.accumulate("realPath", realPath);
        json.accumulate("relativePath", relativePath);
        // ｛"realPath" : 'xxx', "relativePath": "xx"｝
        String s = json.toString();
        pw.write(s);
    }
}
