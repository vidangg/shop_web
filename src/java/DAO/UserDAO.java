/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.util.List;
import model.user;

/**
 *
 * @author Quan
 */
public interface UserDAO {
    public boolean userRegister(user us);
    public user login(String email, String password);
    
    public boolean checkUser(String em);
    
    public List<user> getAllUser();
    
    public boolean deleteUser(int id);
    
    public boolean checkPassword(int id);
    
    public boolean updateProfile(user us);
    
    public boolean editUser(user us);
    
    public boolean updateUserMoney(user us);
    
    
}

