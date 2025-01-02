<%@page import="com.entity.User"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/csscomponents.jsp"%>

    <style>
        #alertMessage {
            visibility: hidden;
            opacity: 0;
            transition: visibility 0s, opacity 0.5s ease-in-out;
        }

        #alertMessage.show {
            visibility: visible;
            opacity: 1;
        }
    </style>


</head>
<body>

 

<c:if test="${not empty addCart}">


    <div id="alertMessage" class="flex w-96 shadow-lg rounded-lg fixed z-10 bottom-5">
        <div class="px-4 py-6 bg-white rounded-r-lg flex justify-between items-center w-full border border-l-transparent border-gray-200">
            <div>Item added to cart</div>
        </div>
    </div>


    <script>
document.addEventListener('DOMContentLoaded', function() {
    showAlert();
});

function showAlert() {
    const alert = document.getElementById("alertMessage");
    alert.classList.add("show");
    
    setTimeout(function() {
        alert.classList.remove("show");
    }, 2000); // Will show for 3 seconds
}

function hideAlert() {
    const alert = document.getElementById("alertMessage");
    alert.classList.remove("show");
}
</script>

<c:remove var="addCart" scope="session" />


</c:if>




 <%@ include file="components/navbar.jsp" %>


 <% User u=(User)session.getAttribute("userObj"); %>



 <!-- New Arrivals -->
  <div class="rounded-md flex flex-col items-center justify-center py-4">

  <div class="flex flex-row items-center justify-center py-4 gap-3">
  <h1 class="text-4xl font-bold">New Arrivals</h1>
          </div>


                   <%
                  BookDaoImpl dao = new BookDaoImpl(DBConnection.getConn());
                   List<BookDtls> ls = dao.getallrecentBooks(); %>                 
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
              href="#"class="text-white bg-[#403d39] hover:bg-[#53504c] font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Details</a>
              
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

</body>
</html>