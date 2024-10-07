/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.util.List;
import model.bookorder;

/**
 *
 * @author Quan
 */
public interface BookOrderDAO {
    public int getOrderNo();
    
    public boolean saveOrder(List<bookorder> bookorder);
    
    public List<bookorder> getBook(String email);
    
    public List<bookorder> getAllOrderBook();
    
    
}