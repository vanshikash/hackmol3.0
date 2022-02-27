<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>
<%
    String product_name=request.getParameter("product_name");
    String email=(String)session.getAttribute("logged_in_email");
    PreparedStatement ps=co.prepareStatement("insert into shared_stuff (email,product_name) values(?,?)");
    ps.setString(1,email);
    ps.setString(2,product_name);
    ps.execute();
    
    String product_id="";
    ps=co.prepareStatement("select max(product_id) from shared_stuff");
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        product_id=rs.getString(1);
    }
    session.setAttribute("product_id", product_id);
    //System.out.println(product_id);
%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Share Your Stuff">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Add Photo</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="addPhoto.css" media="screen">
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
    <meta property="og:title" content="addPhoto">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body"><header class="u-clearfix u-grey-40 u-header u-header" id="sec-a415"><div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h3 class="u-align-center u-headline u-text u-text-1">
          <a href="/">ADD PHOTO&nbsp;</a>
        </h3>
      </div></header>
    <section class="u-clearfix u-section-1" id="sec-1f66">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h2 class="u-text u-text-default u-text-1">Share Your Stuff</h2>
        <div class="u-form u-form-1">
          <form action="finalAdd.jsp" enctype="multipart/form-data" method="POST" class="u-clearfix u-form-custom-backend u-form-spacing-30 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 25px;" redirect="true">
            <div class="u-form-group u-form-name">
              <label for="name-221b" class="u-form-control-hidden u-label"></label>
              <input type="file" placeholder="Upload Stuff" id="name-221b" name="product_photo" class="u-border-1 u-border-grey-30 u-grey-10 u-input u-input-rectangle u-radius-17 u-input-1" required="">
            </div>
            <div class="u-align-center u-form-group u-form-submit">
              <a href="finalAdd.jsp" class="u-border-none u-btn u-btn-round u-btn-submit u-button-style u-hover-palette-2-base u-radius-17 u-btn-1">Upload<br>
              </a>
              <input type="submit" value="submit" class="u-form-control-hidden">
            </div>
            
            <input type="hidden" value="" name="recaptchaResponse">
          </form>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-6cba"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    
  </body>
</html>