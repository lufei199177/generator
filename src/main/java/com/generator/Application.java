package com.generator;

import com.generator.util.ApplicationUtil;

/**
 * @author lufei
 * @version 1.0
 * @Date 2020-01-04 16:19
 * @Desc
 */
public class Application {

    public static void main(String[] args) throws Exception {
        String[] tableNames = {"t_person_position_history"};
        String[] tableObjNames = {"PersonPositionHistory"};
        ApplicationUtil.start(tableNames, tableObjNames);
    }
}
