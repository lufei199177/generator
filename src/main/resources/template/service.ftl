package ${servicePackage};

import ${modelPackage}.${objectName};

import java.util.List;
import java.util.Map;

/**
* @author ${user}
* @date ${year}-${month}-${day} ${time}
* @desc
*/
public interface ${serviceName} {

    List<${objectName}> list(Map<String, Object> params);

    int save(${objectName} ${objectAlias});

    int update(${objectName} ${objectAlias});

    int delete(String ids);
}
