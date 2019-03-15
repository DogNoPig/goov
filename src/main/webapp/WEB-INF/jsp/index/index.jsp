<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>主页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${ctx}/static/plugins/easyui/themes/metro/easyui.css" />
    <link rel="stylesheet" href="${ctx}/static/plugins/easyui/themes/icon.css" />
    <link rel="stylesheet" href="${ctx}/static/plugins/easyui/style/metro-black/style.css" />
    <link rel="stylesheet" href="${ctx}/static/plugins/webfont/css/font-awesome.min.css" />

    <script src="${ctx}/static/plugins/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/jquery.jdirk.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/plugins/jeasyui.ext.js" ></script>
    <!--声明js代码域-->
    <script type="text/javascript">
        /*网页js功能*/
        $(function() {
            //退出功能
            $("#n_title_out").click(function() {
                //提示用户是否确定退出
                $.messager.confirm("确认对话框", "你真的要退出吗？", function(r) {
                    //退出
                    if (r) {
                        window.location.href = "01_login.html";
                    }
                })
            })
            //修改密码
            $("#n_title_pwd").click(function() {
                //打开修改密码窗口
                $("#div_pwd").window("open");
            })
            //确认修改密码
            $("#btnCon").click(function() {
                //校验原有密码
                if ($(":password:eq(0)").val() == "") {
                    $.messager.alert("原有密码", "原有密码不能为空！", "warning");
                } else if ($(":password:eq(1)").val() == "") {
                    //校验新密码
                    $.messager.alert("新密码", "新密码不能为空！", "warning");
                } else if ($(":password:eq(2)").val() == "") {
                    //校验确认密码
                    $.messager.alert("确认密码", "确认密码不能为空！", "warning");
                } else if ($(":password:eq(1)").val() != $(":password:eq(2)").val()) {
                    //校验两次密码
                    $.messager.alert("密码校验", "两次密码不一致！", "error");
                } else {
                    //关闭密码窗口
                    $("#div_pwd").window("close");
                    //$.messager.alert("密码修改","密码修改成功！","info");
                    $.messager.show({
                        title: '密码修改',
                        msg: '密码修改成功，新密码为:'+$(":password:eq(2)").val(),
                        timeout: 3000,
                        showType: 'slide'
                    });
                }
            })
            //取消密码修改
            $("#btnCan").click(function(){
                $("#div_pwd").window("close");
            })
            //树状菜单和选项卡的联动
            //给菜单添加单击事件
            $("#treeMenu").tree({
                onClick:function(node){
                    //控制台打印node内容
                    //console.log(node);
                    //获取attributes属性,判断是菜单还是菜单描述
                    var attrs=node.attributes;
                    if(attrs==null || attrs.url==null){
                        return;
                    }
                    //判断选项卡是否存在
                    var has = $("#div_tabs").tabs("exists",node.text);
                    if(has){
                        //选中存在的选项卡
                        $("#div_tabs").tabs("select",node.text);
                    }else{
                        //创建新的选项卡面板
                        $("#div_tabs").tabs("add",{
                            title:node.text,
                            closable:true,
                            content:"<iframe src="+attrs.url+" style='width:100%;height:98%' frameborder='0'/>"
                        })
                    }
                }
            })
        })
    </script>
</head>

<body class="easyui-layout" data-options="fit:true" >
    <div id="easyui-header" data-options="region:'north'" style="display: none;">
        <div class="logo-content">
            <span class="logo-icon fa fa-leaf"></span>
            <span class="project-name">不会</span>
        </div>
        <div class="quick-link-content">
            <a class="quick-item easyui-linkbutton" plain="true" tree-target="json/tree1.json">
                <center class="top-fa-center"><i class="fa fa-drivers-license-o fa-2x"></i></center>
                <span class="quick-item-name">用户管理</span>
            </a>
            <a class="quick-item easyui-linkbutton" plain="true" tree-target="json/tree2.json">
                <center class="top-fa-center"><i class="fa fa-desktop fa-2x"></i></center>
                <span class="quick-item-name">控制面板</span>
            </a>
            <a class="quick-item easyui-linkbutton" plain="true" tree-target="json/tree3.json">
                <center class="top-fa-center"><i class="fa fa-cog fa-2x"></i></center>
                <span class="quick-item-name">系统配置</span>
            </a>
            <a class="quick-item easyui-linkbutton" plain="true" tree-target="json/tree4.json">
                <center class="top-fa-center"><i class="fa fa-envelope-o fa-2x"></i></center>
                <span class="quick-item-name">我的邮件</span>
            </a>
            <a class="quick-item easyui-linkbutton" plain="true" tree-target="json/tree5.json">
                <center class="top-fa-center"><i class="fa fa-trash fa-2x"></i></center>
                <span class="quick-item-name">回收站</span>
            </a>
        </div>
        <div class="user-info">
            <a href="javascript:void(0)" class="easyui-menubutton" data-options="plain:true,menu:'#user-info-mm',iconCls:'icon-user-info'"><shiro:principal/></a>
            <div id="user-info-mm" style="width:150px;">
                <shiro:hasPermission name="NO1">
                    <div>我的资料</div>
                </shiro:hasPermission>
                <shiro:hasPermission name="NO2">
                    <div>更改密码</div>
                </shiro:hasPermission>
                <div class="menu-sep"></div>
                <div iconCls="icon-exit"><a href="${ctx}/logout">安全退出</a></div>
            </div>
        </div>
    </div>
    <div id="easyui-nav" data-options="region:'west',split:true,title:'导航菜单',minWidth:200,maxWidth:300">
        <ul id="left-menu-tree" class="easyui-tree"></ul>
    </div>
    <div data-options="region:'center',title:'',border:false">
        <div id="easyui-main-tabs" class="easyui-tabs" data-options="fit:true">
            <div title="欢迎使用" data-options="iconCls:'icon-home',href:'https://www.baidu.com/'"></div>
        </div>
    </div>

    <div id="easyui-footer" data-options="region:'south'" style="display: none;">
			<span class="copyright-text">
				Copyright &copy; 2016 <a href="http://www.github.com/wuwz">jeeweb.org</a> Allrights Reserved.
			</span>
</div>

    <script type="text/javascript">
        // 顶部模块单击事件
        $('.quick-item').live('click',function() {
            $(this).addClass('quick-item-selected');
            $('.quick-item').not(this).removeClass('quick-item-selected');

            var treeTarget = $(this).attr('tree-target');
            var targetName = $(this).find('.quick-item-name').html();

            // 导航栏名称变更
            //$('#easyui-nav').layout('panel','west').panel('setTitle',targetName);
            $('.layout-panel-west .panel-title').text(targetName);

            // 重新渲染tree
            $('#left-menu-tree').tree({
                animate: true,
                method: 'get',
                url: treeTarget,
                lines: true,
                onSelect: function(node) {
                    if(node.url) {
                        $.easyuiExt.openTab({
                            id: 'tabs-test',
                            inIFrame: false,
                            title: node.text,
                            href: node.url,
                            iconCls:'icon-file',
                            closable: true
                        });
                    }
                },
                onLoadError: onNoTreeData,
                onLoadSuccess: function(node, data) {
                    if(!data || data.length == 0) {
                        onNoTreeData();
                    }
                }
            });
        });

        // 当左侧菜单下没有数据时展示
        var onNoTreeData = function() {
            $('#left-menu-tree').html("<center style='margin-top:15px;color: #666;'>该模块下暂时没有子菜单.</center>");
        }

        // 执行初始化工作
        window.onload = function() {
            // 1. 默认点击第一个菜单模块
            $('.quick-item').first().trigger('click');

            // 2 .绑定tabs右键菜单
            $.easyuiExt.bindTabsContextMenu($.easyuiExt.getMainTab());

            $('#easyui-header').fadeIn(300);
            $('#easyui-footer').fadeIn(300);
        }
    </script>
</body>
</html>
