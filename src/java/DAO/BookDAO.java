/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.util.List;
import model.BookDtls;

/**
 *
 * @author Quan
 */
public interface BookDAO {
    public boolean addBooks(BookDtls b);
    
    public List<BookDtls> getAllBooks();
    
    public BookDtls getBookById(int id);
    
    public boolean updateEditBooks(BookDtls b);
    
    public boolean deleteBooks(int id);
    
    public List<BookDtls> getNewBook();
    
    public List<BookDtls> getRecentBooks();
    
    public List<BookDtls> getOldBook();
    
    public List<BookDtls> getAllNewBook();
    
    public List<BookDtls> getAllRecentBook();
    
    public List<BookDtls> getAllOldBook();
    
    public List<BookDtls> getBookBySearch(String ch);
}
