package QLKH.controllers.Employee;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.MatHangDAO;
import QLKH.DAO.PhieuNhapHangDao;
import QLKH.DAO.TinhTrangDAO;
import QLKH.models.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/PhieuNhapHang/ChiTiet/NhapHangHoa")
public class NhapHangHoaController extends HttpServlet {
    MatHangDAO matHangDAO=new MatHangDAO();
    TinhTrangDAO tinhTrangDAO=new TinhTrangDAO();
    PhieuNhapHangDao phieuNhapHangDao=new PhieuNhapHangDao();
    HangHoaDAO hangHoaDAO=new HangHoaDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null &&
                (int) session.getAttribute("NhomNhanVien") == 1){
            HangHoa hangHoa=new HangHoa();
            String MP_NhapHang=request.getParameter("MP_NhapHang");
            PhieuNhapHang phieuNhapHang=phieuNhapHangDao.getPhieuHangNhap(MP_NhapHang);
            hangHoa.setPhieuNhap(phieuNhapHang);
            String MaMatHang=request.getParameter("MaMatHang");
            MatHang matHang=matHangDAO.getMatHang(MaMatHang);
            hangHoa.setMatHang(matHang);
            String MaHangHoa=request.getParameter("MaHangHoa");
            hangHoa.setMaHangHoa(MaHangHoa);
            String ViTri=request.getParameter("ViTri");
            hangHoa.setViTri(ViTri);
            String TinhTrang=request.getParameter("TinhTrang");
            TinhTrang tinhTrang=tinhTrangDAO.getTinhTrang(TinhTrang);
            hangHoa.setTinhTrang(tinhTrang);
            NhanVien nhanVienNhapKho= (NhanVien) session.getAttribute("account");
            hangHoa.setNhanVienNhapKho(nhanVienNhapKho);
            try {
                String NgaySanXuatstr=request.getParameter("NgaySanXuat");
                String HanSuDungstr=request.getParameter("HanSuDung");
                String NgayNhapKhostr=request.getParameter("NgayNhapKho");
                if(NgaySanXuatstr != null && HanSuDungstr != null && NgayNhapKhostr != null){
                    Date NgaySanXuat=Date.valueOf(NgaySanXuatstr);
                    Date HanSuDung=Date.valueOf(HanSuDungstr);
                    Date NgayNhapkho=Date.valueOf(NgayNhapKhostr);
                    hangHoa.setNgaySanXuat(NgaySanXuat);
                    hangHoa.setHanSuDung(HanSuDung);
                    hangHoa.setNgayNhapKho(NgayNhapkho);
                }
            } catch (Exception e){
                e.printStackTrace();
            }
            hangHoaDAO.AddHangHoa(hangHoa);
            PhieuNhapHang existingPhieuNhapHang=phieuNhapHangDao.getPhieuHangNhap(MP_NhapHang);
            request.setAttribute("phieunhaphang", existingPhieuNhapHang);
            String url="/View/NhanVien/chitietnhaphang.jsp";
            RequestDispatcher dispatcher=getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request,response);
        }
    }
}
