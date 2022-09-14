/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import nguyentg.dto.Category;
import nguyentg.util.MyConnection;

/**
 *
 * @author Nguyen
 */
public class CategoryDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public Vector<Category> loadCategory() throws Exception{
        Vector<Category> categorys=null;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT id,name FROM dbo.tblCategory";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            categorys= new Vector<>();
            while(resultSet.next()){
                Category category= new Category();
                category.setId(resultSet.getString("id"));
                category.setName(resultSet.getNString("name"));
                categorys.add(category);
            }
        } finally {
            closeConnection();
        }
        return categorys;
    }
    
    private void closeConnection() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
}
