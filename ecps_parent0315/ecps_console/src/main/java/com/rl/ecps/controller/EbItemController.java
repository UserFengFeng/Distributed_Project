package com.rl.ecps.controller;

import com.rl.ecps.model.EbBrand;
import com.rl.ecps.model.Page;
import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.service.EbBarandService;
import com.rl.ecps.service.EbItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/item") // 类的映射
public class EbItemController {

    @Autowired
    private EbBarandService barandService;
    @Autowired
    private EbItemService ebItemService;

    @RequestMapping("/toIndex.do") // 方法映射
    public String toIndex() {
        return "item/index";
    }

    /*
    * 查询品牌
    * */
    @RequestMapping("/listBrand.do") // 方法映射
    public String listBrand(Model model) {
        List<EbBrand> ebBrands = barandService.selectBrandAll();
        model.addAttribute("bList", ebBrands);
        return "item/listbrand";
    }

    /*
     * 跳转添加品牌的页面
     * */
    @RequestMapping("/toAddBrand.do") // 方法映射
    public String toAddBrand() {
        return "item/addbrand";
    }

    /*
    * 验证品牌名称的重复性
    * */
    @RequestMapping("/validBrandName.do")
    public void validBrandName(String brandName, PrintWriter out){
        List<EbBrand> ebBrands = barandService.selectBrandByName(brandName);
        String flag = "success";
        if(ebBrands.size() > 0) {
            flag = "error";
        }
        out.write(flag);
    }

    /*
     * 添加品牌
     * */
    @RequestMapping("/addBrand.do")
    public String addBrand(EbBrand ebBrand){
        barandService.saveBrand(ebBrand);
        return "redirect:listBrand.do";
    }

    @RequestMapping("/listItem.do")
    public String listItem(QueryCondition qc, Model model) {
        List<EbBrand> ebBrands = barandService.selectBrandAll();
        model.addAttribute("bList", ebBrands);
        if(qc.getPageNo() == null) {
            qc.setPageNo(1);
        }
        Page page = ebItemService.selectItemByCondition(qc);
        model.addAttribute("page", page);
        // 把qc回显
        model.addAttribute("qc", qc);
        return "item/list";
    }
}
