package ;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import kfang.infra.api.RequestResult;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@Slf4j
@Service
public class ${objectName}Service {

    @Resource
    private ${objectName}Mapper ${objectAlias}Mapper;

    public ${objectName}Vo selectById(String id){
        if(StringUtils.isBlank(id)){
            return null;
        }

        return this.${objectAlias}Mapper.selectById(id);
    }

    public List<${objectName+"Vo"}> selectByIds(List<${"String"}> ids){
        if(CollectionUtils.isEmpty(ids)){
            return new ArrayList<>();
        }

        List<${objectName}> list = new ArrayList<>(ids.size());
        List<${"List<String>"}> lists=CommonUtil.split(ids,100);
        lists.forEach(item->list.addAll(this.${objectAlias}Mapper.selectByIds(item)));
        return list;
    }

    public Pagination<${objectName+"Vo"}> queryPage(${objectName}QueryPageForm form) {
        Pagination<${objectName}> pagination = form.makePagination();
        this.${objectAlias}Mapper.queryPage(pagination,form);
        return pagination;
    }

    public List<${objectName+"Vo"}> queryAll(${objectName}QueryForm form) {
        return this.${objectAlias}Mapper.queryAll(form);
    }

    @Transactional
    public int insert(${objectName}InsertForm form) {
        form.setId(CommonUtil.generatorId());
        return this.${objectAlias}Mapper.insert(form);
    }

    @Transactional
    public int update(${objectName}EditForm form) {
        return this.${objectAlias}Mapper.update(form);
    }

    @Transactional
    public int delete(${"String"} id) {
        return this.${objectAlias}Mapper.delete(id);
    }
}
