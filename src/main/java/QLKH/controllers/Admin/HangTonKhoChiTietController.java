package QLKH.controllers.Admin;

import QLKH.DAO.HangHoaDAO;
import QLKH.models.HangHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/HangTonKho/ChiTiet")
public class HangTonKhoChiTietController extends HttpServlet {
    HangHoaDAO hangHoaDAO=new HangHoaDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String mahanghoa=req.getParameter("MaHangHoa");
        HangHoa hangHoa=hangHoaDAO.getHangHoa(mahanghoa);
        req.setAttribute("hanghoa",hangHoa);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/View/Admin/HangTonKhoChiTiet.jsp");
        dispatcher.forward(req, resp);
    }
}
