/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Nguyen
 */
public class MyConnection {

    public static Connection makeConnection() throws ClassNotFoundException, SQLException, Exception {
        Connection connection = null;
        Context context= (Context) (new  InitialContext()).lookup("java:comp/env");
        DataSource dataSource= (DataSource) context.lookup("DBCon");
        connection= dataSource.getConnection();
        return connection;
    }
}
