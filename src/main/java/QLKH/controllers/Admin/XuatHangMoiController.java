package QLKH.controllers.Admin;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.HangHoa;
import QLKH.models.NhanVien;
import QLKH.models.PhieuXuatHang;
import QLKH.models.View.HangHoaView;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

@WebServlet("/PhieuXuatHang/PhieuMoi")
public class XuatHangMoiController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO = new PhieuXuatHangDAO();
    HangHoaDAO hangHoaDAO = new HangHoaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            int mode = Integer.parseInt(req.getParameter("mode"));
            String MaHangHoa = req.getParameter("MaHangHoa");
            PhieuXuatHang phieuXuatHang = (PhieuXuatHang) session.getAttribute("phieuxuathang");
            HangHoa hangHoa = hangHoaDAO.getHangHoaTonKho(MaHangHoa);
            if (mode == 0) {
                if (hangHoa != null && !phieuXuatHang.getHangHoas().contains(hangHoa))
                    phieuXuatHang.getHangHoas().add(hangHoa);

            } else if (mode == 1) {
                phieuXuatHang.getHangHoas().remove(hangHoa);
            }
            session.setAttribute("phieuxuathang", phieuXuatHang);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            if (mode == 0) {
                HangHoaView hangHoaView = new HangHoaView(hangHoa);
                String hanghoaJson = new Gson().toJson(hangHoaView);
                resp.getWriter().write(hanghoaJson);
            } else {
                resp.getWriter().write("Hoan thanh");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        int nhom = (int) session.getAttribute("NhomNhanVien");
        if (session != null && session.getAttribute("account") != null && nhom == 0) {

            PhieuXuatHang phieuXuatHang = (PhieuXuatHang) session.getAttribute("phieuxuathang");

            if (phieuXuatHang == null) {

                phieuXuatHang = new PhieuXuatHang();
                phieuXuatHang.setHangHoas(new ArrayList<HangHoa>());
                session.setAttribute("phieuxuathang", phieuXuatHang);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHang/XuatHangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            String messenger=null;

            phieuXuatHang.setMaPhieu(req.getParameter("MaPhieu"));
            if(messenger==null && ( phieuXuatHang.getMaPhieu()==null || phieuXuatHang.getMaPhieu().equals(""))){
                messenger="Xin kiểm tra lại";
            }
            if(messenger==null){
                messenger= phieuXuatHangDAO.CheckMaPhieu(phieuXuatHang.getMaPhieu());
            }
            phieuXuatHang.setBenNhan(req.getParameter("BenNhan"));
            if (phieuXuatHang.getHangHoas() == null)
                phieuXuatHang.setHangHoas(new ArrayList<HangHoa>());
            try {
                String ngaydukienstr = req.getParameter("NgayXuat_DuKien");
                if (ngaydukienstr != null) {
                    Date ngaydukien = Date.valueOf(ngaydukienstr);
                    phieuXuatHang.setNgayXuat_DuKien(ngaydukien);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            phieuXuatHang.setMoTa(req.getParameter("MoTa"));

            String submit = req.getParameter("submit");
            if (submit == null || messenger!=null) {
                session.setAttribute("phieuxuathang", phieuXuatHang);
                req.setAttribute("messenger",messenger);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHang/XuatHangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }

            NhanVien nhanVien = (NhanVien) session.getAttribute("account");

            phieuXuatHang.setNguoiXuat(nhanVien);
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();
            java.sql.Date date = new java.sql.Date(currentDate.getTime());
            phieuXuatHang.setNgayTao(date);


            phieuXuatHangDAO.AddPhieuXuatHang(phieuXuatHang);

            session.removeAttribute("phieuxuathang");
            resp.sendRedirect(req.getContextPath() + "/PhieuXuatHang/ChiTiet?MaPhieu=" + phieuXuatHang.getMaPhieu());
            return;

        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}
