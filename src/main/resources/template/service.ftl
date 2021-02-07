package ${servicePackage};

import org.springframework.stereotype.Service;
import ${daoPackage}.${daoName};
import ${modelPackage}.${objectName};

import javax.annotation.Resource;
import java.util.List;
import kfang.infra.api.RequestResult;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;

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

    public RequestResult<${"Pagination"}<${objectName}>> page(${objectName} form) {
        List<${objectName}> list = this.${daoAlias}.page(form);
        Pagination<${objectName}> pagination = form.makePagination();
        pagination.setItems(list);
        pagination.setRecordCount((int) page.getTotal());
        return RequestResult.ok(pagination);
    }

    public RequestResult<${"Integer"}> add(List<${objectName}> list) {
        return RequestResult.ok(list.size());
    }

    public RequestResult<${"Integer"}> update(List<${objectName}> list) {
        return RequestResult.ok(list.size());
    }

    public RequestResult<${"Integer"}> delete(List<${"String"}> list) {
        return RequestResult.ok(list.size());
    }
}
