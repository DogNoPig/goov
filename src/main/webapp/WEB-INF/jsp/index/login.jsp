<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>登录页面</title>
    <!--引入主题样式-->
    <link rel="stylesheet" href="${ctx}/static/plugins/easyui/themes/metro/easyui.css" />
    <link rel="stylesheet" href="${ctx}/static/plugins/webfont/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx}/static/login/animate.min.css" />
    <link rel="stylesheet" href="${ctx}/static/login/login.css" />

    <script src="${ctx}/static/plugins/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/easyui/jquery.easyui.min.js"></script>
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
<div id="login-body" class="animated fadeInDown">
    <div class="project-icon-div">
        <span class="fa fa-leaf"></span>
    </div>
    <a href="${ctx}/testWebsocket">测试webSocket</a>
    <div class="welcome-div">
        <span class="welcome-tip">欢迎登录</span>
    </div>
    <div class="login-form-div">
        <form id="form" action="${ctx}/doLogin" method="post">
            <p>
                <input type="text" name="userName" class="easyui-textbox" data-options="prompt:'用户名'" />
            </p>
            <p>
                <input type="text" name="password" class="easyui-passwordbox" data-options="prompt:'密码'" />
            </p>
            <p>
                <label class="remember_me">
                    <input name="rememberMe" type="checkbox"/> 记住我?
                </label>
            </p>
            <p>
                <button type="submit" class="easyui-linkbutton login-btn">登录系统</button>
            </p>
        </form>
        <div class="error-tip" style="display: none;">
            <i class="fa fa-info-circle"></i>${msg}
        </div>
    </div>
    <span class="copyright-text">
				&copy; 2016 <a href="http://www.github.com/DogNoPig">jeeweb.org</a>
			</span>
</div>

<script type="text/javascript">
    $('#form').submit(function() {
        if(${msg != null}) {
            $('.error-tip').fadeIn(200);
            return false;
        }
        return true;
    });
</script>
</body>
</html>
