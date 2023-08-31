package repository;

import model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> showList();

    void deleteBook(int id);

    Book editBook(int id);

    void editBooks(int id, String title, int pagesize, String author, int category);

    List<Book> searchBook(String titlee);

    void cresteBook(String title, int pagesize, String author, int category);
}
