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

@WebServlet(name = "BookController", value = "/book-servlet")
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
        List<Book> bookList = new ArrayList<>();
        bookList = bookService.editBook(id);
        request.setAttribute("bookList",bookList);
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
        if (action==null){
            action="";
        }switch (action){
            case "delete":
                String id = request.getParameter("code");
                bookService.deleteBook(id);
                response.sendRedirect("book-servlet");
                break;
        }
    }
}