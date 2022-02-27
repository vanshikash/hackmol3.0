<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    String review_id=request.getParameter("review_id");
    String email=(String)session.getAttribute("logged_in_email");
    PreparedStatement ps=co.prepareStatement("delete from student_forum where review_id=?");
    ps.setString(1,review_id);
    ps.execute();
    
%>

<jsp:forward page="removeReview.jsp"/>