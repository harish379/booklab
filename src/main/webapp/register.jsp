<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>User Registration</title>
    <%@include file="/components/csscomponents.jsp"%>
  </head>

<body>
  <%@ include file="/components/navbar.jsp" %>
  <div class="flex justify-center min-h-screen bg-gray-100">  
  <div class="container my-auto max-w-md border-2 border-gray-200 p-3 bg-white">
    <!-- header -->  
    <div class="text-center my-6">
      <h1 class="text-3xl font-semibold text-gray-700">Sign Up</h1>
      <p class="text-gray-500">Login to access your account</p>
    </div>
    <!-- sign-in -->
    <div class="m-6">
      <form class="mb-4  " action="register" method="post">
        <div class="mb-6">
          <label for="text" class="block mb-2 text-sm text-gray-600">Name</label>
          <input type="text" name="name" id="name" placeholder="Your email address" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>
        <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="email" class="text-sm text-gray-600 dark:text-gray-400">Email </label>
          </div>
          <input type="email" name="email" id="email" placeholder="Your password" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

           <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="number" class="text-sm text-gray-600 dark:text-gray-400">Phone no </label>
          </div>
          <input type="number" name="pno" id="phone" placeholder="Your password" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

              <div class="mb-6">
          <div class="flex justify-between mb-2">
            <label for="password" class="text-sm text-gray-600 dark:text-gray-400">Password </label>
          </div>
          <input type="password" name="password" id="password" placeholder="Your password" class="w-full px-3 py-2 placeholder-gray-300 border border-gray-300 rounded-md focus:outline-none" />
        </div>

        <div class="mb-6">
          <button type="submit" class="w-full px-3 py-4 text-white bg-[#252422] rounded-md hover:bg-[#53504c] focus:outline-none duration-100 ease-in-out">Sign in</button>
        </div>
        <p class="text-sm text-center text-gray-400">
          Don&#x27;t have an account yet? 
          <a href="#!" class="font-semibold text-[#252422] focus:text-indigo-600 focus:outline-none focus:underline">Sign up</a>.
        </p>
      </form> 
    </div>
  </div>
</div>


  </body>
</html>