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
import java.util.logging.Level;
import java.util.logging.Logger;
import nguyentg.util.MyConnection;
import nguyentg.dto.User;
/**
 *
 * @author Nguyen
 */
public class UserDao {
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
        public User checkLoginByGoogle(String id, String email) throws Exception {
        User user = null;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT name,phoneNumber,isAdmin,address FROM dbo.tblUser WHERE id='"+id+"' AND email='"+email+"' ";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            user= new User();
            if(resultSet.next()){
                user.setId(id);
                user.setEmail(email);
                user.setName(resultSet.getNString("name"));
                user.setPhoneNumber(resultSet.getString("phoneNumber"));
                user.setAddress(resultSet.getNString("address"));
                user.setIsAdmin(resultSet.getBoolean("isAdmin"));
            }
        } finally {
            closeConnection();
        }
        return user;
    }
        
        public User  checkLogin(String id, String password) throws Exception {
        User user = null;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT id,name,phoneNumber,isAdmin,address FROM dbo.tblUser WHERE email='"+id+"' AND password='"+password+"' ";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            user= new User();
            if(resultSet.next()){
                user.setId(resultSet.getString("id"));
                user.setEmail(id);
                user.setName(resultSet.getNString("name"));
                user.setPhoneNumber(resultSet.getString("phoneNumber"));
                user.setAddress(resultSet.getNString("address"));
                user.setIsAdmin(resultSet.getBoolean("isAdmin"));
            }
        } finally {
            closeConnection();
        }
        return user;
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
