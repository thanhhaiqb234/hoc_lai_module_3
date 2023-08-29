package repository;

import model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> showList();

    void deleteBook(String id);

    List<Book> editBook(int id);
}
