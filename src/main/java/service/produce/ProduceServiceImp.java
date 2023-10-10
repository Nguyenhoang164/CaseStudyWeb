package service.produce;

import model.Produce;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProduceServiceImp implements IProduceService {
    private String localhost = "localhost:3306";
    private String dbname = "QLSP";
    private String username = "root";
    private String password = "Kamito@123";
    private String url = "jdbc:mysql://" + localhost + "/" + dbname;
    private String query_select = "call show_produce()";
    private String query_insert = "call insert_produce(?,?,?,?,?,?)";
    private String query_update = "call update_produce(?,?,?,?,?,?,?)";
    private String query_delete = "call delete_produce(?)";


    public Connection connection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url,username,password);
        return connection;
    }
   @Override
    public List<Produce> showList() throws SQLException, ClassNotFoundException {
        Connection connection = connection();
       Statement statement = connection.createStatement();
       ResultSet resultSet = statement.executeQuery(query_select);
       List<Produce> list = new ArrayList<>();

       while (resultSet.next()){
           int id = resultSet.getInt("id");
           String name = resultSet.getString("name");
           String houseProduct = resultSet.getString("houseProduce");
           String prize = resultSet.getString("prize");
           String status = resultSet.getString("status");
           String img = resultSet.getString("img");
           String note = resultSet.getString("note");
           Produce produce = new Produce(id,name,houseProduct,prize,status,img,note);
           list.add(produce);
       }
       return list;
   }
   @Override
    public void addProduce(Produce produce) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        PreparedStatement preparedStatement = connection.prepareStatement(query_insert);
        preparedStatement.setString(1,produce.getName());
        preparedStatement.setString(2,produce.getHouseProduce());
        preparedStatement.setString(3,produce.getPrize());
        preparedStatement.setString(4,produce.getStatus());
        preparedStatement.setString(5,produce.getUrlImg());
        preparedStatement.setString(6,produce.getNote());

        preparedStatement.executeUpdate();
   }
   @Override
    public void updateProduce(Produce produce) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        PreparedStatement preparedStatement = connection.prepareStatement(query_update);
       preparedStatement.setString(1,produce.getName());
       preparedStatement.setString(2,produce.getHouseProduce());
       preparedStatement.setString(3,produce.getPrize());
       preparedStatement.setString(4,produce.getStatus());
       preparedStatement.setString(5,produce.getUrlImg());
       preparedStatement.setString(6,produce.getNote());
       preparedStatement.setInt(7,produce.getId());
       preparedStatement.executeUpdate();
   }
   @Override
    public void deleteProduce(int id) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        PreparedStatement preparedStatement = connection.prepareStatement(query_delete);
        preparedStatement.setInt(1,id);
        preparedStatement.executeUpdate();
   }
    @Override
    public Produce findProduce(int id) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("call find_produce('" + id +"')");
        Produce produce = new Produce();
        while (resultSet.next()){
            int Id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String houseProduct = resultSet.getString("houseProduce");
            String prize = resultSet.getString("prize");
            String status = resultSet.getString("status");
            String img = resultSet.getString("img");
            String note = resultSet.getString("note");
            produce = new Produce(Id,name,houseProduct,prize,status,img,note);
        }
        return produce;
    }
}
