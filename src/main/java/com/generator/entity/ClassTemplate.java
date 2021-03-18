package com.generator.entity;

import lombok.Data;

import java.util.List;

/**
 * @author lufei
 * @date 2020-01-05 0:38
 * @desc
 */
@Data
public class ClassTemplate {

    private String user;
    private String year;
    private String month;
    private String day;
    private String time;
    private String objectName;
    private String objectAlias;
    private String tableName;
    private List<Table> tables;
    private List<String> importList;
}
