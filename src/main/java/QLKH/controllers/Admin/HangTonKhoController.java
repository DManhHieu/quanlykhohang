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
import java.util.List;

@WebServlet("/HangTonKho")
public class HangTonKhoController extends HttpServlet {
    HangHoaDAO hangHoaDAO = new HangHoaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        int nhom = (int) session.getAttribute("NhomNhanVien");
        if (session != null && session.getAttribute("account") != null && nhom == 0) {
            List<HangHoa> hangHoas = hangHoaDAO.getHangHoas();
            req.setAttribute("hanghoas", hangHoas);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/HangTonKho/HangTonKho.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login");
        }
    }
}
