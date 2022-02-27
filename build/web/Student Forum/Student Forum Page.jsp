<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
            

%>

<%
    PreparedStatement ps=co.prepareStatement("select * from student_forum order by no_of_support DESC");
    ResultSet rs=ps.executeQuery();
    
%>

<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="?FIND YOUR MENTOR">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Student forum</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Student-forum.css" media="screen">
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
    <meta property="og:title" content="Student forum">
    <meta property="og:type" content="website">
  </head>
  <body data-home-page="Student-forum.html" data-home-page-title="Student forum" class="u-body u-xl-mode"><header class="u-clearfix u-grey-40 u-header u-header" id="sec-b1ea"><div class="u-align-left u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-default u-text-1">STUDENT FORUM</h2>
      </div></header>
    <section class="u-align-center u-clearfix u-section-1" id="sec-73f6">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-2 u-border-grey-75 u-form u-grey-10 u-radius-17 u-form-1">
            <form action="addReview.jsp" method="POST" class="u-clearfix u-form-custom-backend u-form-spacing-25 u-form-vertical u-inner-form" style="padding: 15px;" source="custom" name="form" redirect="true">
            <div class="u-form-group u-form-message u-label-none u-form-group-1">
              <label for="name-6797" class="u-label u-label-1">Name</label>
              <textarea placeholder="Write your review..." id="name-6797" name="review" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-1" required="required"></textarea>
            </div>
            <div class="u-align-left u-form-group u-form-submit u-label-none u-form-group-2">
              <input type="submit" value="submit" class="u-form-control-hidden">
              <a href="" class="u-border-none u-btn u-btn-round u-btn-submit u-button-style u-hover-palette-2-base u-palette-1-base u-radius-17 u-text-body-alt-color u-text-hover-white u-btn-1"><span class="u-file-icon u-icon u-text-white u-icon-1"><img src="images/4.png" alt=""></span>&nbsp;ADD YOUR REVIEW
              </a>
            </div>
            
            <input type="hidden" value="" name="recaptchaResponse">
          </form>
        </div>
          <a href="removeReview/removeReview.jsp" class="u-border-none u-btn u-btn-round u-button-style u-hover-palette-1-base u-palette-2-base u-radius-17 u-text-body-alt-color u-text-hover-white u-btn-2"><span class="u-file-icon u-icon u-text-white u-icon-2"><img src="images/5.png" alt=""></span>&nbsp;REMOVE YOUR REVIEW
        </a>
        
          <%
              while(rs.next())
              {
                  String review_id=rs.getString(1);
                  String review=rs.getString(3);
                  String no_of_support=rs.getString(4);
                  String supported_by=rs.getString(5);
                  //StringTokenizer st=new StringTokenizer(supported_by,"/");
                  String email=rs.getString(2);
                  String name="";
                  PreparedStatement pst=co.prepareStatement("select * from users where email=?");
                  pst.setString(1,email);
                  ResultSet rst=pst.executeQuery();
                  while(rst.next())
                  {
                      name=rst.getString(3);
                  }
              
          %>
          <div class="u-border-2 u-border-grey-80 u-container-style u-group u-radius-17 u-shape-round u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <h4 class="u-text u-text-1"><%=review%><br>
            </h4>
            <p class="u-text u-text-2">Posted by <%=name%></p>
            <a href="showSupport.jsp?review_id=<%=review_id%>" class="u-border-2 u-border-custom-color-1 u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-17 u-text-hover-white u-btn-3"><span class="u-file-icon u-icon u-icon-3"><img src="images/20577481.png" alt=""></span>&nbsp;SUPPORT&nbsp;(<%=no_of_support%>) 
            </a>
          </div>
        </div>
        <%
            }
        %>
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-252d"><div class="u-align-left u-clearfix u-sheet u-sheet-1"></div></footer>
    
  </body>
</html>