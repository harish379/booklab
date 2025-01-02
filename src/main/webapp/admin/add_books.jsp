<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Add Books</title>
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
      <h1 class="text-3xl font-semibold text-gray-700">Add Books</h1>
    </div>

    <div class="text-center my-6">
    <c:if test="${not empty succMsg }">
    <p class="text-center text-green-500">${succMsg }</p>
    <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failedMsg }">
    <p class="text-center text-red-500">${failedMsg }</p>
    <c:remove var="failedMsg" scope="session"/>
    </c:if>

    </div>
    <!-- sign-in -->
    <div class="m-6">
      <form class="mb-4" action="../add_books" method="post" enctype="multipart/form-data">
        <div class="mb-6">
          <label for="text" class="block mb-2 text-sm text-gray-600">Book Name</label>
          <input type="text" name="bookName" id="bname" placeholder="your book name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>
        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="text" class="text-sm text-gray-600 dark:text-gray-400">Author Name</label>
          </div>
          <input type="text" name="author" id="aname" placeholder="Author name" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="text" class="text-sm text-gray-600 dark:text-gray-400">Price</label>
          </div>
          <input type="text" name="price" id="price" placeholder="Price" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

           <div class="mb-6">
          <div class="flex justify-between mb-2">
         <label for="text" class="text-sm text-gray-600 dark:text-gray-400">Book Category</label>
          </div>
         <div class="relative">
         <select name="bookCategory" class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-state">
          <option>New Book</option>
          <option>Old Book</option>
          <option>None</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
        </div>


         <div class="mb-6">
          <div class="flex justify-between mb-2">
         <label for="text" class="text-sm text-gray-600 dark:text-gray-400">Book Status</label>
          </div>
         <div class="relative">
         <select name="status" class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-state">
          <option>Selling</option>
          <option>Sold Out</option>
          <option>Launched</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
        </div>

         <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label  for="user_avatar" class="text-sm text-gray-600 dark:text-gray-400">Book Image</label>
          </div>
          <input class="block w-full text-sm bg-gray-200 border border-gray-200 text-gray-700 rounded-md cursor-pointer focus:outline-none" aria-describedby="user_book_help" id="book_image" name="bimg" type="file">
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