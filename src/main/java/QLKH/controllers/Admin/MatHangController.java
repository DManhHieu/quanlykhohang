package QLKH.controllers.Admin;

import QLKH.DAO.MatHangDAO;
import QLKH.models.MatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/MatHang")
public class MatHangController extends HttpServlet {
    MatHangDAO matHangDAO=new MatHangDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        int nhom= (int) session.getAttribute("NhomNhanVien");
        if(session != null && session.getAttribute("account") != null && nhom==0) {
            List<MatHang> matHangs = matHangDAO.getMatHangs();
            req.setAttribute("MatHangs", matHangs);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/MatHang/MatHang.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
