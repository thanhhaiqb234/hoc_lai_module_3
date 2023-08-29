package service;

import model.Book;

import java.util.List;

public interface IBookService {
    List<Book> showList();

    void deleteBook(String id);

    List<Book> editBook(int id);

}
