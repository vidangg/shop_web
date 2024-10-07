
import DAO.UserDAOlmpl;
import dal.DBContext;
import java.util.List;
import model.user;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Quan
 */
public class test {

    public static void main(String[] args) {
        UserDAOlmpl dao = new UserDAOlmpl(DBContext.getConnection());
        List<user> list = dao.getAllUser();
        for (user object : list) {
            System.out.println(object.getPassword());
        }
    }
}
