package QLKH.controllers.Employee;

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

@WebServlet(name = "KiemKeHangHoaController", urlPatterns = {"/KiemKeNV"})
public class KiemKeHangHoaController extends HttpServlet {
    HangHoaDAO hangHoaDAO = new HangHoaDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mahanghoa = request.getParameter("mahanghoa");
        HangHoa hangHoa = hangHoaDAO.getHangHoa(mahanghoa);
        request.setAttribute("hanghoa", hangHoa);
        String url = "/View/NhanVien/kiemkechinhsua.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<HangHoa> hangHoas = hangHoaDAO.getHangHoas();
        request.setAttribute("listhanghoa", hangHoas);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
