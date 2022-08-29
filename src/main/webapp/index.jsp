<%@ page import="com.ls.lsjavaweb.entity.MessageEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ls.lsjavaweb.UserMessage" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>留言板</title>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<style>

</style>
<body>
<%
    ArrayList<MessageEntity> logins;
    try {
        logins = new UserMessage().getUserMessageList();
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>
<div class="bg">
    <div class="header">
        <a class="head_item">首页</a>
        <a class="head_item">留言</a>
        <a class="head_item">导航</a>
        <a class="head_item">问答</a>
        <a class="head_item">体系</a>
        <a class="head_item">项目</a>
    </div>

    <div>
        <img src="img/test.jpg" class="banner" alt="error"/>
    </div>

    <div class="body_context">
        <ul class="box">
            <% for (MessageEntity login : logins) { %>
            <li>
                <div style="display: flex;">
                    <img src="img/icon_user.png" class="item_user_icon" alt="error"/>
                    <div style="flex: 1;">
                        <p class="item_user_name"><%=login.getUserid()%>
                        </p>
                        <p class="item_user_context">
                            <%=login.getContext() + "  " + login.getDate()%>
                        </p>
                    </div>
                </div>
            </li>
            <%} %>
        </ul>
    </div>

    <div>
        <ul class="body_page_num">
            <li>1</li>
        </ul>
    </div>

    <div class="foot_num">
        <a>Copyright ©Muzi</a>
        <a>蜀ICP备17031160号&nbsp;&nbsp;&nbsp;&nbsp;蜀ICP备17031160号</a>
    </div>
</div>
</body>
</html>
