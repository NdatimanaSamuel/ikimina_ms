package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class UpdatePendingRequest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <title>Ikimina Ms</title>\n");
      out.write("         <style>\n");
      out.write("             body {\n");
      out.write("    margin: 0;\n");
      out.write("    padding: 0;\n");
      out.write("    font-family: Arial, sans-serif;\n");
      out.write("    display: flex;\n");
      out.write("    flex-direction: column;\n");
      out.write("    min-height: 100vh; /* Ensure the page takes at least the full viewport height */\n");
      out.write("}\n");
      out.write("ul {\n");
      out.write("  list-style-type: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("header {\n");
      out.write("    background-color: #333;\n");
      out.write("    color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".header-text {\n");
      out.write("    background-color: white;\n");
      out.write("    color: #333;\n");
      out.write("    padding: 10px 20px;\n");
      out.write("    font-size: 18px;\n");
      out.write("    font-weight: bold;\n");
      out.write("    display: flex;\n");
      out.write("    align-items: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".logo {\n");
      out.write("    display: flex;\n");
      out.write("    align-items: center;\n");
      out.write("    margin-left: 10px;\n");
      out.write("    margin-bottom: 25px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".navbar {\n");
      out.write("    display: flex;\n");
      out.write("    justify-content: space-between;\n");
      out.write("    align-items: center;\n");
      out.write("    background-color: #333;\n");
      out.write("    color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".logo img {\n");
      out.write("    max-width: 90px;\n");
      out.write("    margin-right: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dashboard {\n");
      out.write("    display: flex;\n");
      out.write("    flex: 1; /* Expand the dashboard to take remaining vertical space */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".sidebar {\n");
      out.write("    background-color: #222;\n");
      out.write("    color: white;\n");
      out.write("    width: 200px;\n");
      out.write("    padding: 20px;\n");
      out.write("    display: flex;\n");
      out.write("    flex-direction: column;\n");
      out.write("}\n");
      out.write(".menu {\n");
      out.write("    list-style: none;\n");
      out.write("    padding: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".menu li a {\n");
      out.write("    text-decoration: none;\n");
      out.write("    color: white;\n");
      out.write("    display: block;\n");
      out.write("    padding: 10px 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".menu li.active a {\n");
      out.write("    background-color: #8080ff;\n");
      out.write("    color: white;\n");
      out.write("    text-decoration: none;\n");
      out.write("    padding: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".menu li.active a:hover {\n");
      out.write("    background-color:#b3b3ff; /* Change the color on hover */\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".menu li a i {\n");
      out.write("    margin-right: 15px; /* Add margin between icon and text */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".submenu {\n");
      out.write("    margin-left: 20px;\n");
      out.write("    display: none; /* Hide submenu by default */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".menu li:hover .submenu {\n");
      out.write("    display: block; /* Display submenu on parent hover */\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".content {\n");
      out.write("    flex: 1;\n");
      out.write("    padding: 20px;\n");
      out.write("    display: flex;\n");
      out.write("    flex-wrap: wrap;\n");
      out.write("    gap: 20px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".card {\n");
      out.write("    margin-bottom: 230px;\n");
      out.write("    background-color: #f4f4f4;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    padding: 10px;\n");
      out.write("    width: 100px !important; /* Set a fixed width for the cards */\n");
      out.write("    height: 100px; /* Set a fixed height for the cards */\n");
      out.write("    flex: 1 1 calc(33.33% - 20px); /* Distribute cards in a row with proper spacing */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".card-info {\n");
      out.write("    font-size: 14px;\n");
      out.write("    color: #666;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".library-name {\n");
      out.write("    text-align: center;\n");
      out.write("    margin-left: 15%;\n");
      out.write("}\n");
      out.write(".card h3 i{\n");
      out.write("    margin-left: 26px;\n");
      out.write("  \n");
      out.write("}\n");
      out.write(".card p{\n");
      out.write("    align-items: center;\n");
      out.write("    margin-left: 20%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("footer {\n");
      out.write("    background-color: #333;\n");
      out.write("    color: white;\n");
      out.write("    text-align: center;\n");
      out.write("    padding: 10px 0;\n");
      out.write("    margin-top: auto; /* Push the footer to the bottom */\n");
      out.write("}\n");
      out.write("\n");
      out.write("/*add book form*/\n");
      out.write("\n");
      out.write("/* AddBookFormStyles.css */\n");
      out.write("\n");
      out.write(".add-book-form {\n");
      out.write("    padding: 20px;\n");
      out.write("    background-color: #f4f4f4;\n");
      out.write("    border-radius: 5px;\n");
      out.write("   margin-left: 10%;\n");
      out.write("    width: 800px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".add-book-form h2 {\n");
      out.write("    margin-bottom: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".add-book-form label {\n");
      out.write("    display: block;\n");
      out.write("    margin-bottom: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".add-book-form input,\n");
      out.write(".add-book-form select {\n");
      out.write("    width: 90%;\n");
      out.write("    padding: 10px;\n");
      out.write("    margin-bottom: 10px;\n");
      out.write("    border: 1px solid #ccc;\n");
      out.write("    border-radius: 3px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".add-book-form button {\n");
      out.write("    background-color: #333;\n");
      out.write("    color: white;\n");
      out.write("    padding: 10px 20px;\n");
      out.write("    border: none;\n");
      out.write("    border-radius: 3px;\n");
      out.write("    cursor: pointer;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".add-book-form button:hover {\n");
      out.write("    background-color: #444;\n");
      out.write("}\n");
      out.write("\n");
      out.write("         </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("  <header>\n");
      out.write("    <nav class=\"navbar\">\n");
      out.write("       \n");
      out.write("    </nav>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <div class=\"dashboard\">\n");
      out.write("        <nav class=\"sidebar\">\n");
      out.write("\n");
      out.write("            <ul class=\"menu\">\n");
      out.write("                 \n");
      out.write("                 <div class=\"logo\">\n");
      out.write("\n");
      out.write("                 <img src=\"../images/logogo.png\" alt=\"\"/>\n");
      out.write("                </div>\n");
      out.write("      \n");
      out.write("                 <li ><a href=\"Admin/Home.jsp\"><i class=\"fas fa-tachometer-alt\"></i> Dashboard</a></li>\n");
      out.write("   \n");
      out.write("                 <li class=\"active\"><a href=\"ViewPendingUserRequestServlet\"><i class=\"fas fa-eye\"></i> View Pending User</a></li>\n");
      out.write("                 <li><a href=\"addBooks.html\"><i class=\"fas fa-eye\"></i> Pending Credit</a></li>\n");
      out.write("                 <li><a href=\"addBooks.html\"><i class=\"fas fa-eye\"></i> Lists of Credit</a></li>\n");
      out.write("                 <li><a href=\"returnBooks.html\"><i class=\"fa-solid fa-right-left\"></i>Report All Users</a></li>\n");
      out.write("                 <li><a href=\"returnBooks.html\"><i class=\"fa-solid fa-right-left\"></i>Report All Savings</a></li>\n");
      out.write("              <li><a href=\"logout\"><i class=\"fas fa-sign-out-alt\"></i> Logout</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <main class=\"content\">\n");
      out.write("\n");
      out.write("            <div class=\"library-name\">\n");
      out.write("        <h1>Kigali Independent University (ULK) Library Gisenyi</h1>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            <!-- Form for submitting new books -->\n");
      out.write("            <div class=\"add-book-form\">\n");
      out.write("                <h2>Manage Request</h2>\n");
      out.write("                <form>\n");
      out.write("                    <label for=\"title\">Names:</label>\n");
      out.write("                    <input type=\"text\" id=\"title\" name=\"name\" required>\n");
      out.write("                    <label for=\"status\">Status:</label>\n");
      out.write("                    <select id=\"status\" name=\"status\">\n");
      out.write("                        <option value=\"approve\">approve</option>\n");
      out.write("                        <option value=\"cancel\">cancel</option>\n");
      out.write("                    </select>\n");
      out.write("\n");
      out.write("                    <button type=\"submit\">Add Book</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </main>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("     <footer>\n");
      out.write("        <p>&copy; 2024 Ikimina Ltd. All rights reserved.</p>\n");
      out.write("    </footer>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
