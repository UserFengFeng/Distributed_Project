package com.rl.ecps.dao;

import com.rl.ecps.model.EbBrand;
import com.rl.ecps.model.EbItem;
import com.rl.ecps.model.QueryCondition;

import java.util.List;

public interface EbItemDao {
    List<EbItem> selectItemByCondition(QueryCondition qc);

    Integer selectItemByConditionCount(QueryCondition qc);
}
