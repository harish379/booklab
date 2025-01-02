<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>User Login</title>
    <%@include file="/components/csscomponents.jsp"%>
  </head>

<body>
  <%@ include file="/components/navbar.jsp" %>


  <!-- component -->
<div class="flex justify-center min-h-screen bg-gray-100">  
  <div class="container sm:mt-40 mt-16 my-auto max-w-md border-2 border-gray-200 p-3 bg-white">
    <!-- header -->  
    <div class="text-center my-6">
      <h1 class="text-3xl font-semibold text-gray-700">Login</h1>


      <c:if test="${not empty msg}">
      <h4 class="text-sm font-semibold text-red-500">${msg}</h4>
      <c:remove var="msg" scope="session" />
      </c:if>

      <c:if test="${not empty succMsg}">
      <h4 class="text-sm font-semibold text-green-500">${succMsg}</h4>
      <c:remove var="succMsg" scope="session" />
      </c:if>
      





      <p class="text-gray-500">Login to access your account</p>
    </div>
    <!-- sign-in -->
    <div class="m-6">
      <form class="mb-4" action="login" method="post">
        <div class="mb-6">
          <label for="email" class="block mb-2 text-sm text-gray-600">Email Address</label>
          <input type="email" name="email" id="email" placeholder="Your email address" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>
        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="password" class="text-sm text-gray-600 dark:text-gray-400">Password</label>
          </div>
          <input type="password" name="password" id="password" placeholder="Your password" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>
        <div class="mb-6">
          <button type="submit" class="w-full px-3 py-4 text-white bg-[#252422] rounded-md hover:bg-[#53504c] focus:outline-none duration-100 ease-in-out">Sign in</button>
        </div>
        <p class="text-sm text-center text-gray-400">
          Don&#x27;t have an account yet? 
          <a href="register.jsp" class="font-semibold text-[#252422] focus:text-indigo-600 focus:outline-none focus:underline">Sign up</a>.
        </p>
      </form> 
    </div>
  </div>
</div>


  



  </body>
</html>