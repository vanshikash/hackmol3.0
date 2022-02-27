<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    int c=0;
    String email=(String)session.getAttribute("logged_in_email");
    String review_id=request.getParameter("review_id");
    PreparedStatement ps=co.prepareStatement("select * from student_forum where review_id=?");
    ps.setString(1,review_id);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        String supported_by=rs.getString(5);
        String no_of_support=rs.getString(4);
        StringTokenizer st=new StringTokenizer(supported_by,"/");
        while(st.hasMoreTokens())
        {
            String check=st.nextToken();
            System.out.println(check);
            
            if(check.equals(email))
            {
                c=1;
                break;
            }
            else
            {
                c=0;
            }
        }
            
           if(c==1)
            {
                %>
                <script>
                    alert('You Have Already Supported');
                    window.location.href="../Student Forum/Student Forum Page.jsp";
                </script>
                <%
            }
            else
            {
                supported_by=supported_by+"/"+email;
                int num=Integer.parseInt(no_of_support)+1;
                no_of_support=Integer.toString(num);
                PreparedStatement pst=co.prepareStatement("update student_forum set supported_by=?,no_of_support=? where review_id=?");
                pst.setString(1,supported_by);
                pst.setString(2,no_of_support);
                pst.setString(3,review_id);
                pst.execute();
                            
            }
}
%>
                <script>
                    alert('Support Made');
                    window.location.href="../Student Forum/Student Forum Page.jsp";
                </script> 
        }
    
