<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page import="com.dao.CartDaoImpl" %>
<%@ page import="com.db.DBConnection" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="com.entity.User" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/components/csscomponents.jsp"%>
</head>
<body>

 <%@ include file="/components/navbar.jsp" %>

 <c:if test="${empty userObj}">
  <c:redirect url="login.jsp"></c:redirect>
  </c:if> 

  <c:if test="${not empty failedMsg}">  
  <p class="text-center text-green-700">${failedMsg}</p>
  <c:remove var="succMsg" scope="session"/>
  </c:if>



<div class="font-[sans-serif] bg-white">
      <div class="flex max-sm:flex-col gap-12 max-lg:gap-4 min-h-full justify-center max-w-7xl mx-auto py-16 items-center">

      <div class="grid lg:grid-cols-2 gap-12">
        <div>
          <div class="bg-gray-100 p-6 rounded-md">
            <h2 class="text-2xl font-bold text-gray-800">Your Cart</h2>
            <div class="space-y-4 mt-8">



            <% 
            User u = (User)session.getAttribute("userObj");
            CartDaoImpl dao = new CartDaoImpl(DBConnection.getConn());
            List<Cart> cart = dao.getBookByUser(u.getId());
            Double totalPrice=0.0;
            for(Cart c : cart)
            { 
            totalPrice = c.getTotalPrice();
            
            %>
            <div class="flex items-center gap-4">
                <div class="w-full">
                  <h3 class="text-base font-semibold text-gray-800"><%=c.getBookname()%></h3>
                  <h3 class="text-base font-semibold text-gray-700"><%=c.getAuthor()%></h3>
                  

                  <div class="flex gap-4 mt-4">

                    <div>
                    <h6 class="text-sm text-gray-800 font-bold cursor-pointer mt-0.5"><%=c.getPrice()%></h6> 
                    </div>

                    <div class="ml-auto">

                    <a href="remove_book?bid=<%=c.getBid()%>&&cid=<%=c.getCid()%>&&uid=<%=c.getUserId()%>" class="text-sm font-semibold text-gray-800 hover:text-red-500">
                      <svg xmlns="http://www.w3.org/2000/svg" class="w-4 fill-red-500 inline cursor-pointer" viewBox="0 0 24 24">
                        <path d="M19 7a1 1 0 0 0-1 1v11.191A1.92 1.92 0 0 1 15.99 21H8.01A1.92 1.92 0 0 1 6 19.191V8a1 1 0 0 0-2 0v11.191A3.918 3.918 0 0 0 8.01 23h7.98A3.918 3.918 0 0 0 20 19.191V8a1 1 0 0 0-1-1Zm1-3h-4V2a1 1 0 0 0-1-1H9a1 1 0 0 0-1 1v2H4a1 1 0 0 0 0 2h16a1 1 0 0 0 0-2ZM10 4V3h4v1Z" data-original="#000000"></path>
                        <path d="M11 17v-7a1 1 0 0 0-2 0v7a1 1 0 0 0 2 0Zm4 0v-7a1 1 0 0 0-2 0v7a1 1 0 0 0 2 0Z" data-original="#000000"></path>
                      </svg>
                      </a>
                    </div>
                  </div>
                </div>
              </div>

              <hr class="border-gray-300" />


            <%
            }
            %>


             <div class="flex items-between gap-4">
                <div class="w-full">
                  <h3 class="text-base font-semibold text-gray-800">Total Price</h3>

                  

                    <div class="ml-auto">
                    <div>
                    <h6 class="text-sm text-gray-800 font-bold cursor-pointer mt-0.5"><%=totalPrice%></h6> 
                    </div>
                  </div>
                </div>
              </div>

              <hr class="border-gray-300" />

            


            



          





      </div>

      </div>
      </div>
         

        <div class="max-w-4xl w-full h-max rounded-md px-4 py-8 sticky top-0">
          <h2 class="text-2xl font-bold text-gray-800">Complete your order</h2>
          <form class="mt-8" action="order" method="post">

          <input type="hidden" name="id" value="${userObj.id}">
            <div>
              <h3 class="text-base text-gray-800 mb-4">Personal Details</h3>
              <div class="grid md:grid-cols-2 gap-4">
                <div>
                  <input type="text"  name="name" value="${userObj.name}" placeholder="First Name"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>

                </div>

                <div>
                  <input type="email" name="email" value="${userObj.email}" placeholder="Email"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>
                </div>

                <div>
                  <input type="number" name="phone" value="${userObj.phno}" placeholder="Phone No."
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required />
                </div>
              </div>
            </div>

            <div class="mt-8">
              <h3 class="text-base text-gray-800 mb-4">Shipping Address</h3>
              <div class="grid md:grid-cols-2 gap-4">
                <div>
                  <input type="text" name="address" placeholder="Address Line"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>
                </div>


                <div>
                  <input type="text" name="landmark" placeholder="Landmark"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>
                </div>

                <div>
                  <input type="text" name="city" placeholder="City"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>
                </div>
                <div>
                  <input type="text" name="state" placeholder="State"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>
                </div>
                <div>
                  <input type="text" name="pincode" placeholder="Zip Code"
                    class="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600" required/>
                </div>


                <div>
          <div class="flex justify-between mb-2">
          </div>
         <div class="relative">
         <select name="payment" required class="block appearance-none w-full bg-gray-200 text-gray-800 py-3 px-4 rounded-md leading-tight focus:outline-none focus:bg-white focus:border-gray-500 text-sm" id="grid-state">
          <option>Cash On Delivery</option>
          <option>UPI</option>
          <option>Bank Account</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
        </div>

              
              </div>

              <div class="flex gap-4 max-md:flex-col mt-8">
                <a href="index.jsp" class="rounded-md px-6 py-3 w-full text-sm tracking-wide bg-transparent hover:bg-gray-100 border border-gray-300 text-gray-800 max-md:order-1">Cancel</a>
                <button type="submit" class="rounded-md px-6 py-3 w-full text-sm tracking-wide bg-blue-600 hover:bg-blue-700 text-white">Complete Purchase</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>

















</body>
</html>