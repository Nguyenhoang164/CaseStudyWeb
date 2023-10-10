package service.produce;

import model.Produce;

import java.sql.SQLException;
import java.util.List;

public interface IProduceService {
    List<Produce> showList() throws SQLException, ClassNotFoundException;
    void addProduce(Produce produce) throws SQLException, ClassNotFoundException;
    void updateProduce( Produce produce) throws SQLException, ClassNotFoundException;
    void deleteProduce(int id) throws SQLException, ClassNotFoundException;
    Produce findProduce(int id) throws SQLException, ClassNotFoundException;

}
