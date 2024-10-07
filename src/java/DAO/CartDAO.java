/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.util.List;
import model.BookDtls;
import model.Cart;
/**
 *
 * @author Quan
 */
public interface CartDAO {
    
    public boolean addCart(Cart c);
    
    public List<Cart> getBookByUser(int userId);
    
    public boolean deleteBook(int bid, int uid, int cid);
    
    public void clearCartByUser(int uid);
}
