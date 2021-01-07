package QLKH.controllers.Employee;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.TinhTrangDAO;
import QLKH.models.HangHoa;
import QLKH.models.NhanVien;
import QLKH.models.TinhTrang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "KiemKeCapNhatController", urlPatterns = {"/kiemke_capnhat"})
public class KiemKeCapNhatController extends HttpServlet {
    HangHoaDAO hangHoaDAO = new HangHoaDAO();
    TinhTrangDAO tinhTrangDAO = new TinhTrangDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("submit");
        if (action.equals("capnhat")) {
            HttpSession session = request.getSession();
            if (session != null && session.getAttribute("account") != null
                    && session.getAttribute("NhomNhanVien") != null &&
                    (int) session.getAttribute("NhomNhanVien") == 1) {
                String mahanghoa = request.getParameter("mahanghoa");
                HangHoa hangHoa = hangHoaDAO.getHangHoa(mahanghoa);
                int matinhtrang = Integer.parseInt(request.getParameter("tinhtrang"));
                TinhTrang tinhTrang = tinhTrangDAO.getTinhTrang(matinhtrang);
                hangHoa.setTinhTrang(tinhTrang);
                NhanVien nhanVienkiemke = (NhanVien) session.getAttribute("account");
                hangHoa.setNhanVienKiemKe(nhanVienkiemke);
                String vitri = request.getParameter("vitri");
                hangHoa.setViTri(vitri);
                hangHoaDAO.updateHangHoa(hangHoa);
            }
        }
        List<HangHoa> hangHoas = hangHoaDAO.getHangHoas();
        request.setAttribute("listhanghoa", hangHoas);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
