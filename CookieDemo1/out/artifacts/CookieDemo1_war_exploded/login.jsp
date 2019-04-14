<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,java.net.*" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>login page</title>
</head>
<body>
<h1>用户登录</h1>
<hr/>
<%
    request.setCharacterEncoding("utf-8");
    String userName = "";
    String passWord = "";
    //以下表示找到已存在的Cookie对象
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (Cookie c : cookies) {
            if (c.getName().equals("usernameC")) {
                userName = URLDecoder.decode(c.getValue(), "utf-8");//使用URLDecoder解码
            }
            if (c.getName().equals("passwordC")) {
                passWord = URLDecoder.decode(c.getValue(), "utf-8");
            }
        }
    }
%>
<form name="loginForm" action="dologin.jsp" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" value="<%=userName%>"/></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password" value="<%=passWord%>"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="checkbox" name="isUseCookie" checked="checked"/>十天内记住我的登录状态</td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="登录"/><input type="reset" value="取消"></td>
        </tr>
    </table>
</form>
</body>
</html>
