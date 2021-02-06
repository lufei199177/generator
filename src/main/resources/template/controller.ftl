package ${controllerPackage}.controller;

import org.springframework.web.bind.annotation.*;
import test.entity.ResultJson;

import ${modelPackage}.${objectName};
import ${servicePackage}.${serviceName};

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
* @author ${user}
* @date ${year}-${month}-${day} ${time}
* @desc
*/
@RestController
@RequestMapping("${objectAlias}")
public class ${controllerName} extends BaseController {

    @Resource
    private ${serviceName} ${serviceAlias};

    @GetMapping("/list")
    public ResultJson list() {
        ResultJson resultJson;
        try {
            List<${objectName}> list = this.${serviceAlias}.list(new HashMap<>());
            resultJson = this.getSuccessResultJson("", list);
        } catch (Exception e) {
            logger.error("", e);
            resultJson = this.getErrorResultJson(e.getMessage());
        }
        return resultJson;
    }

    @PostMapping("/add")
    public ResultJson add(@RequestBody ${objectName} ${objectAlias}) {
        ResultJson resultJson;
        try {
            ${objectAlias}.setCreatedById(this.getCurrentUserCode());
            ${objectAlias}.setCreatedDate(new Date());
            this.${serviceAlias}.save(${objectAlias});
            resultJson = this.getSuccessResultJson("保存成功!");
        } catch (Exception e) {
            logger.error("", e);
            resultJson = this.getErrorResultJson(e.getMessage());
        }
        return resultJson;
    }

    @PostMapping("/update")
    public ResultJson update(@RequestBody ${objectName} ${objectAlias}) {
        ResultJson resultJson;
        try {
            ${objectAlias}.setModifyById(this.getCurrentUserCode());
            ${objectAlias}.setModifyDate(new Date());
            this.${serviceAlias}.update(${objectAlias});
            resultJson = this.getSuccessResultJson("修改成功!");
        } catch (Exception e) {
            logger.error("", e);
            resultJson = this.getErrorResultJson(e.getMessage());
        }
        return resultJson;
    }

    @GetMapping("/delete")
    public ResultJson delete(@RequestParam("ids") String ids) {
        ResultJson resultJson;
        try {
            this.${serviceAlias}.delete(ids);
            resultJson = this.getSuccessResultJson("删除成功!");
        } catch (Exception e) {
            logger.error("", e);
            resultJson = this.getErrorResultJson(e.getMessage());
        }
        return resultJson;
    }
}
