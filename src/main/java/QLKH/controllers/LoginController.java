package QLKH.controllers;

import QLKH.models.NhanVien;
import QLKH.DAO.NhanVienDAO;
import QLKH.until.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
    NhanVienDAO nhanVienDAO = new NhanVienDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (req.getParameter("Logout") != null) {
            session.removeAttribute("account");
            /*req.getRequestDispatcher("View/login.jsp").forward(req, resp);*/
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }
        // Check cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    session = req.getSession(true);
                    session.setAttribute("username", cookie.getValue());
                    resp.sendRedirect(req.getContextPath() + "/waiting");
                    return;
                }
            }
        }

        req.getRequestDispatcher("View/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");

        String password = req.getParameter("password");

        boolean isRememberMe = false;
        String remember = req.getParameter("remember");

        if ("on".equals(remember)) {
            isRememberMe = true;
        }
        String alertMsg = "";

        if (username.isEmpty() || password.isEmpty()) {
            if (username.isEmpty()) {
                alertMsg = "Username can't be empty!";
                req.setAttribute("alert1", alertMsg);
                req.getRequestDispatcher("/View/login.jsp").forward(req, resp);
                return;
            }
            if (password.isEmpty()) {
                alertMsg = "Password can't be empty!";
                req.setAttribute("alert2", alertMsg);
                req.getRequestDispatcher("/View/login.jsp").forward(req, resp);
                return;
            }
        }


        NhanVien user = nhanVienDAO.Login(username, password);
        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);
            session.setAttribute("NhomNhanVien", user.getNhomNhanVien().getID());
            session.setAttribute("thongbao","test");
            if (isRememberMe) {
                saveRemeberMe(resp, username);
            }

            resp.sendRedirect(req.getContextPath() + "/waiting");
        } else {
            alertMsg = "Username or password isn't correct";
            req.setAttribute("alert1", alertMsg);
            req.getRequestDispatcher("/View/login.jsp").forward(req, resp);
        }
    }

    private void saveRemeberMe(HttpServletResponse response, String username) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(30 * 60);
        response.addCookie(cookie);
    }
}
