package controller;
import model.HocSinh;
import service.HocSinhService;
import service.IHocSinhService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HocSinhController", value = "/hocsinhcontroller")
public class HocSinhController extends HttpServlet {
    private static IHocSinhService hocSinhService = new HocSinhService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                break;
            default:
                showList(request,response);
                break;
        }

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HocSinh> hocSinhList = hocSinhService.showList();
        request.setAttribute("hocSinhList",hocSinhList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}