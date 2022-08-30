package com.ls.lsjavaweb.Servlet;

import com.ls.lsjavaweb.entity.MessageEntity;
import com.ls.lsjavaweb.utils.JdbcUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
