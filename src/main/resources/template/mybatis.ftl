<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${daoPackage}.${daoName}">

    <resultMap id="${objectAlias}Map" type="${modelPackage}.${objectName}">
        <#list tables as item>
        <result property="${item.propertyName}" column="${item.columnName}" />
        </#list>
    </resultMap>

    <select id="list" resultMap="${objectAlias}Map">
        select t.* from ${tableName} t
    </select>

    <insert id="save">
        insert into ${tableName}
        (
        <#list tables as item>
        ${item.columnName}<#if (item_index < tables?size-1)>,</#if>
        </#list>
        )
        values
        (
        <#list tables as item>
        ${"#"+"{"+item.propertyName+"}"}<#if (item_index < tables?size-1)>,</#if>
        </#list>
        )
    </insert>

    <update id="update">
        update tab_route t
        set
        <#list tables as item>
        <#if (item_index > 0)>
        t.${item.columnName}=${"#"+"{"+item.propertyName+"}"}<#if (item_index < tables?size-1)>,</#if>
        </#if>
        </#list>
        where t.${tables[0].columnName}=${"#"+"{"+tables[0].propertyName+"}"}
    </update>

    <delete id="delete">
        delete from ${tableName} t where t.${tables[0].columnName}=${"#"+"{"+tables[0].propertyName+"}"}
    </delete>
</mapper>