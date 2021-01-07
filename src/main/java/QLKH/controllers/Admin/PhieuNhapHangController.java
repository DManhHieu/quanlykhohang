package QLKH.controllers.Admin;

import QLKH.DAO.PhieuNhapHangDao;
import QLKH.models.PhieuNhapHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/APhieuNhapHang")
public class PhieuNhapHangController extends HttpServlet {
    PhieuNhapHangDao phieuNhapHangDao = new PhieuNhapHangDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        int nhom = (int) session.getAttribute("NhomNhanVien");
        if (session != null && session.getAttribute("account") != null && nhom == 0) {
            List<PhieuNhapHang> phieuNhapHangs = phieuNhapHangDao.getPhieuNhapHangs();
            req.setAttribute("PhieuHangs", phieuNhapHangs);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/NhapHang/phieunhaphang.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}