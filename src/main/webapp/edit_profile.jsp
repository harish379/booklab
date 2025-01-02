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
</head>
<body>
<%@ include file="/components/navbar.jsp" %>


<div class="flex justify-center min-h-screen bg-gray-100">  
  <div class="container my-auto max-w-md border-2 border-gray-200 p-3 bg-white">
    <!-- header -->  
    <div class="text-center my-6">
      <h1 class="text-3xl font-semibold text-gray-700">Edit Profile</h1>
      <p class="text-gray-500">Modify your Account</p>
       <c:if test="${not empty msg}">
      <h4 class="text-sm font-semibold text-red-500">${msg}</h4>
      <c:remove var="msg" scope="session" />
      </c:if>

      <c:if test="${not empty succMsg}">
      <h4 class="text-sm font-semibold text-green-500">${succMsg}</h4>
      <c:remove var="succMsg" scope="session" />
      </c:if>
      
    </div>
    <!-- sign-in -->
    <div class="m-6">
      <form class="mb-4  " action="update_profile" method="post">

      <input type="hidden" name="id" value="${userObj.id}">
        <div class="mb-6">
          <label for="text" class="block mb-2 text-sm text-gray-600">Name</label>
          <input type="text" value="${userObj.name}" name="name" id="name" placeholder="Your email address" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>
        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="email" class="text-sm text-gray-600 dark:text-gray-400">Email </label>
          </div>
          <input type="email" name="email" id="email" placeholder="Your email" value="${userObj.email}" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

           <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="number" class="text-sm text-gray-600 dark:text-gray-400">Phone no </label>
          </div>
          <input type="number" name="pno" id="phone" placeholder="Your number" value="${userObj.phno}" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

              <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="password" class="text-sm text-gray-600 dark:text-gray-400">Password </label>
          </div>
          <input type="password" name="password" id="password" placeholder="Your password" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
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