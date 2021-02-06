package ${daoPackage};

import org.apache.ibatis.annotations.Mapper;
import ${modelPackage}.${objectName};

import java.util.List;
import java.util.Map;

/**
* @author ${user}
* @date ${year}-${month}-${day} ${time}
* @desc
*/
@Mapper
public interface ${daoName} {

    List<${objectName}> list(Map<String, Object> params);

    int save(${objectName} ${objectAlias});

    int update(${objectName} ${objectAlias});

    int delete(String id);
}
