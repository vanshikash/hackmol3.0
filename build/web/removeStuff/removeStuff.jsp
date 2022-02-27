<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    String email=(String)session.getAttribute("logged_in_email");
    PreparedStatement ps=co.prepareStatement("select * from shared_stuff where email=?");
    ps.setString(1,email);
    ResultSet rs=ps.executeQuery();
    
%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>removeStuff</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="removeStuff.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.1.0, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "hackmol"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="removeStuff">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body"><header class="u-clearfix u-grey-40 u-header u-header" id="sec-a415"><div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h3 class="u-align-center u-headline u-text u-text-1">
          <a href="/">WELCOME TO NITJ&nbsp;</a>
        </h3>
      </div></header>
    <section class="u-clearfix u-section-1" id="sec-3650">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="40%">
              <col width="30%">
              <col width="30%">
            </colgroup>
            <thead class="u-align-center u-grey-30 u-table-header u-table-header-1">
              <tr style="height: 56px;">
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">PRODUCT NAME</th>
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">IMAGE</th>
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">DELETE</th>
              </tr>
            </thead>
            <tbody class="u-align-center u-table-body u-table-body-1">
              <%
                  while(rs.next())
                  {
                      String product_id=rs.getString(1);
                      String product_name=rs.getString(3);
                      String image=rs.getString(4);
              %>
                
                <tr style="height: 52px;">
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=product_name%></td>
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell">
                    <a class="u-border-none u-btn u-btn-round u-button-style u-hover-palette-1-light-2 u-radius-17 u-btn-1" href="../addStuff/images/<%=image%>">IMAGE</a>
                </td>
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell u-table-cell-6">
                    <a class="u-border-none u-btn u-btn-round u-button-style u-hover-palette-2-light-2 u-palette-2-base u-radius-17 u-btn-2" href="deleteButton.jsp?product_id=<%=product_id%>">DELETE</a>
                </td>
              </tr>
              
              <%
                  }
              %>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    
  </body>
</html>