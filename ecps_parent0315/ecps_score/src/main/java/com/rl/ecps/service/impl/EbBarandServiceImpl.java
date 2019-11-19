package com.rl.ecps.service.impl;

import com.rl.ecps.dao.EbBrandDao;
import com.rl.ecps.model.EbBrand;
import com.rl.ecps.service.EbBarandService;
import org.hsqldb.lib.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EbBarandServiceImpl implements EbBarandService {
    @Autowired
    private EbBrandDao ebBrandDa;

    public void saveBrand(EbBrand brand) {
        ebBrandDa.saveBrand(brand);
    }

    public List<EbBrand> selectBrandAll() {
        return ebBrandDa.selectBrandAll();
    }

    public List<EbBrand> selectBrandByName(String brandName) {
        return ebBrandDa.selectBrandByName(brandName);
    }
}
