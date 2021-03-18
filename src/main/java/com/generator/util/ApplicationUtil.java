package com.generator.util;

import com.generator.entity.ClassTemplate;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

/**
 * @author lufei
 * @version 1.0
 * @Date 2020-01-04 17:02
 * @Description
 */
public class ApplicationUtil {

    private final static Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
    private final static ClassTemplate classTemplate = new ClassTemplate();



    static {
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        classTemplate.setUser(ConfigUtil.get("USER_NAME"));

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;
        int day = calendar.get(Calendar.DATE);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);
        String time = (hour < 10 ? "0" + hour : String.valueOf(hour)) + ":" + (minute < 10 ? "0" +
                minute : String.valueOf(minute));
        classTemplate.setYear(String.valueOf(year));
        classTemplate.setMonth(month < 10 ? "0" + month : String.valueOf(month));
        classTemplate.setDay(day < 10 ? "0" + day : String.valueOf(day));
        classTemplate.setTime(time);
    }


    public static void start(String[] tableNames, String[] tableObjNames) throws Exception {
        long start = System.currentTimeMillis();
        System.out.println("开始......");

        File templateFile = getTemplateFile();
        String fileDir = ConfigUtil.get("FILE_DIRECTORY");
        if (fileDir == null) {
            throw new Exception("FILE_DIRECTORY不能为空");
        }

        for (int i = 0; i < tableNames.length; i++) {
            classTemplate.setTableName(tableNames[i]);
            JDBCUtil.getTableInfo(classTemplate);
            if (classTemplate.getTables().size() == 0) {
                throw new SQLException("未查询到相应的表!");
            }

            String objectName = tableObjNames[i];
            String objectAlias = objectName.substring(0, 1).toLowerCase() + objectName.substring(1);
            classTemplate.setObjectAlias(objectAlias);
            classTemplate.setObjectName(objectName);

            generator(fileDir,templateFile,".java");
        }
        System.out.println("结束......");
        long end = System.currentTimeMillis();
        System.out.println("耗时:" + (end - start));
    }

    private static void generator(String filePath, File templateFile,String suffix)
            throws IOException, TemplateException {
        File[] files = templateFile.listFiles();
        if (files == null || files.length == 0) {
            return;
        }
        cfg.setDirectoryForTemplateLoading(templateFile);
        for (File file : files) {

            if(file.isDirectory()){
                generator(filePath,file,"."+file.getName());
                continue;
            }
            String fileName = file.getName();

            int a=fileName.lastIndexOf(".ftl");
            if(a<=0){
                continue;
            }

            String classFileName = classTemplate.getObjectName()+fileName.substring(0,a)+suffix;

            Template temp = cfg.getTemplate(fileName);
            Writer out = new OutputStreamWriter(new FileOutputStream(filePath + "\\" + classFileName),
                    StandardCharsets.UTF_8);
            temp.process(classTemplate, out);
        }
    }

    /**
     * 获取模板文件所在文件夹
     */
    private static File getTemplateFile() throws FileNotFoundException {
        URL url = ApplicationUtil.class.getClassLoader().getResource("template");
        if (url == null) {
            throw new FileNotFoundException("resources下未找到template文件夹");
        }
        String templateUrl = url.getPath();
        return new File(templateUrl);
    }
}
