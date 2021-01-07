package QLKH.controllers.Admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/KiemKe")
public class KiemKeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("account") != null
                && session.getAttribute("NhomNhanVien") != null
                && (int) session.getAttribute("NhomNhanVien") == 0) {
            String KiemKeToanBo = req.getParameter("KiemKeToanBo");
            if(KiemKeToanBo!=null && !KiemKeToanBo.equals("")) {
                resp.setContentType("text/html");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write("Đặt toàn bộ hàng hóa vào trạng thái kiểm kê");
                return;
            }
            String MatHang = req.getParameter("MatHang");
            if(MatHang!=null && !MatHang.equals("")) {
                resp.setContentType("text/html");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write("Đặt mặt hàng: "+MatHang+"vào trạng thái kiểm kê");
                return;
            }
            String DonNhap = req.getParameter("DonNhap");
            if(DonNhap!=null && !DonNhap.equals("")) {
                resp.setContentType("text/html");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write("Đặt đơn nhập: "+DonNhap+" vào trạng thái kiểm kê");
                return;
            }
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/KiemKe/kiemke.jsp");
            dispatcher.forward(req, resp);
        }
        else {
        resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}

