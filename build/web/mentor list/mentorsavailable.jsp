<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>

<%
    String year=request.getParameter("year");
    String skill=request.getParameter("skill");
    
    PreparedStatement ps=co.prepareStatement("select * from users where year=? and skill=?");
    ps.setString(1,year);
    ps.setString(2,skill);
    ResultSet rs=ps.executeQuery();
    
%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="WELCOME TO NITJ">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>mentor-list</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="mentor-list.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.5.4, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="mentor-list">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode"><header class="u-align-center u-clearfix u-grey-40 u-header u-header" id="sec-e748"><div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-align-center u-text u-text-default u-text-white u-text-1">WELCOME TO NITJ</h2>
      </div></header>
    <section class="u-clearfix u-section-1" id="sec-1818">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="20%">
              <col width="20%">
              <col width="20%">
              <col width="20%">
              <col width="20%">
            </colgroup>
            <thead class="u-align-center u-grey-30 u-table-header u-table-header-1">
              <tr style="height: 46px;">
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">
                  <span style="font-size: 1.25rem; font-weight: 700;">NAME<span style="font-weight: 700;"></span>
                  </span>
                </th>
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">
                  <span style="font-weight: 700; font-size: 1.25rem;">E-MAIL</span>
                </th>
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">
                  <span style="font-size: 1.25rem; font-weight: 700;">YEAR</span>
                </th>
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">
                  <span style="font-size: 1.25rem; font-weight: 700;">BRANCH</span>
                </th>
                <th class="u-border-1 u-border-grey-dark-1 u-table-cell">
                  <span style="font-size: 1.25rem; font-weight: 700;">SKILL</span>
                </th>
              </tr>
            </thead>
            <tbody class="u-align-center u-table-body">
              <%
                  while(rs.next())
                  {
                        String name=rs.getString(3);
                        String email=rs.getString(1);
                        String branch=rs.getString(4);
                        year=rs.getString(5);
                        skill=rs.getString(6);
                        
                        
              %>  
                <tr style="height: 68px;">
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=name%></td>
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=email%></td>
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=year%></td>
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=branch%></td>
                <td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=skill%></td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-5b3e"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
        <span>Website Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="" target="_blank">
        <span>Website Builder Software</span>
      </a>. 
    </section>
  </body>
</html>