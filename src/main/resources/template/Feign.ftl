package ;

import kfang.infra.api.RequestResult;
import kfang.infra.api.validate.SecurityIdForm;
import kfang.infra.api.validate.SecurityIdsForm;
import kfang.infra.common.model.Pagination;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@FeignClient(value = FeignConstant.OA, contextId = "PersonFeign")
public interface ${objectName}Feign {

    @GetMapping("/oa/${objectAlias}/queryPage")
    RequestResult${"<Pagination<"+objectName+"Vo>>"} queryPage(${objectName}QueryPageForm form);

    @GetMapping("/oa/${objectAlias}/queryAll")
    RequestResult${"<List<"+objectName+"Vo>>"} queryAll(${objectName}QueryForm form);

    @GetMapping("/oa/${objectAlias}/selectById")
    RequestResult${"<"+objectName+"Vo>"} selectById(SecurityIdForm form);

    @GetMapping("/oa/${objectAlias}/selectByIds")
    RequestResult${"<List<"+objectName+"Vo>>"} selectById(SecurityIdsForm form);

    @PostMapping("/oa/${objectAlias}/insert")
    RequestResult${"<Integer>"} insert(${objectName}InsertForm form);

    @PostMapping("/oa/${objectAlias}/update")
    RequestResult${"<Integer>"} update(${objectName}EditForm form);

    @PostMapping("/oa/${objectAlias}/delete")
    RequestResult${"<Integer>"} delete(SecurityIdForm form);
}
