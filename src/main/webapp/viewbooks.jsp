<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.dao.BookDao"%>
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

<% int bid = Integer.parseInt(request.getParameter("bid"));
BookDao dao = new BookDaoImpl(DBConnection.getConn());
BookDtls b = dao.getBookById(bid);

%>


<div class="bg-[#F5F1ED] min-h-screen">
  <div class="container mx-auto px-4 py-8">
    <div class="flex flex-wrap -mx-4">
      <!-- Product Images -->
      <div class="w-full md:w-1/2 px-4 mb-8 ">
        <img
            class="rounded-t-lg p-8 size-[450px]"
            src="books/<%=b.getPhotoName()%>"
            alt="product image"
          />
      </div>

      <!-- Product Details -->
      <div class="w-full md:w-1/2 px-4 flex flex-col justify-center items-center">
        <h2 class="text-3xl font-bold mb-2"><%=b.getBookName()%></h2>
        <p class="text-gray-600 mb-4"><%=b.getAuthor()%></p>
        <div class="mb-4">
          <span class="text-2xl font-bold mr-2">Rs.<%=b.getPrice()%></span>
        </div>

        <p class="text-gray-600 mb-2">Contact Seller</p>
        <p class="text-gray-600 mb-4"><%=b.getEmail()%></p>
        

        <div class="mb-4">
        <div class="flex flex-row gap-2">
         <svg class="w-[32px] h-[32px] text-gray-800" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M13 7h6l2 4m-8-4v8m0-8V6a1 1 0 0 0-1-1H4a1 1 0 0 0-1 1v9h2m8 0H9m4 0h2m4 0h2v-4m0 0h-5m3.5 5.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0Zm-10 0a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0Z"/>
</svg>
<p>Free Delivery</p>
</div>

        </div>

        <div class="mb-4">
        <div class="flex flex-row gap-2">

        <svg class="w-[32px] h-[32px] text-gray-800" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
  <path fill-rule="evenodd" d="M7 6a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2h-2v-4a3 3 0 0 0-3-3H7V6Z" clip-rule="evenodd"/>
  <path fill-rule="evenodd" d="M2 11a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-7Zm7.5 1a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5Z" clip-rule="evenodd"/>
  <path d="M10.5 14.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"/>
</svg>
<p>Cash On Delivery</p>
        </div>
        </div>

         <div class="mb-4">
        <div class="flex flex-row gap-2">

        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-7">
  <path stroke-linecap="round" stroke-linejoin="round" d="M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0 3.181 3.183a8.25 8.25 0 0 0 13.803-3.7M4.031 9.865a8.25 8.25 0 0 1 13.803-3.7l3.181 3.182m0-4.991v4.99" />
</svg>

<p>10-days free Replacement</p>
        </div>
        </div>

       
        <div class="mb-6">
        <div class="flex space-x-4 mb-6">
          <button
                        class="bg-[#252422] flex gap-2 items-center text-white px-6 py-2 rounded-md hover:bg-[#403d39] focus:outline-none">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                        </svg>
                        Add to Cart
                    </button>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>







 

</body>
</html>