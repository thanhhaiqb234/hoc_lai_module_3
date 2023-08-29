package service;

import model.Book;
import repository.BookRepository;
import repository.IBookRepository;

import java.util.List;

public class BookService implements IBookService{
    private static IBookRepository bookRepository = new BookRepository();

    @Override
    public List<Book> showList() {
        return bookRepository.showList();
    }

    @Override
    public void deleteBook(String id) {
        bookRepository.deleteBook(id);
    }

    @Override
    public List<Book> editBook(int id) {
        return bookRepository.editBook(id);
    }
}
