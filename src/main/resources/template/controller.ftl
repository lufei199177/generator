package ${controllerPackage};

import ${modelPackage}.${objectName};
import ${servicePackage}.${serviceName};

import com.kfang.service.dict.city.RespUtil;
import java.util.List;
import javax.annotation.Resource;
import kfang.infra.api.RequestResult;
import kfang.infra.api.RestfulBaseController;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/queryPage")
    public RequestResult<${"Pagination"}<${objectName}>> queryPage(@RequestBody ${objectName} form) {
        try{
            return this.${serviceAlias}.queryPage(form);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @GetMapping("/getByIds")
    public RequestResult<${"List<Region>"}> getByIds(@RequestBody List<${"String"}> ids) {
        try{
            return RequestResult.ok(this.${serviceAlias}.getByIds(ids));
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/add")
    public RequestResult<${"Integer"}> add(@RequestBody ${objectName} form) {
        try{
            return this.${serviceAlias}.add(form);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/update")
    public RequestResult<${"Integer"}> update(@RequestBody ${objectName} form) {
        try{
            return this.${serviceAlias}.update(form);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/delete")
    public RequestResult<${"Integer"}> delete(@RequestBody List<${"String"}> ids) {
        try{
            return this.${serviceAlias}.delete(ids);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

}
