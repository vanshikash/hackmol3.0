<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            System.out.print(email+" "+password);
            int c=0;
            PreparedStatement ps=co.prepareStatement("select * from users where email=? and password=?");
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                c++;
            }
            if(c==0)
            {
                %>
                <script type=text/javascript>
            alert('User Does not Exist');
        </script>
                <a href=""></a>
        <%
            }
            else
            {
                session.setAttribute("logged_in_email", email);
                %>    
             <!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="WELCOME TO NITJ">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Dashboard</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="home.css" media="screen">
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
    <meta property="og:title" content="home">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode"><header class="u-align-center u-clearfix u-grey-40 u-header u-header" id="sec-e748"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h2 class="u-text u-text-default u-text-white u-text-1">DASHBOARD</h2>
      </div></header>
    <section class="u-align-center u-clearfix u-section-1" id="sec-3504">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-align-center u-border-2 u-border-grey-75 u-container-style u-grey-10 u-hover-feature u-list-item u-radius-15 u-repeater-item u-shape-round u-list-item-1" data-href="../clubs/clubsPage.jsp" data-target="_blank">
              <div class="u-container-layout u-similar-container u-container-layout-1"><span class="u-border-2 u-border-palette-1-base u-file-icon u-icon u-icon-circle u-spacing-10 u-text-palette-1-base u-icon-1"><img src="images/4.png" alt=""></span>
                <h3 class="u-text u-text-default u-text-1">Club-O-Pedia</h3>
              </div>
            </div>
            <div class="u-align-center u-border-2 u-border-grey-75 u-container-style u-grey-10 u-hover-feature u-list-item u-radius-15 u-repeater-item u-shape-round u-list-item-2" data-href="../Find Your Mentor/findyourmentorPage.jsp" data-target="_blank">
              <div class="u-container-layout u-similar-container u-container-layout-2"><span class="u-border-2 u-border-palette-1-base u-icon u-icon-circle u-spacing-10 u-text-palette-1-base u-icon-2"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 52.966 52.966" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d3d"></use></svg><svg class="u-svg-content" viewBox="0 0 52.966 52.966" x="0px" y="0px" id="svg-1d3d" style="enable-background:new 0 0 52.966 52.966;"><path d="M51.704,51.273L36.845,35.82c3.79-3.801,6.138-9.041,6.138-14.82c0-11.58-9.42-21-21-21s-21,9.42-21,21s9.42,21,21,21
	c5.083,0,9.748-1.817,13.384-4.832l14.895,15.491c0.196,0.205,0.458,0.307,0.721,0.307c0.25,0,0.499-0.093,0.693-0.279
	C52.074,52.304,52.086,51.671,51.704,51.273z M21.983,40c-10.477,0-19-8.523-19-19s8.523-19,19-19s19,8.523,19,19
	S32.459,40,21.983,40z"></path></svg></span>
                <h3 class="u-text u-text-default u-text-2">Find Your Mentor</h3>
              </div>
            </div>
            <div class="u-align-center u-border-2 u-border-grey-75 u-container-style u-grey-10 u-hover-feature u-list-item u-radius-15 u-repeater-item u-shape-round u-list-item-3" data-href="../Student Forum/Student Forum Page.jsp" data-target="_blank">
              <div class="u-container-layout u-similar-container u-container-layout-3"><span class="u-border-2 u-border-palette-1-base u-file-icon u-icon u-icon-circle u-spacing-10 u-text-palette-1-base u-icon-3"><img src="images/5.png" alt=""></span>
                <h3 class="u-text u-text-default u-text-3">Student Forum</h3>
              </div>
            </div>
            <div class="u-align-center u-border-2 u-border-grey-75 u-container-style u-grey-10 u-hover-feature u-list-item u-radius-15 u-repeater-item u-shape-round u-list-item-4" data-href="../Sharing is Caring/Sharing is Caring.jsp" data-target="_blank">
              <div class="u-container-layout u-similar-container u-container-layout-4"><span class="u-border-2 u-border-palette-1-base u-file-icon u-icon u-icon-circle u-spacing-10 u-text-palette-1-base u-icon-4"><img src="images/6.png" alt=""></span>
                <h3 class="u-text u-text-default u-text-4">Sharing is caring</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
      
      
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-5b3e"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    
  </body>
</html>
                
                
                
        <%

            }
            
    
    
    
%>

