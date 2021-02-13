<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${daoPackage}.${daoName}">

    <resultMap id="${objectAlias}Map" type="${modelPackage}.${objectName}">
        <#list tables as item>
        <result property="${item.propertyName}" column="${item.columnName}" />
        </#list>
    </resultMap>

    <sql id="basicSql">
        <#list tables as item>
        ${"t."+item.columnName}<#if (item_index < tables?size-1)>,</#if>
        </#list>
    </sql>

    <select id="list" resultMap="${objectAlias}Map">
        select <include refid="basicSql"/>
        from ${tableName} t
    </select>

    <select id="getByIds" resultMap="${objectAlias}Map">
        select <include refid="basicSql"/>
        from ${tableName} t
        where t.${tables[0].columnName} in
        <foreach collection="list" item="item" open="(" close=")" separator=",">
            #{item}
        </foreach>
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

    <insert id="batchSave">
        insert into ${tableName}
        (
        <#list tables as item>
        ${item.columnName}<#if (item_index < tables?size-1)>,</#if>
        </#list>
        )
        values
        <foreach collection="list" item="item" separator=",">
        (
        <#list tables as item>
        ${"#"+"{item."+item.propertyName+",jdbcType="+item.jdbcType+"}"}<#if (item_index < tables?size-1)>,</#if>
        </#list>
        )
        </foreach>
    </insert>

    <update id="update">
        update ${tableName} t
        set
        <trim suffixOverrides=",">
        <#list tables as item>
        <#if (item_index > 0)>
            <if test="${item.propertyName} !=null<#if (item.dataType=="String")> and ${item.propertyName} !=''</#if>">
                t.${item.columnName}=${"#"+"{"+item.propertyName+"}"},
            </if>
        </#if>
        </#list>
        </trim>
        where t.${tables[0].columnName}=${"#"+"{"+tables[0].propertyName+"}"}
    </update>

    <delete id="delete">
        delete from ${tableName} t where t.${tables[0].columnName} in
        <foreach collection="list" item="item" open="(" close=")" separator=",">
            #{item}
        </foreach>
    </delete>
</mapper>
