<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>;
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="database.dbconnection"%>
<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%
String str="pdf";

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try
{
    Document document=new Document();
    if(str.equals("pdf"))
    {
        response.setContentType("application/pdf");
        PdfWriter.getInstance(document,response.getOutputStream());
    }
    conn= dbconnection.getConnection();
    String query = "select * from individual_exam_result";         
       ps=conn.prepareStatement(query);               
       rs=ps.executeQuery();
      
    document.open();

    /* new paragraph instance initialized and add function write in pdf file*/
    document.add(new Paragraph("---------------------------------------------------------REPORT---------------------------------------------------------\n\n"));
    document.add(new Paragraph("                                             OPEN INSTITUTE - MATHARA\n\n"));
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    document.addCreationDate();
   
    while(rs.next())
    {
          // fetch & writing records in pdf files
        document.add(new Paragraph("Record_ID ::"+rs.getString(1)+"\nIndex No ::"+rs.getString(2)+"\nGrade ::"+rs.getString(3)+"\nSubject ::"+rs.getString(4)+"\nResult ::"+rs.getString(5)+"\n\n"));
    }
  //  document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
   
    document.close(); 
    conn.close();  
}
catch(Exception de)
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
           
}


%>