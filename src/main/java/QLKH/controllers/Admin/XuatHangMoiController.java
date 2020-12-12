package QLKH.controllers.Admin;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.PhieuXuatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/PhieuXuatHang/PhieuMoi")
public class XuatHangMoiController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO=new PhieuXuatHangDAO();
    HangHoaDAO hangHoaDAO=new HangHoaDAO();
    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action=req.getParameter("submit");
        PhieuXuatHang phieuXuatHang=new PhieuXuatHang();
        phieuXuatHang.setMaPhieu(req.getParameter("MaPhieu"));
        String ngaydukien=req.getParameter("NgayXuat_DuKien");
        if(action.equals("AddHangHoa")){
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHangMoi.jsp");
            dispatcher.forward(req, resp);
            return;
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHangChiTiet.jsp");
        dispatcher.forward(req, resp);

    }
}
