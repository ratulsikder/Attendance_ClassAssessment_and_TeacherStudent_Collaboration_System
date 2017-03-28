
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/file")
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class file extends HttpServlet {

    String department_name,course_code,course_year;
   
    FileItem flItem = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement stat = null;
        try {
            long maxFileSize = (2 * 1024 * 1024);
            int maxMemSize = (2 * 1024 * 1024);

            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (isMultiPart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem fileItem = iter.next();
                    if (fileItem.isFormField()) {
                        processFormField(fileItem);
                    } else {
                        flItem = fileItem;
                    }
                }
				
				
		HttpSession hs = request.getSession();
    	String email = (String) hs.getAttribute("semail");
    	String name = (String) hs.getAttribute("sname");
    	String student_id = (String) hs.getAttribute("student_id");

    		if (email == null) {
    			
    			out.println("<font color=red size=5>You are not logged in.</font>");
    			response.setHeader("Refresh", "3;url=StudentPanel.jsp");
    		
    		}
				
            // ServletContext sc = getServletContext();
          	// con = (Connection) sc.getAttribute("MyConn");
			 
		 department_name = request.getParameter("department_name");
    	 course_code = request.getParameter("course_code");
		 course_year = request.getParameter("course_year");
    	 String table_name = department_name+course_year+course_code; 
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT", "123");
                stat = con.prepareStatement("insert into jj (name,ass,pho)values(?,?,?)");
                stat.setString(1, department_name);
                stat.setString(2, course_code);
               
                stat.setBinaryStream(3, flItem.getInputStream(), (int) flItem.getSize());
              
                int rows = stat.executeUpdate();
                out.println("insert");
             
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processFormField(FileItem item) {
        //String na = item.getFieldName();
        if (item.getFieldName().equals("department_name")) {
        	department_name = item.getString();
        } else if (item.getFieldName().equals("course_code")) {
        	course_code = item.getString();
        } 
        else if (item.getFieldName().equals("course_year")) {
        	course_year= item.getString();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
