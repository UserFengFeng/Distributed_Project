package com.rl.ecps.service;

import com.rl.ecps.model.EbBrand;

import java.util.List;

public interface EbBarandService {
    void saveBrand(EbBrand brand);

    List<EbBrand> selectBrandAll();

    List<EbBrand> selectBrandByName(String brandName);
}
