<!--此文件为tabs-content基础布局实现,请参考此文档结构添加新的碎片页面, wuwz@live.com-->
<!--此处可以引入除基础js以外的其他js插件以及css样式文件-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="easyui-tabs-content">

<%--    <div class="search-box easyui-panel" data-options="title:'查询条件'">
        <input class="easyui-textbox" data-options="prompt:'Item ID'" />
        <input class="easyui-textbox" data-options="prompt:'Product'" />
        <input class="easyui-textbox" data-options="prompt:'List Price'" />

        <a class="easyui-linkbutton"><i class="fa fa-search"></i> 查询</a>
        <a class="easyui-linkbutton"><i class="fa fa-rotate-left"></i> 重置</a>
        <a class="easyui-linkbutton">高级查询 <i class="fa fa-angle-double-down"></i></a>
    </div>--%>
    <div class="datagrid-content">
        <table class="easyui-datagrid-test"></table>
    </div>

    <script type="text/javascript">
        $('.easyui-datagrid-test').datagrid({
            title: '数据表格',
            fit:true,
            singleSelect:true,
            collapsible:true,
            url:'${ctx}/user/query',
            method:'get',
            fitColumns: true,
            pagination: true,
            columns: [ [
                {field: 'userId',title: '用户标号',width:80},
                {field: 'username',title: '用户姓名',width:80},
                {field: 'password',title: '登录密码',width:80},
                {field: 'addTime',title: '注册时间',width:80}
            ] ],
            toolbar: [
                {text: '刷新',iconCls:'icon-reload'},
                {text: '添加',iconCls:'icon-add'},
                {text: '修改',iconCls:'icon-edit'},
                {text: '删除',iconCls:'icon-remove'}
            ]
        });
    </script>
</div>