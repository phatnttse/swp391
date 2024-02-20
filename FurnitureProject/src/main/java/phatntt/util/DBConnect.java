/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class DBConnect implements Serializable{
    
    public static Connection createConnection() throws /*ClassNotFoundException*/ SQLException, NamingException{
        //1.get current context
        Context currentContext = new InitialContext();        
        //2. Look up tomcat context
        Context tomCatContext = (Context)currentContext.lookup("java:comp/env");
        //3. Look up our datasource
        DataSource ds = (DataSource)tomCatContext.lookup("FurnitureProject");
        //4. Open connection from DS
        Connection con = ds.getConnection();
                     
        return con;
        
        
//        //1. Load Drive
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        
//        //2. Create connection String url
//        String url = "jdbc:sqlserver://localhost:1433;databaseName=SE1708";
//        
//        //3. Open connection
//        Connection con = DriverManager.getConnection(url, "sa", "12345");
//        
//        return con;
    }
    
}
