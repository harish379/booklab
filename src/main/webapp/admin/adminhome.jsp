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
<%@ include file="navbar.jsp" %>

<c:if test="${empty userObj}">
<c:redirect url="../login.jsp"/>
</c:if>


<div class="min-h-screen bg-gray-100 flex justify-center items-center">

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 px-10 py-2 gap-5">
  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">
    <svg class="w-24 h-24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
   <path fill-rule="evenodd" d="M12 3.75a.75.75 0 0 1 .75.75v6.75h6.75a.75.75 0 0 1 0 1.5h-6.75v6.75a.75.75 0 0 1-1.5 0v-6.75H4.5a.75.75 0 0 1 0-1.5h6.75V4.5a.75.75 0 0 1 .75-.75Z" clip-rule="evenodd" />
    </svg>
    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
        <a href="add_books.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">Add Books</a>
      </div>
    </div>
  </div>

  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">
    <svg class="h-24 w-24 text-stone-500"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round">  <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />  <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" /></svg>
    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
        <a href="all_books.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">All Books</a>
      </div>
    </div>
  </div>

  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">

  <svg class="w-24 h-24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
  <path d="M3.375 3C2.339 3 1.5 3.84 1.5 4.875v.75c0 1.036.84 1.875 1.875 1.875h17.25c1.035 0 1.875-.84 1.875-1.875v-.75C22.5 3.839 21.66 3 20.625 3H3.375Z" />
  <path fill-rule="evenodd" d="m3.087 9 .54 9.176A3 3 0 0 0 6.62 21h10.757a3 3 0 0 0 2.995-2.824L20.913 9H3.087Zm6.163 3.75A.75.75 0 0 1 10 12h4a.75.75 0 0 1 0 1.5h-4a.75.75 0 0 1-.75-.75Z" clip-rule="evenodd" />
</svg>

    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
         <a href="orders.jsp" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300">All Orders</a>
      </div>
    </div>
  </div>

  <div class="w- p-6 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
  <div class="flex justify-center items-center py-6">
   <svg class="h-24 w-24 text-red-500"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round">  <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />  <polyline points="16 17 21 12 16 7" />  <line x1="21" y1="12" x2="9" y2="12" /></svg>
    </div>
    <div class="mt-4">
      <div class="mt-4 mb-2 flex justify-center items-center pl-4 pr-2">
         <a href="../logout" class="text-lg block font-semibold py-2 px-20 text-green-100 hover:text-white bg-[#403d39] rounded-lg shadow hover:shadow-md transition duration-300 cursor-pointer">Logout</a>
      </div>
    </div>

    </div>
  </div>

</div>





<%@ include file="/components/footer.jsp" %>
</body>
</html>
