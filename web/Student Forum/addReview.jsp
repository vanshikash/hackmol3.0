<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    String review=request.getParameter("review");
    String supported_by="";
    String no_of_support="0";
    String email=(String)session.getAttribute("logged_in_email");
    PreparedStatement ps=co.prepareStatement("insert into student_forum (review,supported_by,no_of_support,email) values(?,?,?,?)");
    ps.setString(1,review);
    ps.setString(2,supported_by);
    ps.setString(3,no_of_support);
    ps.setString(4,email);
    ps.execute();
%>
<script>
    window.location.href="Student Forum Page.jsp";
    alert('Review Added');
    
</script>