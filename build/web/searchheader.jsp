<%-- 
    Document   : searchheader
    Created on : Jul 10, 2015, 6:33:32 PM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Header</title>
    </head>
    <body>
        <!-- Search -->
      <div class="box search">
        <h2>Search by <span></span></h2>
        <div class="box-content">
          <form action="result.jsp" method="post" id="searchform">
            <label>Keyword</label>
            <input type="text" class="field" name="searchKeyword"/>
            
            <label>Category</label>
            <select class="field" name="phoneCategory" form="searchform">
                <option value="default">--Select Category--</option>
                <option value="ancient">Ancient Phones</option>
                <option value="multimedia">Multi Media</option>
                <option value="smartphone">Smart Phones</option>
                <option value="tablet">Tabs</option>
                <option value="smartwatch">Smart Watches</option>
            </select>
            
            <input type="submit" class="search-submit" value="Search" />
            <p> 
              <a href="#" class="bul">Contact Customer Support</a> </p>
          </form>
        </div>
      </div>
      <!-- End Search -->

    </body>
</html>


      