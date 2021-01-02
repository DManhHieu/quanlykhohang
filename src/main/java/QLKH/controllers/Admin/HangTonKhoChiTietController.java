package QLKH.controllers.Admin;

import QLKH.DAO.HangHoaDAO;
import QLKH.models.HangHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/HangTonKho/ChiTiet")
public class HangTonKhoChiTietController extends HttpServlet {
    HangHoaDAO hangHoaDAO = new HangHoaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int nhom = (int) session.getAttribute("NhomNhanVien");
        if (session != null && session.getAttribute("account") != null && nhom == 0) {
            String mahanghoa = req.getParameter("MaHangHoa");
            HangHoa hangHoa = hangHoaDAO.getHangHoa(mahanghoa);
            req.setAttribute("hanghoa", hangHoa);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/HangTonKho/HangTonKhoChiTiet.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }

}
