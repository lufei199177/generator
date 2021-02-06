package com.generator.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author lufei
 * @version 1.0
 * @Date 2020-01-04 16:50
 * @Description
 */
public class ConfigUtil {

    private static final Properties properties = new Properties();

    static {
        InputStream is = ConfigUtil.class.getClassLoader().getResourceAsStream("config.properties");
        try {
            properties.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String get(String key) {
        return properties.getProperty(key);
    }

}
