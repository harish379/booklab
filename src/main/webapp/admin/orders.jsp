<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ page import="com.db.DBConnection" %>
<%@ page import="com.dao.BookDaoImpl" %>
<%@ page import="com.db.DBConnection" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.dao.BookOrderImpl" %>
<%@ page import="com.entity.Book_Order" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>All Books</title>
    <%@include file="/components/csscomponents.jsp"%>
  </head>

<body>
  <%@ include file="navbar.jsp" %>


  <c:if test="${empty userObj}">
<c:redirect url="../login.jsp"/>
</c:if>


  <!-- ====== Table Section Start -->
<section class="bg-white dark:bg-dark py-20 lg:py-[150px]">
   <div class=" mx-auto w-full px-8">
      <div class="flex ">
         <div class="w-full">
            <div class="max-w-full overflow-x-auto">
               <table class="w-full table-auto">
                  <thead>
                     <tr class="text-center bg-[#252422] text-white">
                        <th
                           class="w-1/9 min-w-[120px] border-l border-transparent py-2 px-3 text-sm font-medium text-white"
                           >
                         Order ID
                        </th>
                        <th
                           class="w-1/3 min-w-[160px] py-2 px-3 text-sm font-medium text-white"
                           >
                           Name
                        </th>
                        <th
                           class="w-1/3 min-w-[160px] py-2 px-3 text-sm font-medium text-white"
                           >
                           Email
                        </th>
                        <th
                           class="w-1/8 min-w-[120px] py-2 px-3 text-sm font-medium text-white"
                           >
                           Address
                        </th>
                        <th
                           class="w-1/6 min-w-[160px] py-2 px-3 text-sm font-medium text-white"
                           >
                           Phone no
                        </th>

                        <th
                           class="w-1/6 min-w-[160px]  border-transparent py-2 px-3 text-sm font-medium text-white"
                           >
                           book Name
                        </th>

                        
                         <th
                           class="w-1/9 min-w-[120px] border-transparent py-2 px-3 text-sm font-medium text-white"
                           >
                         Author
                        </th>

                        <th
                           class="w-1/6 min-w-[160px]  border-transparent py-2 px-3 text-sm font-medium text-white "
                           >
                           Price
                        </th>

                         <th
                           class="w-1/9 min-w-[120px] r border-transparent py-2 px-3 text-sm font-medium text-white"
                           >
                           Payment Type
                        </th>                       
                     </tr>
                  </thead>


                  <tbody>

                   <% BookOrderImpl dao = new BookOrderImpl(DBConnection.getConn());
                   List<Book_Order> list =  dao.getAllOrders();
                   
                    for(Book_Order b : list)
                    { %>
                  
                  
                   <tr>
                        <td class=" border-b border-l border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getorderId() %>
                        </td>
                        <td class="border-b border-[#E8E8E8] bg-white  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getUsername() %>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-[#F3F6FF] py-2 px-2 text-center text-sm font-medium">
                           <%=b.getEmail() %>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-white py-2 px-2 text-center text-sm font-medium">
                           <%=b.getFulladd() %>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getPhno() %>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-white  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getBookName() %>
                        </td>

                         <td class=" border-b border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getAuthor() %>
                        </td>

                        <td class=" border-b border-[#E8E8E8] bg-white  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getPrice() %>
                        <td class=" border-b border-r border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getPaymentType() %>
                        </td>
                   </tr>


                  <%
                  }
                  %>
                    
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- ====== Table Section End -->
  

  
  



  </body>
</html>