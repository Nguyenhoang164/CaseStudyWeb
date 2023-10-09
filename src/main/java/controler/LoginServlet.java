package controler;

import model.User;
import service.user.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet" , value = "/login")
public class LoginServlet extends HttpServlet {
    public static UserServiceImp userServiceImp = new UserServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String action = req.getParameter("action");
      if (action == null){
          action = "";
      }
          switch (action) {
              case "signUp":
                  GoSignUp(req, resp);
                  break;
              default:
                  GoLogin(req, resp);
                  break;
          }
    }
    public void GoLogin(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login/login.jsp").forward(request,response);
    }
    public void GoSignUp(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login/signUp.jsp").forward(request,response);
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
                    signUp(req,resp);
                    break;
                default:
                    Login(req,resp);
                    break;
            }
        }catch (SQLException | ClassNotFoundException e){
            throw new ServletException();
        }
    }
    public void Login (HttpServletRequest request,HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userServiceImp.findUser(username);
        if (!password.equals(user.getPassword())){
            request.setAttribute("message","loi khong trung khop");
            request.getRequestDispatcher("login/login.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("sale/main.jsp").forward(request,response);
        }
    }
    public void signUp(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String permission = request.getParameter("permission");
        String phone = request.getParameter("phone");
        String local = request.getParameter("local");
        User user = new User(username,password,permission,phone,local);
        userServiceImp.addUser(user);
        request.setAttribute("message","thanh cong");
        request.getRequestDispatcher("login/signUp.jsp").forward(request,response);
    }
}
