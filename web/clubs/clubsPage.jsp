<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    PreparedStatement ps=co.prepareStatement("select * from clubs");
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
    <title>Clubs</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="clubs.css" media="screen">
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
    <meta property="og:title" content="clubs">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode"><header class="u-align-center u-clearfix u-grey-40 u-header u-header" id="sec-e748"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h2 class="u-text u-text-default u-text-white u-text-1">CLUB-O-PEDIA</h2>
      </div></header>
    
      
      <section class="u-clearfix u-white u-section-1" id="sec-18b0">
      
          
          <div class="u-clearfix u-sheet u-sheet-1">
        
              <%
                  while(rs.next())
                  {
                        String clubName=rs.getString(1);
                        String desc=rs.getString(2);
                        String clubHead=rs.getString(3);
                        String induction=rs.getString(4);
                        String image=rs.getString(5);
                        
                      
              %>
              
              <div class="u-border-2 u-border-black u-container-style u-expanded-width u-grey-5 u-group u-radius-15 u-shape-round u-group-1">
          <div class="u-container-layout u-container-layout-1">
              <h3 class="u-align-center u-text u-text-1"><%=clubName%><span style="font-weight: 700;"></span>
            </h3>
            <img class="u-align-left u-image u-image-round u-preserve-proportions u-radius-16 u-image-1" src="images/<%=image%>" alt="" data-image-width="150" data-image-height="75">
            <p class="u-align-left u-text u-text-2"><%=desc%><br>
              <br><%=induction%><br>
              <br><%=clubHead%><br>
              <br>
            </p>
          </div>
            
            
        </div>
              <%
                  }
                  rs.close();
              %>
              
      </div>
          
          
    </section>
      
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-5b3e"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    
  </body>
</html>