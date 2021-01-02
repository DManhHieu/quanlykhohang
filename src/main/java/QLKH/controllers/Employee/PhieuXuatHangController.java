package QLKH.controllers.Employee;

import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.PhieuXuatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/View/NhanVien/PhieuXuatHang")
public class PhieuXuatHangController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO = new PhieuXuatHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<PhieuXuatHang> phieuXuatHangs = phieuXuatHangDAO.getPhieuXuatHangs();
        request.setAttribute("PhieuXuatHangs", phieuXuatHangs);
        String url = "/View/NhanVien/phieuxuathang.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
