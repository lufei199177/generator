package ;

<#list importList as item>
import ${item};
</#list>
import java.io.Serializable;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@Data
@ApiModel("实体类")
public class ${objectName}Model implements Serializable {
<#list tables as table>

    @ApiModelProperty("${table.comment}")
    private ${table.dataType} ${table.propertyName};
</#list>
}
