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
import java.time.LocalDate;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import nguyentg.dto.Bill;
import nguyentg.dto.ProductInCart;
import nguyentg.util.MyConnection;

/**
 *
 * @author Nguyen
 */
public class BillDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Boolean updateProduct(String id, int quantity) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "UPDATE dbo.tblProduct SET quantity-=" + quantity + " WHERE id='" + id + "'";
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } finally {
            closeConnection();
        }
        return result == 1;
    }

    public int getLastBillID() throws Exception {
        int id = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT MAX(CAST(id AS INT)) AS id FROM dbo.tblBill";

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

    public int getLastBillDetailID() throws Exception {
        int id = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT MAX(CAST(id AS INT)) AS id FROM dbo.tblBillDetail";

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

    public Vector<Bill> searchBill(String name, String minDate, String maxDate, String userID) throws Exception {
        Vector<Bill> bills = null;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT tblBill.id,total,paymentMethod, tblBill.createDate\n"
                    + "FROM dbo.tblBill JOIN dbo.tblBillDetail ON tblBillDetail.billID = tblBill.id JOIN dbo.tblProduct ON tblProduct.id = tblBillDetail.productID\n"
                    + "WHERE (tblBill.createDate BETWEEN '" + minDate + "' AND '" + maxDate + "') AND (userID='" + userID + "') AND (name LIKE N'%" + name + "%')\n"
                    + "GROUP BY tblBill.id,total,paymentMethod,tblBill.createDate ORDER BY tblBill.createDate DESC";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            bills = new Vector<>();
            while (resultSet.next()) {
                Bill bill = new Bill();
                bill.setId(resultSet.getString("id"));
                bill.setTotal(resultSet.getInt("total"));
                bill.setPaymentMethod(resultSet.getBoolean("paymentMethod"));
                bill.setCreateDate(resultSet.getString("createDate"));
                bills.add(bill);
            }
        } finally {
            closeConnection();
        }
        return bills;
    }

    public Vector<ProductInCart> searchProductInBill(String id) throws Exception {
        Vector<ProductInCart> productInCarts = null;
        try {
            connection = MyConnection.makeConnection();
            String sql = "SELECT name,tblBillDetail.price,tblBillDetail.quantity FROM dbo.tblBillDetail JOIN dbo.tblProduct ON tblProduct.id = tblBillDetail.productID\n"
                    + "WHERE billID='" + id + "'";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            productInCarts = new Vector<>();
            while (resultSet.next()) {
                ProductInCart productInCart= new ProductInCart();
                productInCart.setName(resultSet.getNString("name"));
                productInCart.setPrice(resultSet.getInt("price"));
                productInCart.setQuantity(resultSet.getInt("quantity"));
                productInCarts.add(productInCart);
            }
        } finally {
            closeConnection();
        }
        return productInCarts;
    }

    public Boolean addBill(String id, String userID, int total, int paymentMethod) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "INSERT INTO dbo.tblBill\n"
                    + "        ( id, userID, total, paymentMethod, createDate )\n"
                    + "VALUES  ( '" + id + "','" + userID + "'," + total + "," + paymentMethod + ",'" + (LocalDate.now().toString()) + "')";
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } finally {
            closeConnection();
        }
        return result == 1;
    }

    public Boolean addBillDetail(String id, String billID, ProductInCart productInCart) throws Exception {
        int result = 0;
        try {
            connection = MyConnection.makeConnection();
            String sql = "INSERT INTO dbo.tblBillDetail\n"
                    + "        ( id , billID , productID , quantity , price)\n"
                    + "VALUES  ( '" + id + "' , '" + billID + "' , '" + productInCart.getId() + "' , " + productInCart.getQuantity() + " , " + productInCart.getPrice() + " )";
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
