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

@WebServlet("/MatHang/ChiTiet")
public class MatHangChiTietController extends HttpServlet {
    MatHangDAO matHangDAO=new MatHangDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0) {
            String MaMatHang=req.getParameter("MaMatHang");
            MatHang matHang=matHangDAO.getMatHang(MaMatHang);
            req.setAttribute("mathang",matHang);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/MatHang/MatHangChiTiet.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0)
        {
            String MaMatHang=req.getParameter("MaMatHang");
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
