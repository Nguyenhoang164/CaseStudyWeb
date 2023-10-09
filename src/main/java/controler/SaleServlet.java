package controler;

import model.Produce;
import service.produce.ProduceServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SaleServlet" , value = "/sale")
public class SaleServlet extends HttpServlet {
    public static ProduceServiceImp produceServiceImp = new ProduceServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        try {
            switch (action){
                case "buy":
                FormBuy(req,resp);
                    break;
                case "add":
                FormAdd(req,resp);
                    break;
                case "update":
                FormUpdate(req,resp);
                    break;
                default:
                    FormShow(req,resp);
                    break;
            }
        }catch (SQLException | ClassNotFoundException e){
               throw new RuntimeException();
        }
    }
   public void FormShow(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
       List<Produce> list = produceServiceImp.showList();
       request.setAttribute("list",list);
       request.getRequestDispatcher("sale/main.jsp").forward(request,response);
   }
   public void FormBuy(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
       request.getRequestDispatcher("sale/pack.jsp").forward(request,response);

   }
   public void FormAdd(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/add.jsp").forward(request,response);

   }
    public void FormUpdate(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/edit.jsp").forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        try {
            switch (action){
                case "buy":
                    buyProduct(req,resp);
                    break;
                case "add":
                    addProduct(req,resp);
                    break;
                case "update":
                    updateProduct(req,resp);
                    break;
                default:
                    break;
            }
        }catch (SQLException | ClassNotFoundException e){
            throw new RuntimeException();
        }
    }
    public void addProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String name = request.getParameter("name");
        String houseProduct = request.getParameter("houseProduct");
        String prize = request.getParameter("prize");
        String status = request.getParameter("status");
        String urlImg = request.getParameter("urlImg");
        String note = request.getParameter("note");
        Produce produce = new Produce(name,houseProduct,prize,status,urlImg,note);
        produceServiceImp.addProduce(produce);
        request.setAttribute("message","them thanh cong");
        request.getRequestDispatcher("sale/add.jsp").forward(request,response);

    }
    public void buyProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produce produce = produceServiceImp.findProduce(id);
        HttpSession session = request.getSession();
        session.setAttribute("produce",produce);
        response.sendRedirect("sale/pack.jsp");
    }
    public void updateProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String name = request.getParameter("name");
        String houseProduct = request.getParameter("houseProduct");
        String prize = request.getParameter("prize");
        String status = request.getParameter("status");
        String urlImg = request.getParameter("urlImg");
        String note = request.getParameter("note");
        int id = Integer.parseInt(request.getParameter("id"));
        Produce produce = new Produce(name,houseProduct,prize,status,urlImg,note);
        produceServiceImp.updateProduce(id,produce);
        request.setAttribute("message","update thanh cong");
        request.getRequestDispatcher("sale/edit.jsp").forward(request,response);
    }
}

