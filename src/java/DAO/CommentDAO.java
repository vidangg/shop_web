/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

/**
 *
 * @author Hieu
 */
public class CommentDAO {
    private Connection connection;

    public CommentDAO(Connection connection) {
        super();
        this.connection = connection;
    }
    
    public List<Comment> getCommentByProduct(int bookid) {
        List<Comment> listC = new ArrayList<>();
        String sql = "select id, userid, bookid, comment, created_at\n"
                + "from comment where bookid = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment a = new Comment();
                a.setId(rs.getInt("id"));
                a.setUserid(rs.getInt("userid"));
                a.setBookid(rs.getInt("bookid"));
                a.setComment(rs.getString("comment"));
                a.setCreated(rs.getTimestamp("created_at"));
                listC.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listC;
    }
    
    public void newComment(int userid, int bookid, String comment) {
        String sql = "INSERT INTO comment (userid, bookid, comment) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, bookid);
            st.setString(3, comment);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteComment(int id) {
        String sql = "DELETE FROM comment WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
