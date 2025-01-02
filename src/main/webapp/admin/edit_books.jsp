<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>

<%@page import="com.entity.BookDtls" %>
<%@page import="com.dao.BookDaoImpl" %>
<%@page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Edit Books</title>
<%@include file="/components/csscomponents.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>

<c:if test="${empty userObj}">
<c:redirect url="../login.jsp"/>
</c:if>


<div class="flex justify-center min-h-screen bg-gray-100">  
  <div class="container my-auto max-w-md border-2 border-gray-200 p-3 bg-white">
    <!-- header -->  
    <div class="text-center my-6">
      <h1 class="text-3xl font-semibold text-gray-700">Edit Books</h1>
    </div>
    <!-- sign-in -->
    <% int id = Integer.parseInt(request.getParameter("id"));
    BookDaoImpl dao = new BookDaoImpl(DBConnection.getConn());
    BookDtls b = dao.getBookById(id);
    %>


    <div class="m-6">
      <form class="mb-4" action="../edit_books" method="post">
        <div class="mb-6">
          <label for="text" class="block mb-2 text-sm text-center text-gray-600">Book Id</label>
          <input type="text" readonly name="id" id="bname"
           value="<%=b.getBookId()%>" class="w-full text-center px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none"  />
        </div>
        
        <div class="mb-6">
          <label for="text" class="block mb-2 text-sm text-gray-600">Book Name</label>
          <input type="text" name="bookName" id="bname" placeholder="your book name"
           value="<%=b.getBookName()%>" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none"  />
        </div>
        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="text" class="text-sm text-gray-600">Author Name</label>
          </div>
          <input type="text" name="author" id="aname" value="<%=b.getAuthor()%>" placeholder="Author name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="text" class="text-sm text-gray-600">Price</label>
          </div>
          <input type="text" name="price" value="<%=b.getPrice()%>" id="price" placeholder="Price" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none"  />
        </div>

           <div class="mb-6">
          <div class="flex justify-between mb-2">
         <label for="text" class="text-sm text-gray-600">Book Category</label>
          </div>
         <div class="relative">
         <select name="bookCategory" class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-state">

          <% if(b.getBookCategory().equals("New Book")){ %>
          <option selected>New Book</option>
          <option>Old Book</option>
          <option>None</option>
          <% } else if(b.getBookCategory().equals("Old Book")){ %>
          <option>New Book</option>
          <option>None</option>
          <option selected>Old Book</option>
          <% } else{%> 
          <option selected>None</option>
          <option>New Book</option>
          <option>Old Book</option>
          <% } %>
          
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
        </div>


         <div class="mb-6">
          <div class="flex justify-between mb-2">
         <label for="text" class="text-sm text-gray-600">Book Status</label>
          </div>
         <div class="relative">
         <select name="status" class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-state">

         <% if(b.getStatus().equals("Selling")){ %>
          <option selected>Selling</option>
          <option>Inactive</option>
          <option>Launched</option>
          <% }else if(b.getStatus().equals("Launched")){ %>
          <option selected>Launched</option>
          <option>Selling</option>
          <option>Inactive</option>
          <% }else{ %>
          <option selected>Inactive</option>
          <option>Selling</option>
          <option>Launched</option>
          <% } %>  
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
        </div>              

        <div class="mb-6">
          <button type="submit" class="w-full px-3 py-4 text-white bg-indigo-500 rounded-md hover:bg-indigo-600 focus:outline-none duration-100 ease-in-out">Sign in</button>
        </div>
      </form> 
    </div>
  </div>
</div>





</body>
</html>