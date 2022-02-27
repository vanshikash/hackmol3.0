<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    String product_id=request.getParameter("product_id");
    String email=(String)session.getAttribute("logged_in_email");
    PreparedStatement ps=co.prepareStatement("delete from shared_stuff where product_id=?");
    ps.setString(1,product_id);
    ps.execute();
    
%>

<jsp:forward page="removeStuff.jsp"/>