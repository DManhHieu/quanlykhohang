package QLKH.controllers.Admin;

import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.PhieuXuatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/PhieuXuatHang")
public class XuatHangController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO=new PhieuXuatHangDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        int nhom= (int) session.getAttribute("NhomNhanVien");
        if(session != null && session.getAttribute("account") != null && nhom==0) {
            List<PhieuXuatHang> phieuXuatHangs = phieuXuatHangDAO.getPhieuXuatHangs();
            req.setAttribute("PhieuXuatHangs", phieuXuatHangs);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHang/XuatHang.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
