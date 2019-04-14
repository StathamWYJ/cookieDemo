<%@ page import="java.net.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户信息page</title>
</head>
<body>
<h1>用户信息</h1>
<hr>
<br>
<br>
<br>
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
                passWord = URLDecoder.decode(c.getValue(), "utf-8");//使用URLDecoder解码
            }
        }
    }
%>
用户名：<%=userName%><br>
密码：<%=passWord%><br>
</body>
</html>
