package QLKH.controllers.Admin;

import QLKH.DAO.NhanVienDAO;
import QLKH.models.NhanVien;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/QuanLyNhanVien")
public class NhanVienController extends HttpServlet {
    NhanVienDAO nhanVienDAO=new NhanVienDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0) {
            List<NhanVien> nhanViens = nhanVienDAO.gets();
            req.setAttribute("NhanViens", nhanViens);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/NhanVien/NhanVien.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
