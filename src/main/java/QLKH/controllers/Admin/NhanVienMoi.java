package QLKH.controllers.Admin;

import QLKH.DAO.NhanVienDAO;
import QLKH.DAO.NhomNhanVienDAO;
import QLKH.models.NhanVien;
import QLKH.models.NhomNhanVien;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/QuanLyNhanVien/Moi")
public class NhanVienMoi extends HttpServlet {
    NhanVienDAO nhanVienDAO=new NhanVienDAO();
    NhomNhanVienDAO nhomNhanVienDAO=new NhomNhanVienDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0) {
            List<NhomNhanVien> nhomNhanVienList=nhomNhanVienDAO.gets();
            req.setAttribute("NhomNhanViens",nhomNhanVienList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/NhanVien/NhanVienMoi.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0) {
            NhanVien nhanVien=new NhanVien();
            nhanVien.setMaNhanVien(Integer.parseInt(req.getParameter("MaNhanVien")));
            nhanVien.setTenNhanVien(req.getParameter("TenNhanVien"));
            nhanVien.setTenDangNhap(req.getParameter("TenDangNhap"));
            nhanVien.setQueQuan(req.getParameter("QueQuan"));
            nhanVien.setSo_CMND(req.getParameter("SoCMND"));
            nhanVien.setEmail(req.getParameter("Email"));
            nhanVien.setPhai(req.getParameter("Phai"));
            nhanVien.setSDT(req.getParameter("SDT"));
            nhanVien.setNgaySinh(Date.valueOf(req.getParameter("NgaySinh")));
            nhanVien.setNhomNhanVien(nhomNhanVienDAO.get(Integer.parseInt(req.getParameter("NhomNhanVien"))));
            nhanVien.setMatKhau("0000");
            nhanVienDAO.Add(nhanVien);
            resp.sendRedirect(req.getContextPath() + "/QuanLyNhanVien/ChiTiet?MaNhanVien=" + nhanVien.getMaNhanVien());
        }
    }
}