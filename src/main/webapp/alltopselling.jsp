<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/csscomponents.jsp"%>
</head>
<body>
 <%@ include file="components/navbar.jsp" %>

 <!-- New Arrivals -->
  <div class="rounded-md flex flex-col items-center justify-center py-4">

  <div class="flex flex-row items-center justify-center py-4 gap-3">
  <h1 class="text-4xl font-bold">Top Selling</h1>
          </div>


                   <%
                  BookDaoImpl dao = new BookDaoImpl(DBConnection.getConn());
                   List<BookDtls> ls = dao.getalltopSellingBooks(); %>                 
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 px-10 py-2 gap-3">
                  <% for(BookDtls b:ls){
                     %>          
    <div class="bg-white shadow-md rounded-md max-w-sm bg-[#252422] dark:border-gray-700">
        <a href="#">
          <img
            class="rounded-t-lg p-8 size-[425px]"
            src="books/<%=b.getPhotoName()%>"
            alt="product image"
          />
        </a>
        <div class="px-5 pb-5">
          <a href="#">
            <h3 class="text-gray-900 font-semibold text-xl tracking-tight dark:text-white">
             <%=b.getBookName()%>
            </h3>
          </a>
          <p class="text-gray-500 font-medium text-sm tracking-tight dark:text-white pb-2">
            <%=b.getAuthor()%>
          </p>
          <div class="flex items-center justify-between">
            <span class="text-3xl font-bold text-gray-900 dark:text-white"
              >Rs.<%=b.getPrice()%></span>


             <a
              href="#"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Details</a>  
            <a
              href="#"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Add to cart</a>
          </div>
        </div>
      </div>
        <%
    }
    %>

    </div>
  </div>

  <!-- End of new Arrivals -->

</body>
</html>