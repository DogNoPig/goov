<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>验证分页</title>
</head>
<body>
    <table>
        <tr>
            <th>userid</th>
            <th>username</th>
            <th>password</th>
        </tr>
        <c:forEach items="${users}" var="u">
            <tr>
                <td>${u.userid}</td>
                <td>${u.username}</td>
                <td>${u.password}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="${ctx}/user/list/2/2">下一页</a>
</body>
</html>
