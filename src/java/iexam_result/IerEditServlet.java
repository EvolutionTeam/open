package iexam_result;

    import java.io.IOException;  

    import java.io.PrintWriter;  
      
    import javax.servlet.ServletException;  
    import javax.servlet.annotation.WebServlet;  
    import javax.servlet.http.HttpServlet;  
    import javax.servlet.http.HttpServletRequest;  
    import javax.servlet.http.HttpServletResponse;  
    @WebServlet("/IerEditServlet")  
    public class IerEditServlet extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response)   
               throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();
           
            
             out.print("<body style='background-image:url(123.png)'>");

            out.println("<h1>Update Exam Results</h1>");  
            String oid=request.getParameter("ierid");  
            int ierid=Integer.parseInt(oid);  
              
            Ier ier=Ierdb.getIEResultByIerid(ierid);  
              
            out.print("<form action='IerEditServlet2' method='post'>");  
            out.print("<table style='padding-left:500px; padding-top:15px;'");  
            out.print("<tr><td></td><td><input type='hidden' name='ierid' value='"+ier.getIerid()+"'/></td></tr>");  
            out.print("<tr><td style='padding-top:20px;'>Index No:</td><td style='padding-top:20px;'><input type='text' name='ierindex_no' value='"+ier.getIerindex_no()+"'/></td></tr>");  
            out.print("<tr><td style='padding-top:20px;'>Grade:</td><td style='padding-top:20px;'><input type='text' name='iergrade' value='"+ier.getIergrade()+"'/></td></tr>");  
            out.print("<tr><td style='padding-top:20px;'>Subject:</td><td style='padding-top:20px;'><input type='text' name='iersubject' value='"+ier.getIersubject()+"'/></td></tr>");  
           out.print("<tr><td style='padding-top:20px;'>Result:</td><td style='padding-top:20px;'><input type='text' name='ierresult' value='"+ier.getIerresult()+"'/></td></tr>");
            out.print("</td></tr>");  
            out.print("<tr><td colspan='2' style='padding-top:20px; padding-left:100px;'><input type='submit'  value='Edit & Save '/></td></tr>");  
            out.print("</table>");  
            out.print("</form>");  
              
            out.close();  
        }  
    }  