<%@ page import="com.ls.lsjavaweb.entity.MessageEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ls.lsjavaweb.Servlet.IndexServlet" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>留言板</title>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<style>

    .input_message {
        max-width: 1030px;
        width: 1200px;
        height: 101px;
        background: #ffffff;
        border-radius: 20px;
        border: 0 none;
        outline: none;
        box-shadow: 0 4px 32px 0 rgba(47, 128, 237, 0.10);
    }

    .body_input {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }

    /*修改提示文字的颜色*/
    input::-webkit-input-placeholder {
        /* WebKit browsers */
        padding-left: 38px;
        width: auto;
        height: 36px;
        font-size: 26px;
        font-family: PingFang SC, PingFang SC-Regular, serif;
        font-weight: 400;
        text-align: LEFT;
        color: rgba(0, 0, 0, 0.24);
        line-height: 26px;

    }

    input:-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        padding-left: 38px;
        width: auto;
        height: 36px;
        font-size: 26px;
        font-family: PingFang SC, PingFang SC-Regular, serif;
        font-weight: 400;
        text-align: LEFT;
        color: rgba(0, 0, 0, 0.24);
        line-height: 26px;
    }

    input::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        padding-left: 38px;
        width: auto;
        height: 36px;
        font-size: 26px;
        font-family: PingFang SC, PingFang SC-Regular, serif;
        font-weight: 400;
        text-align: LEFT;
        color: rgba(0, 0, 0, 0.24);
        line-height: 26px;
    }

    input:-ms-input-placeholder {
        /* Internet Explorer 10+ */
        padding-left: 38px;
        width: auto;
        height: 36px;
        font-size: 26px;
        font-family: PingFang SC, PingFang SC-Regular, serif;
        font-weight: 400;
        text-align: LEFT;
        color: rgba(0, 0, 0, 0.24);
        line-height: 26px;
    }

</style>
<body>
<%
    ArrayList<MessageEntity> logins;
    try {
        IndexServlet indexServlet = new IndexServlet();
        logins = indexServlet.getUserMessageList();
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
    <div >

    </div>
    <div>
        <img src="./img/test.jpg" class="banner" alt="error"/>
        <div class="body_input">
            <form action="Index-servlet" method="post">
                <input class="input_message" name="message" type="text" placeholder="这里输入新的留言"/>
            </form>
        </div>
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
                        <p class="item_user_context"><%=login.getContext() + "  " + login.getDate()%>
                        </p>
                    </div>
                </div>
            </li>
            <%} %>
        </ul>
    </div>

    <div>
        <ul class="body_page_num">
            <% for (int i = 0; i < logins.size() % 10; i++) {%>
            <% int index = i + 1; %>
            <li>&nbsp;&nbsp;<%= index%>&nbsp;&nbsp;</li>
            <% } %>
        </ul>
    </div>

    <div class="foot_num">
        <a>Copyright ©Muzi</a>
        <a>蜀ICP备17031160号&nbsp;&nbsp;&nbsp;&nbsp;蜀ICP备17031160号</a>
    </div>
</div>
</body>
</html>
