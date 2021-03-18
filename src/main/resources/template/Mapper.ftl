package ;

import kfang.infra.common.model.Pagination;

import java.util.List;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
public interface ${objectName}Mapper {

    /**
    * 分页查询
    */
    Pagination<${objectName+"Vo"}> queryPage(Pagination<${objectName+"Vo"}> pagination,${objectName}QueryPageForm form);

    /**
    * 查询所有
    */
    List<${objectName+"Vo"}> queryAll(${objectName}QueryForm form);

    /**
    * 根据id查询
    */
    ${objectName}Vo selectById(${"String"} id);

    /**
    * 根据id查询
    */
    List<${objectName+"Vo"}> selectByIds(List<${"String"}> ids);

    /**
    * 保存
    */
    int insert(${objectName}InsertForm form);

    /**
    * 修改
    */
    int update(${objectName}EditForm form);

    /**
    * 删除
    */
    int delete(${"String"} id);
}
