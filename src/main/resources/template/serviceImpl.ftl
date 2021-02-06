package ${serviceImplPackage};

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import ${daoPackage}.${daoName};
import ${modelPackage}.${objectName};
import ${servicePackage}.${serviceName};

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
* @author ${user}
* @date ${year}-${month}-${day} ${time}
* @desc
*/
@Service
public class ${serviceName}Impl implements ${serviceName} {

    @Resource
    private ${daoName} ${daoAlias};

    @Override
    public List<${objectName}> list(Map<String, Object> params) {
        return this.${daoAlias}.list(params);
    }

    @Override
    public int save(${objectName} ${objectAlias}) {
        return this.${daoAlias}.save(${objectAlias});
    }

    @Override
    public int update(${objectName} ${objectAlias}) {
        return this.${daoAlias}.update(${objectAlias});
    }

    @Override
    public int delete(String ids) {
        if (StringUtils.isBlank(ids)) {
            return 0;
        }
        String[] arr = ids.split(",");
        for (String id : arr) {
            this.${daoAlias}.delete(id);
        }
        return ids.length();
    }
}
