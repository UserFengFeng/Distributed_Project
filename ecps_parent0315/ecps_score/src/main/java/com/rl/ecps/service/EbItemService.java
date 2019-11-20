package com.rl.ecps.service;

import com.rl.ecps.model.Page;
import com.rl.ecps.model.QueryCondition;

public interface EbItemService {
    Page selectItemByCondition(QueryCondition qc);

    Integer selectItemByConditionCount(QueryCondition qc);
}
