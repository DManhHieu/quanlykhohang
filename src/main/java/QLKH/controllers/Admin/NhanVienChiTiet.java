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
import java.sql.Date;

@WebServlet("/QuanLyNhanVien/ChiTiet")
public class NhanVienChiTiet extends HttpServlet {
    NhanVienDAO nhanVienDAO = new NhanVienDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            int manhanvien = Integer.parseInt(req.getParameter("MaNhanVien"));
            NhanVien nhanVien = nhanVienDAO.get(manhanvien);
            if (req.getParameter("method") != null && req.getParameter("method").equals("reset")) {
                nhanVien.setMatKhau("0000");
                nhanVienDAO.Update(nhanVien);
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write("Hoàn thành");
                return;
            }
            req.setAttribute("NhanVien", nhanVien);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/NhanVien/NhanVienChiTiet.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            NhanVien nhanVien = nhanVienDAO.get(Integer.parseInt(req.getParameter("MaNhanVien")));
            nhanVien.setTenNhanVien(req.getParameter("TenNhanVien"));
            nhanVien.setTenDangNhap(req.getParameter("TenDangNhap"));
            nhanVien.setQueQuan(req.getParameter("QueQuan"));
            nhanVien.setSo_CMND(req.getParameter("SoCMND"));
            nhanVien.setEmail(req.getParameter("Email"));
            nhanVien.setPhai(req.getParameter("Phai"));
            nhanVien.setSDT(req.getParameter("SDT"));
            nhanVien.setNgaySinh(Date.valueOf(req.getParameter("NgaySinh")));
            nhanVienDAO.Update(nhanVien);
            resp.sendRedirect(req.getContextPath() + "/QuanLyNhanVien/ChiTiet?MaNhanVien=" + nhanVien.getMaNhanVien());
        }
    }
}