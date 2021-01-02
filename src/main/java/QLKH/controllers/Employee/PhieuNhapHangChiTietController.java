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

@WebServlet("/View/NhanVien/ChiTiet")
public class PhieuNhapHangChiTietController extends HttpServlet {
    PhieuNhapHangDao phieuNhapHangDao = new PhieuNhapHangDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maphieunhap = request.getParameter("maphieu");
        PhieuNhapHang existingPhieuNhapHang = phieuNhapHangDao.getPhieuHangNhap(maphieunhap);
        request.setAttribute("phieunhaphang", existingPhieuNhapHang);
        String url = "/View/NhanVien/chitietnhaphang.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
