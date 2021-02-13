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
    List<${objectName}> list(${objectName} form);

    /**
    * 根据id查询
    */
    List<${objectName}> getByIds(List<${"String"}> ids);

    /**
    * 批量保存
    */
    int batchSave(List<${objectName}> list);

    /**
    * 保存
    */
    int save(${objectName} objectAlias);

    /**
    * 修改
    */
    int update(${objectName} objectAlias);

    /**
    * 删除
    */
    int delete(List<${"String"}> list);
}
