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

    private String controllerPackage;
    private String servicePackage;
    private String serviceImplPackage;
    private String daoPackage;
    private String modelPackage;
    private String user;
    private String year;
    private String month;
    private String day;
    private String time;
    private String controllerName;
    private String serviceName;
    private String serviceAlias;
    private String objectName;
    private String objectAlias;
    private String daoName;
    private String daoAlias;
    private String tableName;
    private List<Table> tables;
    private List<String> importList;
}
