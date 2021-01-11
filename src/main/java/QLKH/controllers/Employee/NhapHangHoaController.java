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
import java.util.Calendar;

@WebServlet("/PhieuNhapHang/ChiTiet/NhapHangHoa")
public class NhapHangHoaController extends HttpServlet {
    MatHangDAO matHangDAO = new MatHangDAO();
    TinhTrangDAO tinhTrangDAO = new TinhTrangDAO();
    PhieuNhapHangDao phieuNhapHangDao = new PhieuNhapHangDao();
    HangHoaDAO hangHoaDAO = new HangHoaDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null &&
                (int) session.getAttribute("NhomNhanVien") == 1) {
            int loi=0;
            HangHoa hangHoa = new HangHoa();
            HangHoa hangHoakt;
            String MP_NhapHang=(String) session.getAttribute("MP_NhapHang");
/*            String MP_NhapHang =(String) request.getAttribute("MP_NhapHang");*/
            PhieuNhapHang phieuNhapHang = phieuNhapHangDao.getPhieuHangNhap(MP_NhapHang);
            hangHoa.setPhieuNhap(phieuNhapHang);
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();
            java.sql.Date date = new java.sql.Date(currentDate.getTime());
            hangHoa.setNgayNhapKho(date);
            String MaMatHang=(String) session.getAttribute("MaMatHang");
            MatHang matHang = matHangDAO.getMatHang(MaMatHang);
            if (MaMatHang.equals("")){
                session.setAttribute("thongbao","");
                request.setAttribute("mmhkhongtontai", "Yêu cầu nhập mã mặt hàng");
                loi++;
            } else if(matHang == null){
                request.setAttribute("mmhkhongtontai", "Mã mặt hàng không tồn tại");
                loi++;
            } else {
                hangHoa.setMatHang(matHang);
            }
            String MaHangHoa = request.getParameter("MaHangHoa");
            hangHoakt=hangHoaDAO.getHangHoa(MaHangHoa);
            if (MaHangHoa.equals("")) {
                session.setAttribute("thongbao","");
                request.setAttribute("hhtontai", "Yêu cầu nhập mã hàng hóa");
                loi++;
            }
            else if(hangHoakt != null){
                session.setAttribute("thongbao","");
                request.setAttribute("hhtontai", "Mã hàng hóa đã tồn tại");
                loi++;
            } else {
                hangHoa.setMaHangHoa(MaHangHoa);
            }
            String ViTri = request.getParameter("ViTri");
            if(ViTri.equals("")) {
                session.setAttribute("thongbao","");
                request.setAttribute("tbvitri", "Yêu cầu nhập vị trí");
                loi++;
            } else {
                hangHoa.setViTri(ViTri);
            }
            int matinhtrang = Integer.parseInt(request.getParameter("TinhTrang"));
            TinhTrang tinhTrang = tinhTrangDAO.getTinhTrang(matinhtrang);
            hangHoa.setTinhTrang(tinhTrang);
            NhanVien nhanVienNhapKho = (NhanVien) session.getAttribute("account");
            hangHoa.setNhanVienNhapKho(nhanVienNhapKho);
            try {
                String NgaySanXuatstr = request.getParameter("NgaySanXuat");
                String HanSuDungstr = request.getParameter("HanSuDung");
                if(NgaySanXuatstr.equals("")){
                    loi++;
                    session.setAttribute("thongbao","");
                    request.setAttribute("tbngaysanxuat", "Yêu cầu nhập ngày sản xuất");
                }
                if(HanSuDungstr.equals("")){
                    loi++;
                    session.setAttribute("thongbao","");
                    request.setAttribute("tbhansudung", "Yêu cầu nhập hạn sử dụng");
                }
                if (!NgaySanXuatstr.equals("") && !HanSuDungstr.equals("")) {
                    Date NgaySanXuat = Date.valueOf(NgaySanXuatstr);
                    Date HanSuDung = Date.valueOf(HanSuDungstr);
                    hangHoa.setNgaySanXuat(NgaySanXuat);
                    hangHoa.setHanSuDung(HanSuDung);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(loi == 0){
                session.setAttribute("thongbao","themthanhcong");
                hangHoaDAO.AddHangHoa(hangHoa);
            }
            request.setCharacterEncoding("utf-8");
            PhieuNhapHang existingPhieuNhapHang = phieuNhapHangDao.getPhieuHangNhap(MP_NhapHang);
            request.setAttribute("phieunhaphang", existingPhieuNhapHang);
            String url = "/View/NhanVien/themhanghoa.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }
}
