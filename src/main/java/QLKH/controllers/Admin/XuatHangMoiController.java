package QLKH.controllers.Admin;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.HangHoa;
import QLKH.models.NhanVien;
import QLKH.models.PhieuXuatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

@WebServlet("/PhieuXuatHang/PhieuMoi")
public class XuatHangMoiController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO=new PhieuXuatHangDAO();
    HangHoaDAO hangHoaDAO=new HangHoaDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/View/Admin/XuatHangMoi.jsp").forward(req,resp);
    }

    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        int nhom= (int) session.getAttribute("NhomNhanVien");
        if(session != null && session.getAttribute("account") != null && nhom==0) {

            String action=req.getParameter("submit");
            PhieuXuatHang phieuXuatHang= (PhieuXuatHang) session.getAttribute("phieuxuathang");
            if(phieuXuatHang==null){
                phieuXuatHang=new PhieuXuatHang();
            }
            phieuXuatHang.setMaPhieu(req.getParameter("MaPhieu"));
            phieuXuatHang.setBenNhan(req.getParameter("BenNhan"));
            if(phieuXuatHang.getHangHoas()==null)
                phieuXuatHang.setHangHoas(new ArrayList<HangHoa>());
            HangHoa hangHoa=hangHoaDAO.getHangHoaTonKho(req.getParameter("MaHangHoa"));
            if(hangHoa!=null && !phieuXuatHang.getHangHoas().contains(hangHoa))
                phieuXuatHang.getHangHoas().add(hangHoa);
            try{
                String ngaydukienstr=req.getParameter("NgayXuat_DuKien");
                Date ngaydukien= Date.valueOf(ngaydukienstr);
                phieuXuatHang.setNgayXuat_DuKien(ngaydukien);
            }
            catch (Exception e){
                e.printStackTrace();
            }
            phieuXuatHang.setMoTa(req.getParameter("MoTa"));
            if(action.equals("AddHangHoa")){
               session.setAttribute("phieuxuathang",phieuXuatHang);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            else if(action.equals("Delete")){
                phieuXuatHang.getHangHoas().remove(hangHoaDAO.getHangHoa( req.getParameter("deleteID")));
                session.setAttribute("phieuxuathang",phieuXuatHang);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHangMoi.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            NhanVien nhanVien= (NhanVien) session.getAttribute("account");
            phieuXuatHang.setNguoiXuat(nhanVien);
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();
            java.sql.Date date = new java.sql.Date(currentDate.getTime());
            phieuXuatHang.setNgayTao(date);
            phieuXuatHangDAO.AddPhieuXuatHang(phieuXuatHang);
            session.removeAttribute("phieuxuathang");
            resp.sendRedirect(req.getContextPath()+ "/PhieuXuatHang/ChiTiet?MaPhieu="+phieuXuatHang.getMaPhieu());
            return;
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
