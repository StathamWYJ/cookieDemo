<%@ page import="java.text.CollationKey" %>
<%@ page import="java.net.*" %>
<%@ page import="sun.nio.cs.UTF_32" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>dologin page</title>
</head>
<body>
<h1>登录成功！</h1>
<hr>
<br>
<br>
<br>
<%
    //作用是用指定的编码集去覆盖request对象中的默认的"ISO-8859-1"编码集，
    // 这样request.getParameter("")方法就会用新的编码集去解码，
    // 但是这个方法有一个条件，就是必须在第一次使用request时就要调用这个方法来设置编码集，否则该方法就会无效。
    //这里设置的是编码，之后在user中取值还需要解码（或者转码）：URLDecoder.decode(c.getValue(),"utf-8");//使用URLDecoder解码
    request.setCharacterEncoding("utf-8");
    //首先判断用户是否选择了记住登录状态
    String[] isUseCookie = request.getParameterValues("isUseCookie");
    if (isUseCookie != null && isUseCookie.length > 0) {
        //把用户名和密码保存在Cookie对象中
        String username = URLEncoder.encode(request.getParameter("username"), "utf-8");
        //使用URLEncoder解决中文报错问题，在net包中
        String password = URLEncoder.encode(request.getParameter("password"), "utf-8");
        Cookie usernameCookie = new Cookie("usernameC", username);
        Cookie passwordCookie = new Cookie("passwordC", password);
        //保存上面两个对象
        usernameCookie.setMaxAge(864000);
        passwordCookie.setMaxAge(864000);//该Cookie对象保存多少秒（在这里是设置生存期限为十天）
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
    } else {//未选择记住，将Cookie对象置为失效
        //以下表示找到已存在的Cookie对象
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("usernameC") || c.getName().equals("passwordC")) {
                    c.setMaxAge(0);//设置Cookie失效
                    response.addCookie(c);//重新保存
                }
            }
        }
    }
%>
<a href="users.jsp" target="_blank">查看用户信息</a>
</body>
</html>
