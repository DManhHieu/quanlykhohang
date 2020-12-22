package QLKH.controllers.Admin;

import QLKH.DAO.ThongKeDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ThongKe")
public class ThongKeController extends HttpServlet {
    ThongKeDAO thongKeDAO=new ThongKeDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        int nhom= (int) session.getAttribute("NhomNhanVien");
        if(session != null && session.getAttribute("account") != null && nhom==0) {
            int TongSoMatHang=thongKeDAO.TongSoMatHang();
            int SoHangHoa=thongKeDAO.SoHangHoa();
            int SoHangHoaTonKho=thongKeDAO.SoHangHoaTonKho();
            int SoPhieuNhapHang=thongKeDAO.SoPhieuNhapHang();
            int SoPhieuXuatHang=thongKeDAO.SoPhieuXuatHang();
            int SoNhanVien=thongKeDAO.SoNhanVien();
            String ThongKeHangTonKho=thongKeDAO.ThongKeHangTonKho();
            req.setAttribute("TongSoMatHang",TongSoMatHang);
            req.setAttribute("SoHangHoa",SoHangHoa);
            req.setAttribute("SoHangHoaTonKho",SoHangHoaTonKho);
            req.setAttribute("SoPhieuNhapHang",SoPhieuNhapHang);
            req.setAttribute("SoPhieuXuatHang",SoPhieuXuatHang);
            req.setAttribute("SoNhanVien",SoNhanVien);
            req.setAttribute("ThongKeHangTonKho",ThongKeHangTonKho);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/ThongKe/ThongKe.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
