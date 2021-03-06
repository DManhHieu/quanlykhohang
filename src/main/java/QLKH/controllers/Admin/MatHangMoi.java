package QLKH.controllers.Admin;

import QLKH.DAO.MatHangDAO;
import QLKH.models.MatHang;
import QLKH.models.NhanVien;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/MatHang/Moi")
public class MatHangMoi extends HttpServlet {
    MatHangDAO matHangDAO = new MatHangDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {

        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            MatHang matHang = (MatHang) session.getAttribute("mathang");

            if (matHang == null) {

                matHang = new MatHang();
                matHang.setMaMatHang(matHangDAO.MaMatHangMoi());
                session.setAttribute("mathang", matHang);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/MatHang/MatHangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            String messenger=null;
            matHang.setMaMatHang(req.getParameter("MaMatHang"));
            matHang.setTenMatHang(req.getParameter("TenMatHang"));
            if(req.getParameter("GiaiTri")!=null) {
                matHang.setGiaTri(Double.parseDouble(req.getParameter("GiaTri")));
            }
            matHang.setNhaSanXuat(req.getParameter("NhaSanXuat"));
            matHang.setMoTa(req.getParameter("MoTa"));
            if(messenger==null && ( matHang.getMaMatHang()==null || matHang.getMaMatHang().equals(""))){
                messenger="Xin kiểm tra lại";
            }
            if(messenger==null){
                messenger= matHangDAO.CheckMaMatHang(matHang.getMaMatHang());
            }
            if (messenger != null) {
                req.setAttribute("messenger",messenger);
                session.setAttribute("mathang", matHang);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/MatHang/MatHangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }

            NhanVien nhanVien = (NhanVien) session.getAttribute("account");
            matHang.setNguoiNhap(nhanVien);
            matHangDAO.AddMatHang(matHang);
            session.removeAttribute("mathang");
            req.setAttribute("mathang", matHang);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/MatHang/MatHangChiTiet.jsp");
            dispatcher.forward(req, resp);

        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}
