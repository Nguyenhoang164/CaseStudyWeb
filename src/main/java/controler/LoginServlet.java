package controler;

import model.User;
import service.user.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    public static UserServiceImp userServiceImp = new UserServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signUp":
                showFormSignUp(req, resp);
                break;
            case "logout":
                logoutUser(req, resp);
                break;
            default:
                showFormLogin(req, resp);
                break;
        }
    }

    public void showFormLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login/login.jsp").forward(request, response);
    }

    public void showFormSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login/signUp.jsp").forward(request, response);
    }

    public void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.invalidate();
        request.getRequestDispatcher("login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "signUp":
                    signUpUser(req, resp);
                    break;
                default:
                    loginUser(req, resp);
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException();
        }
    }

    public void loginUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userServiceImp.findUser(username);
        if (!password.equals(user.getPassword())) {
            request.setAttribute("message", "login error");
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User userCheck = userServiceImp.findUser(username);
            if (!userCheck.getPermission().equals("admin")) {
                session.isNew();
                session.setAttribute("username", username);
                request.getRequestDispatcher("client/welcome.jsp").forward(request, response);
            } else {
                session.isNew();
                session.setAttribute("username", username);
                request.getRequestDispatcher("sale/admin.jsp").forward(request, response);
            }

        }
    }

    public void signUpUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String permission = request.getParameter("permission");
        String phone = request.getParameter("phone");
        String local = request.getParameter("local");
        User user = new User(username, password, permission, phone, local);
        userServiceImp.addUser(user);
        request.setAttribute("message", "Add user complete");
        request.getRequestDispatcher("login/signUp.jsp").forward(request, response);
    }
}
