package com.ls.lsjavaweb.Servlet;

import com.ls.lsjavaweb.entity.MessageEntity;
import com.ls.lsjavaweb.utils.JdbcUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
@WebServlet(name = "IndexServlet", value = "/Index-servlet")
public class IndexServlet extends HttpServlet {

    public ArrayList<MessageEntity> getUserMessageList() throws Exception {
        ArrayList<MessageEntity> a = new ArrayList<>();
        //查询
        Connection conn = JdbcUtils.getconnection();
        //定义sql语句
        String sql = "select * from u_message ";
        //获取执行sql的对象
        Statement stmt = conn.createStatement();
        //执行sql
        ResultSet rs = stmt.executeQuery(sql);
        //处理结果（1.向下移动光标 )
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String context = rs.getString("context");
            Date create_date = rs.getDate("create_time");
            a.add(new MessageEntity(id, name, context, create_date));
        }

        for (MessageEntity messageEntity : a) {
            System.out.println(messageEntity.getId() + "---"
                    + messageEntity.getUserid() + "---"
                    + messageEntity.getContext() + "---"
                    + messageEntity.getDate());
        }

        //释放资源,最后的先释放
        rs.close();
        stmt.close();
        conn.close();
        return a;
    }
    public void insertUserMessage(String message) throws Exception {
//        插入
        Connection conn = JdbcUtils.getconnection();
        String SQL = " insert into u_message (id,name,context,create_time) values(?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(SQL);
        pst.setInt(1, 0);
        pst.setString(2, "游客");
        pst.setString(3, message);
        pst.setDate(4, new Date(System.currentTimeMillis()));
        pst.executeUpdate();
        pst.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String message = req.getParameter("message");
        if (message.isEmpty()){
            PrintWriter out = resp.getWriter();
            out.println("<html><body>");
            out.println("<a href=\"index.jsp\" >内容为空 点击返回</a>");
            out.println("</body></html>");
            return;
        }
        try {
            insertUserMessage(message);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<a href=\"index.jsp\" >提交成功 点击返回</a>");
        out.println("</body></html>");
    }


}
