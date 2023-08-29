package repository;

import model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {

    private static final String SELECT = "select * from book where book.status = 0";
    private static final String DELETE = "update book set book.status = 1 where book.id = ?";

    List<Book> bookList = new ArrayList<>();

    @Override
    public List<Book> showList() {

        try {
            PreparedStatement statement = BaseBookRepository.getConnectionJavaToDB().prepareStatement(SELECT);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pagesize = resultSet.getInt("pagesize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                int status = resultSet.getInt("status");
                bookList.add(new Book(id, title, pagesize, author, category, status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }

    @Override
    public void deleteBook(String id) {
        try {
            PreparedStatement statement = BaseBookRepository.getConnectionJavaToDB().prepareStatement(
                    "update book set book.status = 1 where book.id = ? ");
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> editBook(int id) {
        try {
            PreparedStatement statement = BaseBookRepository.getConnectionJavaToDB().prepareStatement("select * from book where book.id = ?");
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int idd = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pagesize = resultSet.getInt("pagesize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                int status = resultSet.getInt("status");
                bookList.add(new Book(idd, title, pagesize, author, category, status));
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
