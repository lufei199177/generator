package com.generator.util;

import com.generator.entity.ClassTemplate;
import com.generator.entity.Table;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * @author lufei
 * @version 1.0
 * @Date 2020-01-04 17:03
 * @Description
 */
public class JDBCUtil {

    private static Connection connection;

    static {
        try {
            String driver = ConfigUtil.get("jdbc.driver");
            String url = ConfigUtil.get("jdbc.url");
            String username = ConfigUtil.get("jdbc.username");
            String password = ConfigUtil.get("jdbc.password");
            Properties props = new Properties();
            props.put("user", username);
            props.put("password", password);
            props.put("remarksReporting", "true");

            Class.forName(driver);
            connection = DriverManager.getConnection(url, props);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取表信息
     *
     * @param classTemplate
     * @return
     * @throws SQLException
     */
    public static void getTableInfo(ClassTemplate classTemplate) throws SQLException {
        List<Table> tables = new ArrayList<Table>();
        List<String> importList = new ArrayList<String>();

        DatabaseMetaData databaseMetaData = connection.getMetaData();
        String dbUserName = ConfigUtil.get("jdbc.username");
        ResultSet resultSet = databaseMetaData.getColumns(null, dbUserName.toUpperCase(), classTemplate.getTableName(), "%");
        while (resultSet.next()) {
            String columnName = resultSet.getString("COLUMN_NAME");
            String propertyName = handleColumn(columnName);
            String property = propertyName.substring(0, 1).toUpperCase() + propertyName.substring(1);
            String columnComment = resultSet.getString("REMARKS");
            String typeName = resultSet.getString("TYPE_NAME");
            String decimalDigits = resultSet.getString("DECIMAL_DIGITS");
            String dataType = ConfigUtil.get(typeName);
            //获取jdbc数据类型
            String jdbcType = ConfigUtil.get("TYPE_" + typeName);
            if (jdbcType == null) {
                jdbcType = typeName;
            }
            if (dataType != null && dataType.contains(".")) {
                if (!importList.contains(dataType)) {
                    importList.add(dataType);
                }
                String[] arr = dataType.split("\\.");
                dataType = arr[arr.length - 1];
            }
            Table table = new Table(columnName, propertyName, property, dataType, columnComment, jdbcType);
            tables.add(table);
        }
        classTemplate.setTables(tables);
        classTemplate.setImportList(importList);
    }

    private static String handleColumn(String columnName) {
        String[] arr = columnName.split("_");
        StringBuilder sb = new StringBuilder(arr[0].toLowerCase());
        for (int i = 1; i < arr.length; i++) {
            String str = arr[i];
            sb.append(str.substring(0, 1).toUpperCase()).append(str.substring(1).toLowerCase());
        }
        return sb.substring(1);
    }
}
