package com.ls.lsjavaweb.entity;

import java.sql.Date;

public class MessageEntity {
    private int id;
    private String userid;
    private String context;
    private Date date;

    public MessageEntity(int id, String userid, String context, Date date) {
        this.id = id;
        this.userid = userid;
        this.context = context;
        this.date = date;
    }

    @Override
    public String toString() {
        return "MessageEntity{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", context='" + context + '\'' +
                ", date=" + date +
                '}';
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }
}
