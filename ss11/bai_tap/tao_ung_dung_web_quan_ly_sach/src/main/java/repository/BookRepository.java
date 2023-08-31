package repository;

import model.Book;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {

    private static final String SELECT = "select * from book where book.status = 0";
    private static final String DELETE = "call books.delete_book(?)";
    private static final String EDIT = "select * from book where book.id = ?";
    private static final String EDITBOOK1 = "update book set book.title = ? , book.pagesize = ? , book.author = ? , book.category = ? where book.id = ?";
    private static final String SEARCHBOOK = "select * from book where book.title like ?";
    private static final String CREATEBOOK = " insert into book(title,pagesize,author,category) value (?,?,?,?)";
    private static final String EDITBOOK = "call books.edit_book(?,?,?,?,?)";



    @Override
    public List<Book> showList() {
        List<Book> bookList = new ArrayList<>();
        try {
            PreparedStatement statement = BaseBookRepository.getConnectionJavaToDB().prepareStatement(SELECT);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pagesize = resultSet.getInt("pagesize");
                String author = resultSet.getString("author");
                int category = resultSet.getInt("id_category");
                int status = resultSet.getInt("status");
                bookList.add(new Book(id, title, pagesize, author, category, status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }

    @Override
    public void deleteBook(int id) {
        try {
            CallableStatement callableStatement = BaseBookRepository.getConnectionJavaToDB().prepareCall(DELETE);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Book editBook(int id) {
        Book book = new Book();
        try {
            PreparedStatement preparedStatement = BaseBookRepository.getConnectionJavaToDB().prepareStatement(EDIT);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idd = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pagesize = resultSet.getInt("pagesize");
                String author = resultSet.getString("author");
                int category = resultSet.getInt("id_category");
                 book = new Book(idd,title,pagesize,author,category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return book;
    }

    @Override
    public void editBooks(int id, String title, int pagesize, String author, int category) {
        try {
            CallableStatement callableStatement = BaseBookRepository.getConnectionJavaToDB().prepareCall(EDITBOOK);
            callableStatement.setInt(1,id);
            callableStatement.setString(2,title);
            callableStatement.setInt(3,pagesize);
            callableStatement.setString(4,author);
            callableStatement.setInt(5,category);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> searchBook(String titlee) {
        List<Book> bookList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseBookRepository.getConnectionJavaToDB().prepareStatement(SEARCHBOOK);
            preparedStatement.setString(1,titlee);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pagesize = resultSet.getInt("pagesize");
                String author = resultSet.getString("author");
                int category = resultSet.getInt("category");
                int status = resultSet.getInt("status");
                bookList.add(new Book(id, title, pagesize, author, category, status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return bookList;
    }

    @Override
    public void cresteBook(String title, int pagesize, String author, int category) {
        try {
            PreparedStatement preparedStatement = BaseBookRepository.getConnectionJavaToDB().prepareStatement(CREATEBOOK);
            preparedStatement.setString(1,title);
            preparedStatement.setInt(2,pagesize);
            preparedStatement.setString(3,author);
            preparedStatement.setInt(4,category);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
