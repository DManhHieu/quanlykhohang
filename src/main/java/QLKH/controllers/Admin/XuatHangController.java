package QLKH.controllers.Admin;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.HangHoa;
import QLKH.models.PhieuXuatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PhieuXuatHang")
public class XuatHangController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO=new PhieuXuatHangDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      List<PhieuXuatHang> phieuXuatHangs=phieuXuatHangDAO.getPhieuXuatHangs();
        req.setAttribute("PhieuHangs",phieuXuatHangs);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHang.jsp");
        dispatcher.forward(req, resp);
    }
}
