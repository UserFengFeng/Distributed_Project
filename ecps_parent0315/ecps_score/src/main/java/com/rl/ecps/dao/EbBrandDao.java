package com.rl.ecps.dao;

import com.rl.ecps.model.EbBrand;

import java.util.List;

public interface EbBrandDao {
    void saveBrand(EbBrand brand);

    List<EbBrand> selectBrandAll();

    List<EbBrand> selectBrandByName(String brandName);
}
