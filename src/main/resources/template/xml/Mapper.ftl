<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="">

    <resultMap id="${objectName}Map" type="">
        <#list tables as item>
        <result property="${item.propertyName}" column="${item.columnName}"/>
        </#list>
    </resultMap>

    <sql id="basicSql">
        <#list tables as item>
        ${"t."+item.columnName}<#if (item_index < tables?size-1)>,</#if>
        </#list>
    </sql>

    <select id="queryPage" resultMap="${objectName}Map" parameterType="">
        select <include refid="basicSql"/>
        from ${tableName} t
    </select>

    <select id="queryAll" resultMap="${objectName}Map" parameterType="">
        select <include refid="basicSql"/>
        from ${tableName} t
    </select>

    <select id="selectById" resultMap="${objectName}Map" parameterType="string">
        select <include refid="basicSql"/>
        from ${tableName} t
        where t.${tables[0].columnName} = ${"#"+"{id}"}
    </select>

    <select id="selectByIds" resultMap="${objectName}Map" parameterType="java.util.List">
        select <include refid="basicSql"/>
        from ${tableName} t
        where t.${tables[0].columnName} in
        <foreach collection="list" item="item" open="(" close=")" separator=",">
            ${"#"+"{item}"}
        </foreach>
    </select>

    <insert id="insert" parameterType="">
        insert into ${tableName}
        (
        <#list tables as item>
        ${item.columnName}<#if (item_index < tables?size-1)>,</#if>
        </#list>
        )
        values
        (
        <#list tables as item>
        ${"#"+"{"+item.propertyName+",jdbcType="+item.jdbcType+"}"}<#if (item_index < tables?size-1)>,</#if>
        </#list>
        )
    </insert>

    <update id="update" parameterType="">
        update ${tableName}
        <set>
        <#list tables as item>
        <#if (item_index > 0)>
            <if test="${item.propertyName} !=null">
                ${item.columnName}=${"#"+"{"+item.propertyName+"}"},
            </if>
        </#if>
        </#list>
        </set>
        where ${tables[0].columnName}=${"#"+"{"+tables[0].propertyName+"}"}
    </update>

    <delete id="delete" parameterType="string">
        delete from ${tableName} where ${tables[0].columnName} =${"#"+"{id}"}
    </delete>
</mapper>
