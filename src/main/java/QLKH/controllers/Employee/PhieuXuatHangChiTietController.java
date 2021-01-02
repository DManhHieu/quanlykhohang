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

@WebServlet("/View/NhanVien/PhieuXuatChiTiet")
public class PhieuXuatHangChiTietController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO = new PhieuXuatHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maphieuxuat = request.getParameter("maphieu");
        PhieuXuatHang phieuXuatHang = phieuXuatHangDAO.getPhieuXuatHang(maphieuxuat);
        request.setAttribute("phieuxuathang", phieuXuatHang);
        String url = "/View/NhanVien/chitietxuathang.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
