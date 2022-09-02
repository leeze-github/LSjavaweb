package com.ls.lsjavaweb.utils;

import java.sql.*;

public class JdbcUtils {
    //加载驱动
    static{
        try {
//            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //获取连接(自己决定，封装到方法中)
    //static静态，直接使用类名.方法名更方便
    public static Connection getconnection() throws Exception{
        String url="jdbc:mysql://localhost:3306/user_message?useUnicode=true&characterEncoding=UTF-8";
        //上线需要改账号名称
//        String user="user_message";
        String user="root";
        String password="root";
        return DriverManager.getConnection(url,user,password);
    }
    //释放资源
    public static void release(ResultSet rs,PreparedStatement pstm,Connection conn) throws Exception{
        if(rs!=null){
            rs.close();
        }
        if(pstm!=null){
            pstm.close();
        }
        if(conn!=null){
            conn.close();
        }
    }
    //释放资源
    public static void release(ResultSet rs,Connection conn) throws Exception{
        if(rs!=null){
            rs.close();
        }
        if(conn!=null){
            conn.close();
        }
    }
}