/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Hieu
 */
public class Comment {
    private int id;
    private int userid;
    private int bookid;
    private String comment;
    private Timestamp created;

    public Comment() {
    }

    public Comment(int id, int userid, int bookid, String comment, Timestamp created) {
        this.id = id;
        this.userid = userid;
        this.bookid = bookid;
        this.comment = comment;
        this.created = created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCreated() {
        LocalDateTime dateTime = created.toLocalDateTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a dd-MM-yyyy");
        return dateTime.format(formatter);
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }
}
