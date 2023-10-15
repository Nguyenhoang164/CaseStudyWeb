package controler;

import model.Produce;
import model.User;
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
                case "back":
                    showFormAdmin(req,resp);
                    break;
                case "check":
                 showFormBuyCheck(req,resp);
                    break;
                case "buy":
                showFormBuy(req,resp);
                    break;
                case "search":
                 showFormSearch(req,resp);
                    break;
                case "add":
                 showFormAdd(req,resp);
                    break;
                case "update":
                showFormUpdate(req,resp);
                    break;
                case "delete":
                    showFormDelete(req,resp);
                    break;
                case "deletePack":
                    showFormDeleteProduct(req,resp);
                    break;
                case "BuyPack":
                    showFormBuyProduct(req,resp);
                    break;
                default:
                    showFormShow(req,resp);
                    break;
            }
        }catch (SQLException | ClassNotFoundException e){
               throw new RuntimeException();
        }
    }
   public void showFormShow(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
       List<Produce> list = produceServiceImp.showList();
       request.setAttribute("list",list);
       request.getRequestDispatcher("client/main.jsp").forward(request,response);

   }
    public void showFormAdmin(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Produce> list = produceServiceImp.showList();
        request.setAttribute("list",list);
        request.getRequestDispatcher("sale/admin.jsp").forward(request,response);

    }
   public void showFormBuyCheck(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("client/pack.jsp").forward(request,response);
   }
   public void showFormBuy(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
       int id = Integer.parseInt(request.getParameter("id"));
       Produce produce = produceServiceImp.findProduct(id);
       list.add(produce);
       int count = 0;
       for (Produce product: list) {
           count++;
       }
       HttpSession session = request.getSession();
       session.setAttribute("list",list);
       session.setAttribute("count",count);
       request.getRequestDispatcher("client/pack.jsp").forward(request,response);
   }
    public void showFormDeleteProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produce produceToRemove = null;

        // Tìm đối tượng produce có id tương ứng trong mảng list
        for (Produce produce : list) {
            if (produce.getId() == id) {
                produceToRemove = produce;
                break;
            }
        }

        // Xóa đối tượng produce khỏi mảng list (nếu tìm thấy)
        if (produceToRemove != null) {
            list.remove(produceToRemove);
        }

        int count = list.size(); // Cập nhật số lượng sản phẩm trong mảng list

        HttpSession session = request.getSession();
        session.setAttribute("list", list);
        session.setAttribute("count", count);
        request.getRequestDispatcher("client/pack.jsp").forward(request, response);
    }
    public void showFormBuyProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produce produceToRemove = null;

        // Tìm đối tượng produce có id tương ứng trong mảng list
        for (Produce produce : list) {
            if (produce.getId() == id) {
                produceToRemove = produce;
                break;
            }
        }

        // Xóa đối tượng produce khỏi mảng list (nếu tìm thấy)
        if (produceToRemove != null) {
            list.remove(produceToRemove);
        }

        int count = list.size(); // Cập nhật số lượng sản phẩm trong mảng list

        HttpSession session = request.getSession();
        session.setAttribute("list", list);
        session.setAttribute("count", count);
        request.setAttribute("messageBuy","buy complete");
        request.getRequestDispatcher("client/pack.jsp").forward(request, response);
    }
   public void showFormAdd(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/add.jsp").forward(request,response);

   }
    public void showFormUpdate(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sale/edit.jsp").forward(request,response);

    }
    public void showFormSearch(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("client/search.jsp").forward(request,response);
    }
    public void showFormDelete(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
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
                    searchProduct(req,resp);
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
        if (produceServiceImp.findProduct(id) != null){
            produceServiceImp.deleteProduct(id);
            request.setAttribute("message","delete complete");
            request.getRequestDispatcher("sale/delete.jsp").forward(request,response);
        }else {
            request.setAttribute("message", "false");
            request.getRequestDispatcher("sale/delete.jsp").forward(request, response);
        }
    }
    public void searchProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String name = request.getParameter("name");
        List<Produce> result = produceServiceImp.findProductByName(name);
        request.setAttribute("list",result);
        request.getRequestDispatcher("client/search.jsp").forward(request,response);
    }
    public void addProduct(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String name = request.getParameter("name");
        String houseProduct = request.getParameter("houseProduce");
        String prize = request.getParameter("prize");
        String status = request.getParameter("status");
        String urlImg = request.getParameter("urlImg");
        String note = request.getParameter("note");
        Produce produce = new Produce(name,houseProduct,prize,status,urlImg,note);
        produceServiceImp.addProduct(produce);
        request.setAttribute("message","add complete");
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
        produceServiceImp.updateProduct(produce);
        request.setAttribute("message","update complete");
        request.getRequestDispatcher("sale/edit.jsp").forward(request,response);
    }
}

