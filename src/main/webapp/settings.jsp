<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="components/csscomponents.jsp"%>
 <%@include file="components/csscomponents.jsp"%>
</head>
<body>
 <%@ include file="components/navbar.jsp" %>

 <c:if test="${empty userObj}">
 <c:redirect url="login.jsp"/>
 </c:if>


<c:if test="${not empty userObj }">
<div class="text-center pt-5 bg-gray-100">
      <h1 class="text-3xl bg-gray-100 font-semibold text-gray-700">Hello, ${userObj.name}</h1>
    </div>
<c:remove var="msg" scope="session"/>
</c:if>
      


<div class="min-h-screen bg-gray-100 flex justify-center items-center">



<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 px-10 py-2 gap-5">
  <div class="w- p-6  lg:col-span-2 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">
   <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-10">
  <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
</svg>

    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
        <a href="sellbooks.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">Sell Old Books</a>
      </div>
    </div>
  </div>

  <div class="w- p-6 lg:col-span-2 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-10">
  <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
</svg>


    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
        <a href="edit_profile.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">Login and Security(Edit Profile)</a>
      </div>
    </div>
  </div>

  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">

  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-10">
  <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
</svg>

    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
         <a href="user_address.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">Your Address</a>
      </div>
    </div>
  </div>




  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">

  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-10">
  <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
</svg>


    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
         <a href="user_orders.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">My Orders</a>
      </div>
    </div>
  </div>







  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">
   <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-10">
  <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 9.75a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm0 0H8.25m4.125 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm0 0H12m4.125 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm0 0h-.375m-13.5 3.01c0 1.6 1.123 2.994 2.707 3.227 1.087.16 2.185.283 3.293.369V21l4.184-4.183a1.14 1.14 0 0 1 .778-.332 48.294 48.294 0 0 0 5.83-.498c1.585-.233 2.708-1.626 2.708-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
</svg>

    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
         <a href="helpline.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300 cursor-pointer">Help Centre</a>
      </div>
    </div> 

    </div>
  </div>

</div>





 
</body>
</html>