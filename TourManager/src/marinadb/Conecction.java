/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marinadb;

import java.sql.*;

/**
 *
 * @author Roman
 */
public class Conecction {
    String myDriver = "org.gjt.mm.mysql.Driver";
      int port = 3306;
      String host = "localhost";
      String db = "marina";
      String user = "root";
      String pass = "nepe";
      String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false", host, port, db);
      
    //constructor
    public Conecction()
    {/*
         try
    {
      // create our mysql database connection
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(url, user, pass);
      
      // our SQL SELECT query. 
      // if you only need a few columns, specify them by name instead of using "*"
      String query = "SELECT * FROM tour where idTour = 1";

      // create the java statement
      Statement st = conn.createStatement();
      
      // execute the query, and get a java resultset
      ResultSet rs = st.executeQuery(query);
      
      // iterate through the java resultset
      rs.next();
      String nombre = rs.getString("nombre");
      /*while (rs.next())
      {
        int id = rs.getInt("idTour");
        
        Time lastName = rs.getTime("horario");
        Date dateCreated = rs.getDate("fecha");
        int cap = rs.getInt("capacidad");
        int padul = rs.getInt("precioAdulto");
        int pnino = rs.getInt("precioNino");
        String descripcion = rs.getString("descripcion");
        String multi = rs.getString("multimedia");
        
        // print the results
        System.out.format("%s, %s, %s, %s, %s, %s, %s, %s,%s\n", id, firstName, lastName, dateCreated, cap, padul, pnino, descripcion,multi);
      }
      System.out.println(nombre);
      st.close();
    }
         
    catch (ClassNotFoundException | SQLException e)
    {
      System.err.println("Got an exception! ");
      System.err.println(e.getMessage());
    }
    */
}
    
    public boolean logIn(String email_input, String pass_input){
        try
        {
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(url, user, pass);
      String query = "SELECT correo,password FROM marina.login where correo = \""+email_input+"\"";
      Statement st = conn.createStatement();
      ResultSet rs = st.executeQuery(query);
      if (rs == null || !rs.first()) {
          return false;
    }
    else {
    String pass = rs.getString("password");
    System.out.println(pass);
    System.out.println(pass_input);
    if (pass.equals(pass_input)){
      st.close();
        return true;
    }
    else {
      st.close();
    return false;
    }
    }
      
    }
         
    catch (ClassNotFoundException | SQLException e)
    {
      System.err.println("Got an exception! ");
      System.err.println(e.getMessage());
      return false;
    }
}
}
