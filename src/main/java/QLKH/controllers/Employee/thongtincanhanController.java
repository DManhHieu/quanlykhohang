package QLKH.controllers.Employee;

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

@WebServlet(name = "thongtincanhanController", urlPatterns = {"/nvthongtincanhan"})
public class thongtincanhanController extends HttpServlet {

    NhanVienDAO nhanVienDAO = new NhanVienDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null &&
                (int) session.getAttribute("NhomNhanVien") == 1) {
            NhanVien nv = (NhanVien) session.getAttribute("account");
            NhanVien nhanVien = nhanVienDAO.get(nv.getMaNhanVien());
            req.setAttribute("NhanVien", nhanVien);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/NhanVien/ThongTinCaNhan.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null) {
            NhanVien nv = (NhanVien) session.getAttribute("account");
            NhanVien nhanVien = nhanVienDAO.get(nv.getMaNhanVien());
            if (req.getParameter("matkhaucu") != null) {
                String matkhaucu = req.getParameter("matkhaucu");
                String matkhaumoi = req.getParameter("MatKhauMoi");
                String matkhaumoi1 = req.getParameter("MatKhauMoi1");
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                if (!matkhaumoi.equals(matkhaumoi1)) {
                    resp.getWriter().write("Mật khẩu mới không khớp");
                    return;
                }
                if (!nhanVien.getMatKhau().equals(matkhaucu)) {
                    resp.getWriter().write("Mật khẩu cũ không khớp");
                    return;
                }
                nhanVien.setMatKhau(matkhaumoi);
                nhanVienDAO.Update(nhanVien);
                session.setAttribute("account", nhanVien);
                resp.getWriter().write("Hoàn thành");
                return;
            }
            nhanVien.setTenNhanVien(req.getParameter("TenNhanVien"));
            nhanVien.setTenDangNhap(req.getParameter("TenDangNhap"));
            nhanVien.setQueQuan(req.getParameter("QueQuan"));
            nhanVien.setSo_CMND(req.getParameter("SoCMND"));
            nhanVien.setEmail(req.getParameter("Email"));
            nhanVien.setPhai(req.getParameter("Phai"));
            nhanVien.setSDT(req.getParameter("SDT"));
            nhanVien.setNgaySinh(Date.valueOf(req.getParameter("NgaySinh")));
            nhanVienDAO.Update(nhanVien);
            session.setAttribute("account", nhanVien);
            doGet(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}
