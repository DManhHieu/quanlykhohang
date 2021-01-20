package QLKH.controllers.Employee;

import QLKH.DAO.HangHoaDAO;
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

@WebServlet("/View/NhanVien/ChiTiet")
public class PhieuNhapHangChiTietController extends HttpServlet {
    PhieuNhapHangDao phieuNhapHangDao = new PhieuNhapHangDao();
    HangHoaDAO hangHoaDAO=new HangHoaDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        request.setCharacterEncoding("utf-8");
        String maphieunhap = request.getParameter("maphieu");
        PhieuNhapHang existingPhieuNhapHang = phieuNhapHangDao.getPhieuHangNhap(maphieunhap);
        session.setAttribute("phieunhaphang", existingPhieuNhapHang);
        String url = "/View/NhanVien/chitietnhaphang.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        String maphieunhap=request.getParameter("MP_NhapHang");
        String mamathang=request.getParameter("MaMatHang");
        String maHangHoa=hangHoaDAO.MaHangHoaMoi(maphieunhap,mamathang);

        session.setAttribute("MP_NhapHang",maphieunhap);
        session.setAttribute("MaMatHang",mamathang);
        session.setAttribute("MaHangHoa",maHangHoa);
        String url = "/View/NhanVien/themhanghoa.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
