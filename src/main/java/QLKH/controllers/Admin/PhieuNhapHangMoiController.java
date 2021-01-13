package QLKH.controllers.Admin;

import QLKH.DAO.MatHangDAO;
import QLKH.DAO.PhieuNhapHangDao;
import QLKH.models.*;
import QLKH.models.View.MatHangView;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet("/APhieuNhapHang/Moi")
public class PhieuNhapHangMoiController extends HttpServlet {
    PhieuNhapHangDao phieuNhapHangDao = new PhieuNhapHangDao();
    MatHangDAO matHangDAO = new MatHangDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {

            String mamathang = req.getParameter("MaMatHang");
            int soluong = Integer.parseInt(req.getParameter("soluong"));
            int mode = Integer.parseInt(req.getParameter("mode"));

            PhieuNhapHang phieuNhapHang = null;
            HangNhap hangNhap = null;

            MatHang matHang = matHangDAO.getMatHang(mamathang);

            phieuNhapHang = (PhieuNhapHang) session.getAttribute("phieunhap");


            if (matHang != null && phieuNhapHang != null) {

                if (mode == 0) { // chua co mat hang nay
                    hangNhap = new HangNhap();
                    hangNhap.setSoLuong(soluong);
                    HangNhapId id = new HangNhapId(phieuNhapHang.getMaPhieu(), mamathang);
                    hangNhap.setHangNhapId(id);
                    hangNhap.setMatHang(matHang);
                    phieuNhapHang.getHangNhaps().add(hangNhap);
                } else if (mode == 1) { // da co mat hang nay
                    for (HangNhap hang : phieuNhapHang.getHangNhaps()) {
                        if (hang.getHangNhapId().getMaHangNhap().equals(mamathang)) {
                            hang.setSoLuong(hang.getSoLuong() + soluong);
                            soluong = hang.getSoLuong();
                        }
                    }
                } else if (mode == 2) {
                    for (HangNhap hang : phieuNhapHang.getHangNhaps()) {

                        if (hang.getHangNhapId().getMaHangNhap().equals(mamathang)) {

                            phieuNhapHang.getHangNhaps().remove(hang);
                            resp.setContentType("text/html");
                            resp.setCharacterEncoding("UTF-8");
                            resp.getWriter().write("Hoan thanh");
                            return;
                        }
                    }
                    resp.setContentType("text/html");
                    resp.setCharacterEncoding("UTF-8");
                    resp.getWriter().write("Error");
                    return;
                }

            }
            session.setAttribute("phieunhap", phieuNhapHang);
            MatHangView matHangView = new MatHangView(matHang, soluong);
            String mathangJson = new Gson().toJson(matHangView);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(mathangJson);

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
            PhieuNhapHang phieuNhapHang = (PhieuNhapHang) session.getAttribute("phieunhap");
            if (phieuNhapHang == null) {
                phieuNhapHang = new PhieuNhapHang();
                phieuNhapHang.setHangNhaps(new ArrayList<HangNhap>());
                session.setAttribute("phieunhap", phieuNhapHang);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/NhapHang/phieunhaphangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            String messenger=null;
            phieuNhapHang.setMaPhieu(req.getParameter("MaPhieu"));
            if(phieuNhapHang.getMaPhieu()==null || phieuNhapHang.getMaPhieu().equals("")){
                messenger="Xin kiểm tra lại";
            }
            phieuNhapHang.setMoTa(req.getParameter("MoTa"));
            phieuNhapHang.setNhapTu(req.getParameter("NhapTu"));
            if (phieuNhapHang.getHangNhaps() == null) {
                phieuNhapHang.setHangNhaps(new ArrayList<HangNhap>());
            }

            String action = req.getParameter("Submit");
            if (action != null && action.equals("Create") && messenger==null) {
                session.removeAttribute("phieunhap");
                Calendar calendar = Calendar.getInstance();
                java.util.Date currentDate = calendar.getTime();
                java.sql.Date date = new java.sql.Date(currentDate.getTime());
                phieuNhapHang.setNgayNhap(date);
                NhanVien nhanVien = (NhanVien) session.getAttribute("account");
                phieuNhapHang.setNguoiNhap(nhanVien);
                phieuNhapHangDao.AddPhieuNhapHang(phieuNhapHang);
                resp.sendRedirect(req.getContextPath() + "/APhieuNhapHang/ChiTiet?MaPhieu=" + phieuNhapHang.getMaPhieu());
                return;
            }


            req.setAttribute("messenger",messenger);
            session.setAttribute("phieunhap", phieuNhapHang);
            List<MatHangView> matHangViewList = new ArrayList<MatHangView>();
            phieuNhapHang.getHangNhaps().forEach((element) -> {
                matHangViewList.add(new MatHangView(matHangDAO.getMatHang(element.getHangNhapId().getMaHangNhap()), element.getSoLuong()));
            });
            req.setAttribute("hangnhaps", matHangViewList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/NhapHang/phieunhaphangMoi.jsp");
            dispatcher.forward(req, resp);

        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}