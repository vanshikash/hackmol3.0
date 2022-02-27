<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String branch=request.getParameter("branch");
      String skill=request.getParameter("skill");
    String year=request.getParameter("year");
    String password=request.getParameter("password");
    int c=0;
    
    PreparedStatement ps=co.prepareStatement("select * from users where email=?");
    ps.setString(1,email);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        c++;
    }
    
    if(c==0)
    {
        ps=co.prepareStatement("INSERT INTO users (`email`, `password`, `name`, `branch`, `year`, `skill`) VALUES (?,?,?,?,?,?)");
        ps.setString(1,email);  
        ps.setString(2,password);
        ps.setString(3,name);
        ps.setString(4,branch);
        ps.setString(5,year);
        ps.setString(6,skill);
        ps.execute();
%>
        <script type=text/javascript>
            alert('User Added');
        </script>
        <jsp:include page="loginPage.jsp"/>

<%
    }    
    else
    {
        %>
        <script type=text/javascript>
            alert('Email Already Exists');
        </script>
        <jsp:include page="signupPage.jsp"/>
<%
    }
    
%>
