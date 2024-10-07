/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import model.BookDtls;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author Quan
 */
public class BookDAOlmpl implements BookDAO{
    
    private Connection connection;

    public BookDAOlmpl(Connection connection) {
        super();
        this.connection = connection;
    }
    
    public boolean addBooks(BookDtls b){
        boolean f=false;
        
        try{
            String sql="INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,b.getBookName());
            ps.setString(2,b.getAuthor());
            ps.setString(3,b.getPrice());
            ps.setString(4,b.getBookCategory());
            ps.setString(5,b.getStatus());
            ps.setString(6,b.getPhotoName());
            ps.setString(7,b.getEmail());
            
            int i = ps.executeUpdate();
            
            if(i == 1){
                f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<BookDtls> getAllBooks(){
        
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        
        try {
            String sql="SELECT * FROM book_dtls";
            PreparedStatement ps=connection.prepareStatement(sql);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public BookDtls getBookById(int id){
        BookDtls b=null;
        try {
            String sql="SELECT * FROM book_dtls WHERE bookid=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }
    
    public boolean updateEditBooks(BookDtls b){
        boolean f=false;
        try {
            String sql ="UPDATE book_dtls SET bookname=?,author=?,price=?,bookCategory=?,status=? WHERE bookid=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,b.getBookName());
            ps.setString(2,b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4,b.getBookCategory());
            ps.setString(5,b.getStatus());
            
            ps.setInt(6, b.getBookId());
            
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean deleteBooks(int id){
        boolean f=false;
        
        try{
            String sql ="DELETE FROM book_dtls WHERE bookid=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public List<BookDtls> getNewBook(){
        
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookCategory=? order by bookid DESC";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"China");
            
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
        
    }
    public List<BookDtls> getRecentBooks(){
        
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookCategory=? order by bookid DESC";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"VietNam");
            
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
        
    }
    public List<BookDtls> getOldBook(){
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookCategory=?  order by bookid DESC";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"Japan");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getAllNewBook(){
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookCategory=? order by bookid DESC";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"China");;
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getAllRecentBook(){
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookCategory=? order by bookid DESC";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"VietNam");
            
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getAllOldBook(){
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookCategory=? order by bookid DESC";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"Japan");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getBookBySearch(String ch){
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql ="SELECT * FROM book_dtls WHERE bookname LIKE ? OR author LIKE ? OR bookCategory LIKE ? AND status=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"%"+ch+"%");
            ps.setString(2,"%"+ch+"%");
            ps.setString(3,"%"+ch+"%");
            ps.setString(4,"Active");
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
