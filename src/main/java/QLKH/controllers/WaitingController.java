package QLKH.controllers;

import QLKH.models.NhanVien;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns="/waiting")
public class WaitingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null) {
            NhanVien u=(NhanVien) session.getAttribute("account");
            req.setAttribute("username", u.getTenDangNhap());
            int nhom= (int) session.getAttribute("NhomNhanVien");
            if(nhom ==0) {
                req.getRequestDispatcher("/View/Admin/index.jsp").forward(req, resp);
            }else {
                req.getRequestDispatcher("/View/NhanVien/index.jsp").forward(req, resp);
            }

        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }

}