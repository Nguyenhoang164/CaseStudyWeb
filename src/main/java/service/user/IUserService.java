package service.user;

import model.User;

import java.sql.SQLException;

public interface IUserService {
    void addUser(User user) throws SQLException, ClassNotFoundException;
    void updateUser(int id , User user) throws SQLException, ClassNotFoundException;
    User findUser(String Username) throws SQLException, ClassNotFoundException;
}
