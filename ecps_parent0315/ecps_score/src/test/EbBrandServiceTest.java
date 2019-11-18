import com.rl.ecps.model.EbBrand;
import com.rl.ecps.service.EbBarandService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(value = SpringJUnit4ClassRunner.class) // 使用spring和junit整合的运行器
@ContextConfiguration(locations = {"classpath:beans.xml"}) // 指定spring的配置文件的位置
public class EbBrandServiceTest {

    @Autowired
    EbBarandService ebBarandService;

    @Test
    public void testSaveBrand() {
        EbBrand ebBrand = new EbBrand();
        ebBrand.setBrandName("小米");
        ebBrand.setBrandDesc("可以");
        ebBrand.setImgs("http://xx");
        ebBrand.setWebsite("http://kangjia");
        ebBrand.setBrandSort(1);
        ebBarandService.saveBrand(ebBrand);
    }

    @Test
    public void testQueryBrand() {
        List<EbBrand> ebBrands = ebBarandService.selectBrandAll();
        for (EbBrand e : ebBrands) {
            System.out.println(e.getBrandDesc());
            System.out.println(e.getBrandName());
            System.out.println(e.getBrandId());
        }
    }
}
