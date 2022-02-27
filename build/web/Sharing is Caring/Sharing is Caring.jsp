<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>

<%
    
    PreparedStatement ps=co.prepareStatement("select * from shared_stuff");
    ResultSet rs=ps.executeQuery();
    
%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="SHARING IS CARING">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Sharing is caring</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="sharing-is-caring.css" media="screen">
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
    <meta property="og:title" content="sharing-is-caring">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode"><header class="u-align-center u-clearfix u-grey-40 u-header u-header" id="sec-e748"><div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-align-center u-text u-text-default u-text-white u-text-1">SHARING IS CARING</h2>
      </div></header>
    <section class="u-align-center u-clearfix u-section-1" id="sec-6cc3">
      <div class="u-clearfix u-sheet u-sheet-1">
          <a href="../addStuff/addSharingStuff.jsp" class="u-border-none u-btn u-btn-round u-button-style u-hover-grey-80 u-radius-17 u-btn-1" target="_blank">UPlOAD PRODUCT</a>
          <a href="../removeStuff/removeStuff.jsp" class="u-border-none u-btn u-btn-round u-button-style u-hover-grey-80 u-palette-2-base u-radius-17 u-btn-2" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="" target="_blank">REMOVE PRODUCT</a>
        <h2 class="u-align-center u-text u-text-default u-text-1">Products Available:</h2>
        
        <%
            while(rs.next())
            {
                String email=rs.getString(2);
                String product_name=rs.getString(3);
                String image=rs.getString(4);
                
                PreparedStatement pst=co.prepareStatement("select * from users where email=?");
                pst.setString(1,email);
                ResultSet rst=pst.executeQuery();
                while(rst.next())
                {
                    String name=rst.getString(3);
                    String branch=rst.getString(4);
                    String year=rst.getString(5);
                    
            
        %>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-border-2 u-border-black u-container-style u-custom-item u-list-item u-palette-5-light-3 u-radius-17 u-repeater-item u-shape-round" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                  <img class="u-align-left u-image u-image-round u-preserve-proportions u-radius-17 u-image-1" src="../addStuff/images/<%=image%>" alt="">
                <div class="u-align-left u-container-style u-group u-group-1">
                  <div class="u-container-layout">
                      <h3 class="u-custom-item u-text u-text-2"><%=product_name%></h3>
                    <p class="u-custom-item u-text u-text-default u-text-3">Name: <%=name%></p>
                    <p class="u-custom-item u-text u-text-default u-text-4">E-mail: <%=email%></p>
                    <p class="u-custom-item u-text u-text-default u-text-5">Branch: <%=branch%></p>
                    <p class="u-custom-item u-text u-text-6">Year: <%=year%></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%
                }

            }
        %>
        
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-5b3e"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    
  </body>
</html>