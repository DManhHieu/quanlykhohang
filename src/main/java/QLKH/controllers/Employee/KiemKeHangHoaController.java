package QLKH.controllers.Employee;

import QLKH.DAO.HangHoaDAO;
import QLKH.DAO.MatHangDAO;
import QLKH.models.HangHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "KiemKeHangHoaController", urlPatterns = {"/KiemKeNV"})
public class KiemKeHangHoaController extends HttpServlet {
    HangHoaDAO hangHoaDAO = new HangHoaDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
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
        try {
            String nameaction=request.getParameter("nameaction");
            if(nameaction == null){
                listHangHoa(request, response);
            }
            else
            {
                String theloai=request.getParameter("loai");
                HttpSession session=request.getSession();
                session.setAttribute("theloaicu",theloai);
                if(theloai.equals("mahanghoa")){
                    searchHangHoa_mhh(request, response);
                }
                else if(theloai.equals("tenhanghoa")){
                    searchHangHoa_thh(request, response);
                }
                else if(theloai.equals("vitri")){
                    searchHangHoa_vt(request, response);
                } else if(theloai.equals("tinhtrang")){
                    searchHangHoa_tt(request, response);
                }
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }
    private void searchHangHoa_mhh(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException{
        String mahanghoasearch=request.getParameter("search");
        HangHoa hangHoa=hangHoaDAO.getHangHoa(mahanghoasearch.trim());
        request.setAttribute("hanghoasearch",hangHoa);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    private void searchHangHoa_thh(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException{
        String tenhanghoasearch=request.getParameter("search");
        List<HangHoa> hangHoas=hangHoaDAO.getHangHoa_thh(tenhanghoasearch.trim());
        request.setAttribute("hanghoasearch_thh",hangHoas);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    private void searchHangHoa_vt(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException{
        String vitrisearch=request.getParameter("search");
        List<HangHoa> hangHoas=hangHoaDAO.getHangHoa_vt(vitrisearch.trim());
        request.setAttribute("hanghoasearch_vt",hangHoas);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    private void searchHangHoa_tt(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException{
        String tinhtrangsearch=request.getParameter("search");
        List<HangHoa> hangHoas=hangHoaDAO.getHangHoa_tt(tinhtrangsearch.trim());
        request.setAttribute("hanghoasearch_tt",hangHoas);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    private void listHangHoa(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException{
        List<HangHoa> hangHoas = hangHoaDAO.getHangHoas();
        HttpSession session=request.getSession();
        session.setAttribute("theloaicu","");
        request.setAttribute("listhanghoa", hangHoas);
        String url = "/View/NhanVien/kiemke.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
