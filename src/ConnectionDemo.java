import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.swing.JOptionPane;


public class ConnectionDemo implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","123");
			 ServletContext sc = sce.getServletContext();
			 sc.setAttribute("MyConn", conn);
			 JOptionPane.showConfirmDialog(null, sc);
			
		} catch (ClassNotFoundException ex) {
		}catch(SQLException e){
			
			System.out.println("Error:  "+e);
		}
		
	}

}
