package com.rl.ecps.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ECPSUtils {
    public static String readProp(String key) {
        String value = null;
        InputStream in = ECPSUtils.class.getClassLoader().getResourceAsStream("ecps_prop.properties");
        Properties properties = new Properties();
        try {
            properties.load(in);
            value = properties.getProperty(key);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return value;
    }
}
