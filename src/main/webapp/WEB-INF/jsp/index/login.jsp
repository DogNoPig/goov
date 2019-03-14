<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/14
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>登录页面</title>
    <!--引入主题样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jqueryEasyUI/themes/default/easyui.css" />
    <!--引入图标样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jqueryEasyUI/themes/icon.css" />
    <!--引入jQuery文件-->
    <script src="${ctx}/static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <!--引入EasyUi的js文件-->
    <script src="${ctx}/static/js/jqueryEasyUI/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${ctx}/static/js/jqueryEasyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        table{
            margin: auto;
            margin-top: 20px;
        }
        tr{
            height: 40px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="panel_login" style="margin: auto;width: 500px;margin-top: 100px;">
        <!--创建登录面板-->
        <div id="login" class="easyui-panel" title="登录" data-options="iconCls:'icon-mlogin',minimizable:true,maximizable:true
                    ,collapsible:true,closable:true" style="width: 500px;height: 200px;">
            <form action="" method="post">
                <table>
                    <tr>
                        <td>用户名:</td>
                        <td>
                            <input class="easyui-textbox easyui-validatebox" type="text" name="userName" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密   码:</td>
                        <td>
                            <input class="easyui-textbox easyui-validatebox" type="password" name="password" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a id="btnCon" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'">登录</a>
                            <a id="btnCan" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">重置</a>
                            <a id="btnCan" href="${ctx}/person" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">首页测试</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
