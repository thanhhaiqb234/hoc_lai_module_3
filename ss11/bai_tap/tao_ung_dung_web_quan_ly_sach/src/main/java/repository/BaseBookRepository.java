package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseBookRepository {
    private static String jdbcUrl = "jdbc:mysql://localhost:3306/books";
    private static String username = "root";
    private static String password = "codegym";
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl,username,password);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    private BaseBookRepository(){

    }
    public static Connection getConnectionJavaToDB(){
        return connection;
    }
}
