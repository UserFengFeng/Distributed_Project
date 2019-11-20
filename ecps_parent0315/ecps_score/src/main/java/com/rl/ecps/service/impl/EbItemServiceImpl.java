package com.rl.ecps.service.impl;

import com.rl.ecps.dao.EbItemDao;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.Page;
import com.rl.ecps.model.QueryCondition;
import com.rl.ecps.service.EbItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EbItemServiceImpl implements EbItemService {
    @Autowired
    private EbItemDao ebItemDao;

    public Page selectItemByCondition(QueryCondition qc) {
        // 查询当前的条件下的记录数
        int totalCount = ebItemDao.selectItemByConditionCount(qc);
        // 创建page对象
        Page page = new Page();
        page.setPageNo(qc.getPageNo());
        page.setTotalCount(totalCount);
        // 计算startNum和endNum
        Integer startNum = page.getStartNum();
        Integer endNum = page.getEndNum();
        // 把值设置给sql的查询对象
        qc.setStartNum(startNum);
        qc.setEndNum(endNum);
        // 查询结果集
        List<EbItem> ebItems = ebItemDao.selectItemByCondition(qc);
        page.setList(ebItems);
        return page;
    }

    public Integer selectItemByConditionCount(QueryCondition qc) {
        return null;
    }
}
