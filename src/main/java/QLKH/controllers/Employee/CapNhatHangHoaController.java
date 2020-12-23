package QLKH.controllers.Employee;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.DAO.TinhTrangDAO;
import QLKH.models.HangHoa;
import QLKH.models.PhieuXuatHang;
import QLKH.models.TinhTrang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/View/NhanVien/PhieuXuatCapNhat")
public class CapNhatHangHoaController extends HttpServlet {
    TinhTrangDAO tinhTrangDAO=new TinhTrangDAO();
    HangHoaDAO hangHoaDAO=new HangHoaDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PhieuXuatHangDAO phieuXuatHangDAO=new PhieuXuatHangDAO();
        String mahanghoa=request.getParameter("mahanghoa");
        int matinhtrang=Integer.parseInt(request.getParameter("tinhtrang"));
        TinhTrang tinhTrang=tinhTrangDAO.getTinhTrang(matinhtrang);
        HangHoa hangHoa=hangHoaDAO.getHangHoa(mahanghoa);
        hangHoa.setTinhTrang(tinhTrang);
        hangHoaDAO.updateHangHoa(hangHoa);
        String maphieuxuat=request.getParameter("maphieuxuat");
        PhieuXuatHang phieuXuatHang=phieuXuatHangDAO.getPhieuXuatHang(maphieuxuat);
        request.setAttribute("phieuxuathang", phieuXuatHang);
        String url="/View/NhanVien/chitietxuathang.jsp";
        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request,response);
    }
}
