<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ page import="com.db.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.dao.BookDaoImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!-- Hero Image Section -->
<div class="bg-[url('images/cover.png')] bg-cover bg-center min-h-screen flex items-center justify-center">
    <div class="text-center">
      <h1 class="mb-4 text-4xl font-extrabold tracking-tight leading-none text-[#252422] md:text-5xl lg:text-6xl">Feed your mind, fuel your heart.</h1>
            <p class="px-0 mb-8 text-lg text-[#252422] md:text-xl lg:px-24">
               Explore a world of knowledge and adventure with our vast collection of books.
            </p>
    </div>
  </div>    

  <% User u=(User)session.getAttribute("userObj"); %>
  
  <!-- New Arrivals -->
  <div class="rounded-md flex flex-col items-center justify-center py-4">

  <div class="flex flex-row items-center justify-center py-4 gap-3">
  <h1 class="text-4xl font-bold">New Arrivals</h1>

   <a
              href="allnewbooks.jsp"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">View All</a>
          </div>


                   <%
                  BookDaoImpl dao = new BookDaoImpl(DBConnection.getConn());
                   List<BookDtls> ls = dao.getBookByNew(); %>                 
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
              href="viewbooks.jsp?bid=<%=b.getBookId()%>" class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Details</a>


              <% if(u==null){ %>
              <a href="login.jsp" class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Add to cart</a>
              <%
              }
              else{
              %>
            <a
              href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Add to cart</a>
              <%
              }
              %>
            
          </div>
        </div>
      </div>
        <%
    }
    %>

    </div>
  </div>
  <!-- End of new Arrivals -->


  <!-- New Arrivals -->
  <div class="rounded-md flex flex-col items-center justify-center py-4">
   <div class="flex flex-row items-center justify-center py-4 gap-3">
  <h1 class="text-4xl font-bold">Top Selling</h1>

   <a
              href="alltopselling.jsp"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">View All</a>
          </div>


                   <%
                  BookDaoImpl dao1 = new BookDaoImpl(DBConnection.getConn());
                   List<BookDtls> ls1 = dao1.getBookByTop(); %>                 
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 px-10 py-2 gap-3">
                  <% for(BookDtls b:ls1){
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
              href="viewbooks.jsp?bid=<%=b.getBookId()%>" class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Details</a>
              
            <% if(u==null){ %>
              <a href="login.jsp" class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Add to cart</a>
              <%
              }
              else{
              %>
            <a
              href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Add to cart</a>
              <%
              }
              %>
          </div>
        </div>
      </div>
        <%
    }
    %>

    </div>
  </div>



   <!-- End of new Arrivals -->


  <!-- New Arrivals -->
  <div class="rounded-md flex flex-col items-center justify-center py-4">
   <div class="flex flex-row items-center justify-center py-4 gap-3">
  <h1 class="text-4xl font-bold">Old Books</h1>

   <a
              href="alloldbooks.jsp"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">View All</a>
          </div>


                   <%
                  BookDaoImpl dao2 = new BookDaoImpl(DBConnection.getConn());
                   List<BookDtls> ls2 = dao2.getBookByOutOfStock(); %>                 
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 px-10 py-2 gap-3">
                  <% for(BookDtls b:ls2){
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
              href="#"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Out of Stock</a>
          </div>
        </div>
      </div>
        <%
    }
    %>

    </div>
  </div>

  <!-- End of new Arrivals -->
