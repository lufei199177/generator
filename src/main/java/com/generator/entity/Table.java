package com.generator.entity;

/**
 * @author lufei
 * @version 1.0
 * @Date 2020-01-04 17:11
 * @Description
 */
public class Table {
    /**
     * 列名
     */
    private String columnName;
    /**
     * 数据类型
     */
    private String dataType;
    /**
     * 备注
     */
    private String comment;
    /**
     * 属性名
     */
    private String propertyName;

    public Table() {

    }

    public Table(String columnName, String propertyName, String dataType, String comment) {
        this.columnName = columnName;
        this.dataType = dataType;
        this.comment = comment;
        this.propertyName = propertyName;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }
}
