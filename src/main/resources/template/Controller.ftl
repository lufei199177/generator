package ;

import com.kfang.web.controller.ApiSwaggerTags;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import kfang.infra.api.JsonCommonCodeEnum;
import kfang.infra.api.validate.IdForm;
import kfang.infra.api.validate.IdsForm;
import kfang.infra.common.model.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@Lazy
@Slf4j
@RestController
@RequestMapping("/security/${objectAlias}")
@Api(tags = ApiSwaggerTags.LEVEL_TAG,value = "岗位管理")
public class ${objectName}Controller extends WebBaseController {

    @Resource
    private ${objectName}WebService ${objectAlias}WebService;

    //@AuthorityAnnotation(AuthorityAnnotationEnums.ADMIN)
    @GetMapping("/selectById")
    @ApiOperation(value = "获取单个岗位信息")
    @ApiResponses({
        @ApiResponse(message = "岗位详情", code = 200, response = ${objectName}Vo.class)
    })
    public String selectById(IdForm form) {
        ${objectName}Vo result;
        try {
            result = ${objectAlias}WebService.selectById(form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }

    //@AuthorityAnnotation(AuthorityAnnotationEnums.ADMIN)
    @GetMapping("/selectByIds")
    @ApiOperation(value = "获取单个岗位信息")
    @ApiResponses({
        @ApiResponse(message = "岗位详情", code = 200, response = ${objectName}Vo.class)
    })
    public String selectById(IdsForm form) {
        List${"<"+objectName+"Vo>"} result;
        try {
            result = ${objectAlias}WebService.selectByIds(form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }

    //@AuthorityAnnotation(AuthorityAnnotationEnums.ADMIN)
    @PostMapping(value = "/insert")
    @ApiOperation(value = "新增岗位")
    @ApiResponses({
        @ApiResponse(message = "整数(受影响的行数)", code = 200, response = Integer.class)
    })
    public String insert(@RequestBody ${objectName}InsertWebForm form) {
        Integer result;
        try {
            result = ${objectAlias}WebService.insert(getUserId(), form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }

    //@AuthorityAnnotation(AuthorityAnnotationEnums.ADMIN)
    @PostMapping(value = "/updateById")
    @ApiOperation(value = "编辑岗位")
    @ApiResponses({
        @ApiResponse(message = "整数(受影响的行数)", code = 200, response = Integer.class)
    })
    public String updateById(@RequestBody ${objectName}EditWebForm form) {
        Integer result;
        try {
            result = ${objectAlias}WebService.updateById(getUserId(), form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }

    //@AuthorityAnnotation(AuthorityAnnotationEnums.ADMIN)
    @PostMapping(value = "/deleteById")
    @ApiOperation(value = "删除单个岗位")
    @ApiResponses({
        @ApiResponse(message = "整数(受影响的行数)", code = 200, response = Integer.class)
    })
    public String deleteById(@RequestBody IdForm form) {
        Integer result;
        try {
            result = ${objectAlias}WebService.deleteById(form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }


    //@AuthorityAnnotation(AuthorityAnnotationEnums.ADMIN)
    @GetMapping(value = "/queryPage")
    @ApiOperation(value = "分页查询岗位信息")
    @ApiResponses({
        @ApiResponse(message = "岗位信息", code = 200, response = ${objectName}Vo.class)
    })
    public String queryPage(${objectName}QueryPageWebForm form) {
        Pagination${"<"+objectName+"Vo>"} result;
        try {
            result = ${objectAlias}WebService.queryPage(form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }

    @GetMapping(value = "/queryAll")
    @ApiOperation(value = "查询岗位信息")
    @ApiResponses({
    @ApiResponse(message = "岗位信息", code = 200, response = ${objectName}Vo.class)
    })
    public String queryAll(${objectName}QueryWebForm form) {
        List${"<"+objectName+"Vo>"} result;
        try {
            result = ${objectAlias}WebService.queryAll(form);
        } catch (Exception e) {
            log.error("", e);
            return withCustomMessage(e.getMessage(), JsonCommonCodeEnum.E0001);
        }
        return success(result);
    }

}
