package com.example.xay_dung_ung_dung_login.controlle;

import com.example.xay_dung_ung_dung_login.service.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "login", value = "/logins")
public class LoginController extends HttpServlet {
    public static final LoginService loginService = new LoginService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case "login" :
                LocalDateTime localDateTime = LocalDateTime.now();
                String name = request.getParameter("username");
                String password = request.getParameter("password");
                String notification = loginService.checkLogin(name,password);
                if (notification.equals("Admin đă đăng nhập thành công vào lúc" + localDateTime )){
                    request.setAttribute("thongBao",notification);
                    request.getRequestDispatcher("success.jsp").forward(request,response);
                }else {
                    request.setAttribute("thongBao",notification);
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }
                break;
        }
    }
}