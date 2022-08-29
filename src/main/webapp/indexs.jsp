<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ls.lsjavaweb.UserMessage" %>
<%@ page import="com.ls.lsjavaweb.entity.MessageEntity" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%="Hello World!"%>
</h1>
<br/>

<a href="hello-servlet">Hello Servlet</a>
<a href="inster-servlet">Hello Servlet</a>
<%
    ArrayList<MessageEntity> logins;
    try {
        logins = new UserMessage().getUserMessageList();
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>
<table>
    <tr>
        <td>编号</td>
        <td>用户名</td>
        <td>密码</td>
    <tr>
    <% for(MessageEntity login: logins){  %>
    <tr>
        <td><%=login.getId()%>
        </td>
        <td><%=login.getUserid()%>
        </td>
        <td><%=login.getContext()%>
        </td>
        <td><%=login.getDate()%>
        </td>
    <tr>
    <%} %>
</table>
<br/>
<div id="userRegist">
    <h3>用户注册界面</h3>
    <form class="form-horizontal" id="userRegistForm">
        <div class="form-group">
            <label for="userId" class="col-sm-2 control-label">用户id</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userId" placeholder="用户名" name="userName">
            </div>
        </div>
        <div class="form-group">
            <label for="userContext" class="col-sm-2 control-label">内容</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="userContext" placeholder="密码" name="userPwd">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-default" id="userRegistBtn">提交</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
