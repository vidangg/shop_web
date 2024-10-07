package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    private static Connection connection;
    public static Connection getConnection() {
        try {
            String url = "jdbc:mysql://localhost:3306/book";
            String username = "root";
            String password = "Quan1252@";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return connection;
    }
}
