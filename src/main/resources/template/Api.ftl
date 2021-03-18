package ;

import kfang.infra.api.RequestResult;
import kfang.infra.api.RestfulBaseController;
import kfang.infra.api.validate.SecurityIdForm;
import kfang.infra.api.validate.SecurityIdsForm;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.ValidationException;
import java.util.List;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@Slf4j
@RestController
@RequestMapping("/${objectAlias}")
public class ${objectName}Api extends RestfulBaseController implements ${objectName}Feign {

    @Resource
    private ${objectName}Service ${objectAlias}Service;

    @GetMapping("/queryPage")
    public RequestResult<${"Pagination<"+objectName+"Vo>"}> queryPage(@RequestBody ${objectName}QueryPageForm form) {
        try{
            Pagination${"<"+objectName+"Vo>"} result=this.${objectAlias}Service.queryPage(form);
            return RespUtil.success(result);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @GetMapping("/queryAll")
    public RequestResult<${"List<"+objectName+"Vo>"}> queryAll(@RequestBody ${objectName}QueryForm form) {
        try{
            List${"<"+objectName+"Vo>"} result=this.${objectAlias}Service.queryAll(form);
            return RespUtil.success(result);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @GetMapping("/selectById")
    public RequestResult${"<"+objectName+"Vo>"} selectById(@RequestBody SecurityIdForm form) {
        try{
            ${objectName}Vo result=this.${objectAlias}Service.selectById(form.getId());
            return RespUtil.success(result);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @GetMapping("/selectByIds")
    public RequestResult<${"List<"+objectName+"Vo>"}> selectByIds(@RequestBody SecurityIdsForm form) {
        try{
            List${"<"+objectName+"Vo>"} result=this.${objectAlias}Service.selectByIds(form);
            return RespUtil.success(result);
        }catch (Exception e){
            log.error("",e);
            return RespUtil.serviceError(e.getMessage());
        }
    }

    @PostMapping("/insert")
    public RequestResult<${"Integer"}> insert(@RequestBody ${objectName}InsertForm form) {
        try{
            int result = this.${objectAlias}Service.insert(form);
            return RespUtil.success(result);
        }catch (Exception e){
            if(e instanceof ValidationException){
                return RespUtil.paramError(e.getMessage());
            }else{
                log.error("",e);
                return RespUtil.serviceError(e.getMessage());
            }
        }
    }

    @PostMapping("/update")
    public RequestResult<${"Integer"}> update(@RequestBody ${objectName}EditForm form) {
        try{
            int result = this.${objectAlias}Service.update(form);
            return RespUtil.success(result);
        }catch (Exception e){
            if(e instanceof ValidationException){
                return RespUtil.paramError(e.getMessage());
            }else{
                log.error("",e);
                return RespUtil.serviceError(e.getMessage());
            }
        }
    }

    @PostMapping("/delete")
    public RequestResult<${"Integer"}> delete(@RequestBody SecurityIdForm form) {
        try{
            int result=this.${objectAlias}Service.delete(form.getId());
            return RespUtil.success(result);
        }catch (Exception e){
            if(e instanceof ValidationException){
                return RespUtil.paramError(e.getMessage());
            }else{
                log.error("",e);
                return RespUtil.serviceError(e.getMessage());
            }
        }
    }

}