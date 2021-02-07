package ${daoPackage};

import ${modelPackage}.${objectName};

import java.util.List;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
public interface ${daoName} {

    /**
    * 分页查询
    */
    List<${objectName}> page(${objectName} form);

    /**
    * 批量保存
    */
    int batchSave(List<${objectName}> list);

    /**
    * 保存
    */
    int save(${objectName} dto);

    /**
    * 修改
    */
    int update(${objectName} dto);

    /**
    * 删除
    */
    int delete(List<${"String"}> list);
}
