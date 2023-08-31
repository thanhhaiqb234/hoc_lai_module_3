package service;

import model.Book;
import repository.BookRepository;
import repository.IBookRepository;

import java.util.List;

public class BookService implements IBookService{
    private static IBookRepository bookRepository = new BookRepository();

    public static void cresteBook(String title, int pagesize, String author, int category) {
        bookRepository.cresteBook(title,pagesize,author,category);
    }

    @Override
    public List<Book> showList() {
        return bookRepository.showList();
    }

    @Override
    public void deleteBook(int id) {
        bookRepository.deleteBook(id);
    }

    @Override
    public Book editBook(int id) {
        return bookRepository.editBook(id);
    }

    @Override
    public void editBooks(int id, String title, int pagesize, String author, int category) {
        bookRepository.editBooks(id,title,pagesize,author,category);
    }

    @Override
    public List<Book> searchBook(String titlee) {
        return bookRepository.searchBook(titlee);
    }
}
