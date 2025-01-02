<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/components/csscomponents.jsp"%>
</head>
<body>
<%@ include file="/components/navbar.jsp" %>


 <div class="text-center my-6">
      <h1 class="text-3xl font-semibold text-gray-700">Sell Old Books</h1>
    </div>

    <c:if test="${empty userObj}">
    <C:redirect url="login.jsp"></C:redirect>
    </c:if>

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



<div class="m-6">
      <form class="mb-4" action="add_old_books" method="post" enctype="multipart/form-data">

      <input type="hidden" name="user" value="${userObj.email }">
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
            <label  for="user_avatar" class="text-sm text-gray-600 dark:text-gray-400">Book Image</label>
          </div>
          <input class="block w-full text-sm bg-gray-200 border border-gray-200 text-gray-700 rounded-md cursor-pointer focus:outline-none" aria-describedby="user_book_help" id="book_image" name="bimg" type="file">
        </div>             

        <div class="mb-6">
          <button type="submit" class="w-full px-3 py-4 text-white bg-indigo-500 rounded-md hover:bg-indigo-600 focus:outline-none duration-100 ease-in-out">Sell Book</button>
        </div>
      </form> 
    </div>
  </div>
</div>


</body>
</html>