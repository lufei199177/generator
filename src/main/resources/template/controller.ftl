package ${controllerPackage};

import com.kfang.service.dict.basic.api.util.CommonUtil;
import org.springframework.web.bind.annotation.*;

import ${modelPackage}.${objectName};
import ${servicePackage}.${serviceName};

import javax.annotation.Resource;
import java.util.List;
import kfang.infra.api.RequestResult;
import kfang.infra.api.RestfulBaseController;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@Slf4j
@RestController
@RequestMapping("/${objectAlias}")
public class ${controllerName} extends RestfulBaseController {

    @Resource
    private ${serviceName} ${serviceAlias};

    @GetMapping("/page")
    public RequestResult<${"Pagination"}<${objectName}>> page(@RequestBody ${objectName} form) {
        try{
            return this.${serviceAlias}.page(form);
        }catch (Exception e){
            log.error("",e);
            return CommonUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/add")
    public RequestResult<${"Integer"}> add(@RequestBody List<${objectName}> list) {
        try{
            return this.${serviceAlias}.add(list);
        }catch (Exception e){
            log.error("",e);
            return CommonUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/update")
    public RequestResult<${"Integer"}> update(@RequestBody List<${objectName}> list) {
        try{
            return this.${serviceAlias}.update(list);
        }catch (Exception e){
            log.error("",e);
            return CommonUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/delete")
    public RequestResult<${"Integer"}> delete(@RequestBody List<${"String"}> ids) {
        try{
            return this.${serviceAlias}.delete(ids);
        }catch (Exception e){
            log.error("",e);
            return CommonUtil.serviceError(e.getMessage());
        }
    }

}
