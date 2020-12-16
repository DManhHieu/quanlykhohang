package QLKH.controllers.Admin;

import QLKH.DAO.PhieuXuatHangDAO;
import QLKH.models.HangHoa;
import QLKH.models.PhieuXuatHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/PhieuXuatHang/ChiTiet")
public class XuatHangChiTietController extends HttpServlet {
    PhieuXuatHangDAO phieuXuatHangDAO=new PhieuXuatHangDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien")!=null
                && (int)session.getAttribute("NhomNhanVien")==0) {
            String maphieu=req.getParameter("MaPhieu");
            PhieuXuatHang phieuXuatHang=phieuXuatHangDAO.getPhieuXuatHang(maphieu);

            //de test
            phieuXuatHang.setHangHoas(new ArrayList<HangHoa>());
            req.setAttribute("phieuxuat",phieuXuatHang);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/XuatHangChiTiet.jsp");
            dispatcher.forward(req, resp);
        }else {
            resp.sendRedirect(req.getContextPath()+"/Login");
        }
    }
}
