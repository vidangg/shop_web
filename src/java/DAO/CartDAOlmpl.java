/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.BookDtls;
import model.Cart;
/**
 *
 * @author Quan
 */
public class CartDAOlmpl implements CartDAO{
    
    private Connection connection;
    
    public CartDAOlmpl(Connection connection){
        this.connection=connection;
    }
    
    public boolean addCart(Cart c){
        boolean f=false;
        try{
            String sql="INSERT INTO cart(bid ,uid, bookName , author , price , total_price) values(?,?,?,?,?,?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2,c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4,c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());
            
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Cart> getBookByUser(int userId){
        List<Cart> list=new ArrayList<Cart>();
        Cart c=null;
        double totalPrice=0.0;
        try{
            String sql="SELECT * FROM cart WHERE uid=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1,userId);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                c=new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getDouble(6));
                
                totalPrice=totalPrice+rs.getDouble(7);
                c.setTotalPrice(totalPrice);
                list.add(c);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public boolean deleteBook(int bid, int uid, int cid){
        boolean f=false;
        try{
            String sql="DELETE FROM cart WHERE bid=? AND uid=? AND cid=? ";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2,uid);
            ps.setInt(3,cid);
            int i=ps.executeUpdate();
            
            if(i==1){
                f=true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public void clearCartByUser(int uid){
        String sql = "DELETE FROM cart WHERE uid = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, uid);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
