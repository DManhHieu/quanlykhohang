package QLKH.controllers.Employee;

import QLKH.DAO.PhieuNhapHangDao;
import QLKH.models.PhieuNhapHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/PhieuNhapHang"}, name = "PhieuNhaphang")
public class PhieuNhapHangController extends HttpServlet {
    PhieuNhapHangDao phieuNhapHangDao = new PhieuNhapHangDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<PhieuNhapHang> phieuNhapHangs = phieuNhapHangDao.getPhieuNhapHangs();
        System.out.println(phieuNhapHangs);
        request.setAttribute("PhieuNhapHangs", phieuNhapHangs);
        String url = "/View/NhanVien/phieunhaphang.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
