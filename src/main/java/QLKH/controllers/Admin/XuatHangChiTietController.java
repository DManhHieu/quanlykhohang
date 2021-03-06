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

@WebServlet("/PhieuXuatHang/ChiTiet")
public class XuatHangChiTietController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO = new PhieuXuatHangDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            String maphieu = req.getParameter("MaPhieu");
            PhieuXuatHang phieuXuatHang = phieuXuatHangDAO.getPhieuXuatHang(maphieu);
            req.setAttribute("phieuxuat", phieuXuatHang);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHang/XuatHangChiTiet.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            String maphieu = req.getParameter("MaPhieu");
            String ngayxuat = req.getParameter("ngayxuat");
            phieuXuatHangDAO.UpdateNgayXuatHang(maphieu, ngayxuat);
            PhieuXuatHang phieuXuatHang = phieuXuatHangDAO.getPhieuXuatHang(maphieu);
            req.setAttribute("phieuxuat", phieuXuatHang);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHang/XuatHangChiTiet.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}
