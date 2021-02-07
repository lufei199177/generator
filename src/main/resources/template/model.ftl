package ${modelPackage};

<#list importList as item>
import ${item};
</#list>
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
* @author: ${user}
* @date: ${year}-${month}-${day} ${time}
* @desc:
*/
@Data
public class ${objectName} {
<#list tables as table>
    <#if (table.dataType == "Date")>

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    <#else>

    </#if>
    @ApiModelProperty("${table.comment}")
    private ${table.dataType} ${table.propertyName};
</#list>
}
