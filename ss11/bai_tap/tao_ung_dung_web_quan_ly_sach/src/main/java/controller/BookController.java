package controller;

import model.Book;
import service.BookService;
import service.IBookService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookController", value = "/books")
public class BookController extends HttpServlet {
    private static IBookService bookService = new BookService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action==null) {
            action = "";
        }switch (action){
            case "edit" :
                editBook(request,response);
                break;
            default:
                listBook(request,response);
        }

    }

    private void editBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("code"));
        Book books = bookService.editBook(id);
        request.setAttribute("books",books);
        try {
            request.getRequestDispatcher("edit.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book> bookList = new ArrayList<>();
       bookList = bookService.showList();
       if (bookList.size()==0){
           request.setAttribute("bookList",bookList);
       }else {
           request.setAttribute("bookList",bookList);
       }
        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }switch (action){
            case "delete" :
                deleteBook(request,response);
                break;
            case "edit":
                editBooks(request,response);
                break;
            case "search" :
                seaechBook(request,response);
                break;
            case "create" :
                createBook(request,response);
                break;

        }
    }

    private void createBook(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        int pagesize = Integer.parseInt(request.getParameter("pagesize"));
        String author = request.getParameter("author");
        int category = Integer.parseInt(request.getParameter("category"));
        BookService.cresteBook(title,pagesize,author,category);
        try {
            response.sendRedirect("books");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void seaechBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book> bookList = new ArrayList<>();
        String titlee = request.getParameter("search");
        bookList = bookService.searchBook(titlee);
        request.setAttribute("bookList",bookList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editBooks(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pagesize = Integer.parseInt(request.getParameter("pagesize"));
        String author = request.getParameter("author");
        int category = Integer.parseInt(request.getParameter("category"));
        bookService.editBooks(id,title,pagesize,author,category);
        try {
            response.sendRedirect("books");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        bookService.deleteBook(id);
        try {
            response.sendRedirect("books");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}