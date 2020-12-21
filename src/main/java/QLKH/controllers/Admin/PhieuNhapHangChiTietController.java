package QLKH.controllers.Admin;

import QLKH.DAO.MatHangDAO;
import QLKH.DAO.PhieuNhapHangDao;
import QLKH.models.PhieuNhapHang;
import QLKH.models.View.MatHangView;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/APhieuNhapHang/ChiTiet")
public class PhieuNhapHangChiTietController extends HttpServlet {
    PhieuNhapHangDao phieuNhapHangDao=new PhieuNhapHangDao();
    MatHangDAO matHangDAO=new MatHangDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0) {
            String maphieu=req.getParameter("MaPhieu");
            PhieuNhapHang phieuNhapHang=phieuNhapHangDao.getPhieuHangNhap(maphieu);
            req.setAttribute("phieunhap",phieuNhapHang);
            List<MatHangView> matHangViewList =new ArrayList<MatHangView>();
            phieuNhapHang.getHangNhaps().forEach((element)->{
                matHangViewList.add(new MatHangView(matHangDAO.getMatHang(element.getHangNhapId().getMaHangNhap()),element.getSoLuong()));
            });
            req.setAttribute("hangnhaps",matHangViewList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/phieunhaphangChiTiet.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
