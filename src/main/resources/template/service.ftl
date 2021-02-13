package ${servicePackage};

import ${daoPackage}.${daoName};
import ${modelPackage}.${objectName};

import com.kfang.common.dict.util.CommonUtil;
import com.kfang.common.dict.util.ValidUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import kfang.infra.api.RequestResult;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
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
public class ${serviceName} {

    @Resource
    private ${daoName} ${daoAlias};

    public List<${objectName}> getByIds(List<${"String"}> ids){
        if(CollectionUtils.isEmpty(ids)){
            return new ArrayList<>();
        }
        return this.${daoAlias}.getByIds(ids);
    }

    public RequestResult<${"Pagination"}<${objectName}>> queryPage(${objectName} form) {
        List<${objectName}> list = this.${daoAlias}.list(form);
        Pagination<${objectName}> pagination = form.makePagination();
        pagination.setItems(list);
        return RequestResult.ok(pagination);
    }

    @Transactional
    public RequestResult<${"Integer"}> add(${objectName} form) {
        String message= ValidUtil.valid(form);
        if(message!=null){
            return message;
        }
        Date date=new Date();
        ${objectName} ${objectAlias}=new ${objectName}();
        BeanUtils.copyProperties(form,${objectAlias});
        ${objectAlias}.setId(CommonUtil.generatorId());
        ${objectAlias}.setCreateId("lufei");
        ${objectAlias}.setCreateTime(date);

        this.${daoAlias}.save(${objectAlias});
        return RequestResult.ok(1);
    }

    @Transactional
    public RequestResult<${"Integer"}> update(${objectName} form) {
        String message= ValidUtil.valid(form);
        if(message!=null){
            return message;
        }
        Date date=new Date();
        ${objectName} ${objectAlias}=new ${objectName}();
        BeanUtils.copyProperties(form,${objectAlias});

        ${objectAlias}.setModifyId("lufei");
        ${objectAlias}.setModifyTime(date);
        this.${daoAlias}.update(${objectAlias});
        return RequestResult.ok(1);
    }

    @Transactional
    public RequestResult<${"Integer"}> delete(List<${"String"}> list) {
        if(CollectionUtils.isEmpty(list)){
            return RespUtil.paramError("参数不能为空");
        }
        List<${"List<String>"}> lists=CommonUtil.split(list,50);
        lists.forEach(item-> this.${daoAlias}.delete(item));
        return RequestResult.ok(list.size());
    }
}
