<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.annotation.MultipartConfig.*" %>
<%@page import="java.util.*" %>
<%@page import="org.springframework.web.multipart.MultipartHttpServletRequest"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
@MultipartConfig(maxFileSize = 163177215)

<%
    Connection co;
    
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackmol3","root",null);
        

%>
<%
    
    String product_id = (String)session.getAttribute("product_id");
    
    String filesName="";
    if(ServletFileUpload.isMultipartContent(request))
		{
			
			try
			{
                            
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				int i=0;
                                for(FileItem item : multiparts)
				{
                                    i++;
					if(!item.isFormField())
					{
                                                
						String name = new File(item.getName()).getName();
						item.write(new File("D://Coding Material//WEB-DEV//hackmol_project//web//addStuff//images" + File.separator + name));
                                                filesName = name;
                                               //"appservers//apache-tomcat-9x//webapps//carImages"
                                        }
				}
				System.out.print("Done" + filesName + " "+ product_id);
			}catch(Exception ex)
			{
				System.out.print("Add Product : "+ex);
			}
		}
		else
		{
			System.out.print("Not Done");
		}

                PreparedStatement ps=co.prepareStatement("UPDATE shared_stuff SET `image` = ? WHERE `product_id` =?");
                ps.setString(1, filesName);
                ps.setString(2, product_id);
                ps.executeUpdate();
%>
<script>
    if(confirm('Product Uploaded'))
    {
        window.location.href="../Sharing is Caring/Sharing is Caring.jsp"
    }
</script>
