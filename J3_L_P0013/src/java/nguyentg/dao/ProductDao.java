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
import java.time.LocalDateTime;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import nguyentg.dto.Product;
import nguyentg.util.MyConnection;

/**
 *
 * @author Nguyen
 */
public class ProductDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Vector<Product> searchProduct(String name, String categoryID, int priceMin, int priceMax, int page) throws Exception {
        Vector<Product> products = null;
        try {
            connection = MyConnection.makeConnection();
            String sql = null;
            if (!categoryID.equals("all")) {
                sql = "SELECT id,name,imageLink,description,price,quantity,categoryID FROM dbo.tblProduct\n"
                        + "WHERE name LIKE N'%" + name + "%' AND categoryID='" + categoryID + "'  AND (price BETWEEN " + priceMin + " AND " + priceMax + ") AND status=1 AND quantity>0 \n"
                        + "ORDER BY createDate OFFSET " + ((page - 1) * 9) + " ROWS FETCH NEXT 9 ROWS ONLY";
            } else {
                sql = "SELECT id,name,imageLink,description,price,quantity,categoryID FROM dbo.tblProduct\n"
                        + "WHERE name LIKE N'%" + name + "%' AND (price BETWEEN " + priceMin + " AND " + priceMax + ") AND status=1 AND quantity>0 \n"
                        + "ORDER BY createDate OFFSET " + ((page - 1) * 9) + " ROWS FETCH NEXT 9 ROWS ONLY";
            }
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            products = new Vector<>();

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getString("id"));
                product.setName(resultSet.getNString("name"));
                product.setImageLink(resultSet.getString("imageLink"));
                product.setDescription(resultSet.getNString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setCategoryID(resultSet.getString("categoryID"));
                products.add(product);
            }
        } finally {
            closeConnection();
        }
        return products;
    }

    public int countPage(String name, String categoryID, int priceMin, int priceMax) throws Exception {
        int pageQuantity = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = null;
            if (!categoryID.equals("all")) {
                sql = "SELECT count(id) as id FROM dbo.tblProduct\n"
                        + "WHERE name LIKE N'%" + name + "%' AND categoryID='" + categoryID + "'  AND (price BETWEEN " + priceMin + " AND " + priceMax + ") AND status=1 AND quantity>0";
            } else {
                sql = "SELECT count(id) as id FROM dbo.tblProduct\n"
                        + "WHERE name LIKE N'%" + name + "%' AND (price BETWEEN " + priceMin + " AND " + priceMax + ") AND status=1 AND quantity>0";
            }
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            int row = 0;
            if (resultSet.next()) {
                row = resultSet.getInt("id");
            }
            pageQuantity = row / 9;
            if (row % 9 > 0) {
                pageQuantity++;
            }
        } finally {
            closeConnection();
        }
        return pageQuantity;
    }

    public Product findProductByID(String id) throws Exception {
        Product product = null;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT name,imageLink,description,price,quantity,categoryID FROM dbo.tblProduct WHERE id='" + id + "'";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            product = new Product();
            if (resultSet.next()) {
                product.setId(id);
                product.setName(resultSet.getNString("name"));
                product.setImageLink(resultSet.getString("imageLink"));
                product.setDescription(resultSet.getNString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setCategoryID(resultSet.getString("categoryID"));
            }
        } finally {
            closeConnection();
        }
        return product;
    }

    public int getPriceMax() throws Exception {
        int priceMax = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT MAX(price) AS priceMax FROM dbo.tblProduct";

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                priceMax = resultSet.getInt("priceMax");
            }
        } finally {
            closeConnection();
        }
        return priceMax;
    }

    public Boolean deleteProduct(String id) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "UPDATE dbo.tblProduct SET status=0 WHERE id='" + id + "'";
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } finally {
            closeConnection();
        }
        return result == 1;
    }

    public Boolean updateProduct(Product product) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "UPDATE dbo.tblProduct SET name=N'" + product.getName() + "',imageLink='" + product.getImageLink() + "',\n"
                    + "description=N'" + product.getDescription() + "',price=" + product.getPrice() + ",quantity=" + product.getQuantity() + ",categoryID='" + product.getCategoryID() + "'\n"
                    + "WHERE id='" + product.getId() + "'";
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } finally {
            closeConnection();
        }
        return result == 1;
    }

    public Boolean addProduct(Product product) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "INSERT INTO dbo.tblProduct\n"
                    + "        ( id , name , imageLink , description , createDate , price , quantity , status , categoryID )\n"
                    + "VALUES  ( '" + product.getId() + "' , N'" + product.getName() + "' , '" + product.getImageLink() + "' , N'" + product.getDescription() + "' , '" + product.getCreateDate() + "' , " + product.getPrice() + " , " + product.getQuantity() + " , 1 , '" + product.getCategoryID() + "' )";
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } finally {
            closeConnection();
        }
        return result == 1;
    }

    public int getLastProductID() throws Exception {
        int id = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT MAX(CAST(id AS INT)) AS id FROM dbo.tblProduct";

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("id");
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public int getLastLogID() throws Exception {
        int id = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT MAX(CAST(id AS INT)) AS id FROM dbo.tblLog";

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("id");
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean insertLog(String id, String userID, String productID, String activity) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "INSERT INTO dbo.tblLog\n"
                    + "        ( id, userID, productID, time, activity )\n"
                    + "VALUES  ( '" + id + "', '" + userID + "', '" + productID + "', '" + LocalDateTime.now().toString() + "', '" + activity + "')";
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } finally {
            closeConnection();
        }
        return result == 1;
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
