package service.produce;

import model.Produce;

import java.sql.SQLException;
import java.util.List;

public interface IProduceService {
    List<Produce> showList() throws SQLException, ClassNotFoundException;
    void addProduct(Produce produce) throws SQLException, ClassNotFoundException;
    void updateProduct( Produce produce) throws SQLException, ClassNotFoundException;
    void deleteProduct(int id) throws SQLException, ClassNotFoundException;
    Produce findProduct(int id) throws SQLException, ClassNotFoundException;
    List<Produce> findProductByName(String name) throws SQLException, ClassNotFoundException;

}
