/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marinadb;
/**
 *
 * @author Roman
 */

public class MarinaDB {
   public static void main(String[] args)
  {
    Conecction con = new Conecction();
    if(con.logIn("foncho@gmail.com","pollito"))
        System.out.println("Exito");
    else System.out.println("Fracaso");
  }
}
    /*public static void main(String[] args) {
    Connection conn = null;
    int port = 3306;
    String host = "localhost";
    String db = "marina";
    String user = "root";
    String pass = "pastelillo1";
    String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false", host, port, db);
        try{
            conn = DriverManager.getConnection(url, user, pass);
            if (conn!=null)
            {
                System.out.println("Exito");
            }
        }catch(Exception e)
        {
            System.out.println("Fracaso");
        }
    }
    */
