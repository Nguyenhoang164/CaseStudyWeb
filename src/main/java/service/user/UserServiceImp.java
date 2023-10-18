package service.user;

import model.User;

import java.sql.*;

public class UserServiceImp implements IUserService {
    private String localhost = "localhost:3306";
    private String dbname = "QLSP";
    private String username = "root";
    private String password = "Kamito@123";
    private String url = "jdbc:mysql://" + localhost + "/" + dbname;
    private final String query_insert = "call insert_user(?,?,?,?,?)";
    private final String query_update = "call update_user(?,?,?,?,?,?)";
    private final String query_delete = "call insert_user(?)";

    public Connection connection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }

    @Override
    public void addUser(User user) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        PreparedStatement preparedStatement = connection.prepareStatement(query_insert);
        preparedStatement.setString(1, user.getUsername());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getPermission());
        preparedStatement.setString(4, user.getPhone());
        preparedStatement.setString(5, user.getLocal());
        preparedStatement.executeUpdate();

    }

    @Override
    public void updateUser(int id, User user) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        PreparedStatement preparedStatement = connection.prepareStatement(query_update);
        preparedStatement.setString(1, user.getUsername());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getPermission());
        preparedStatement.setString(4, user.getPhone());
        preparedStatement.setString(5, user.getLocal());
        preparedStatement.setInt(6, user.getId());
        preparedStatement.executeUpdate();
    }

    @Override
    public User findUser(String Username) throws SQLException, ClassNotFoundException {
        Connection connection = connection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("call find_user('" + Username + "')");
        User user = new User();
        while (resultSet.next()) {
            int Id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            String permission = resultSet.getString("permision");
            String phone = resultSet.getString("phone");
            String local = resultSet.getString("local");
            user = new User(Id, username, password, permission, phone, local);
        }
        return user;
    }

}
