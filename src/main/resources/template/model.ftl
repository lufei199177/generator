package ${modelPackage};

import lombok.Data;

<#list importList as item>
import ${item};
</#list>

/**
* @author ${user}
* @date ${year}-${month}-${day} ${time}
* @desc
*/
@Data
public class ${objectName} {
<#list tables as table>
    /**
     * ${table.columnName}
     * ${table.comment}
     */
    private ${table.dataType} ${table.propertyName};
</#list>
}
