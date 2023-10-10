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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SaleServlet" , value = "/sales")
public class SaleServlet extends HttpServlet {
    public static ProduceServiceImp produceServiceImp = new ProduceServiceImp();
public static List<Produce> list = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        try {
            switch (action){
                case "check":
                  FormBuyCheck(req,resp);
                    break;
                case "buy":
                FormBuy(req,resp);
                    break;
                case "search":
                 FormSearch(req,resp);
                    break;
                case "add":
                FormAdd(req,resp);
                    break;
                case "update":
                FormUpdate(req,resp);
                    break;
                case "delete":
                    FormDelete(req,resp);
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
   public void FormBuyCheck(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/pack.jsp").forward(request,response);
   }
   public void FormBuy(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
       int id = Integer.parseInt(request.getParameter("id"));
       Produce produce = produceServiceImp.findProduce(id);
       list.add(produce);
       int count = 0;
       for (Produce product: list) {
           count++;
       }
       HttpSession session = request.getSession();
       session.setAttribute("list",list);
       session.setAttribute("count",count);
       request.getRequestDispatcher("sale/pack.jsp").forward(request,response);
   }
   public void FormAdd(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/add.jsp").forward(request,response);

   }
    public void FormUpdate(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/edit.jsp").forward(request,response);

    }
    public void FormSearch(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/search.jsp").forward(request,response);
    }
    public void FormDelete(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/delete.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        try {
            switch (action){
                case "add":
                    addProduct(req,resp);
                    break;
                case "update":
                    updateProduct(req,resp);
                    break;
                case "delete":
                    deleteProduct(req,resp);
                    break;
                case "search":
                    break;
                default:
                    break;
            }
        }catch (SQLException | ClassNotFoundException e){
            throw new RuntimeException();
        }
    }
    public void deleteProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        produceServiceImp.deleteProduce(id);
        request.setAttribute("message","xoa thanh cong");
        request.getRequestDispatcher("sale/delete.jsp").forward(request,response);

    }
    public void addProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String name = request.getParameter("name");
        String houseProduct = request.getParameter("houseProduce");
        String prize = request.getParameter("prize");
        String status = request.getParameter("status");
        String urlImg = request.getParameter("urlImg");
        String note = request.getParameter("note");
        Produce produce = new Produce(name,houseProduct,prize,status,urlImg,note);
        produceServiceImp.addProduce(produce);
        request.setAttribute("message","them thanh cong");
        request.getRequestDispatcher("sale/add.jsp").forward(request,response);

    }
    public void updateProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String name = request.getParameter("name");
        String houseProduct = request.getParameter("houseProduce");
        String prize = request.getParameter("prize");
        String status = request.getParameter("status");
        String urlImg = request.getParameter("urlImg");
        String note = request.getParameter("note");
        int id = Integer.parseInt(request.getParameter("id"));
        Produce produce = new Produce(id,name,houseProduct,prize,status,urlImg,note);
        produceServiceImp.updateProduce(produce);
        request.setAttribute("message","update thanh cong");
        request.getRequestDispatcher("sale/edit.jsp").forward(request,response);
    }
}

