<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ page import="com.db.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.dao.BookDaoImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.*" %>
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


   <div class="container mx-auto">
      <div class="flex flex-wrap -mx-4">
         <div class="w-full px-4">
            <div class="max-w-full overflow-x-auto">
               <table class="w-full table-auto">
                  <thead>
                     <tr class="text-center bg-[#252422] text-white">

                      <th
                           class="w-1/9 min-w-[120px] border-l border-transparent py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Id 
                        </th>

                        <th
                           class="w-1/9 min-w-[120px] border-l border-transparent py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Image
                        </th>
                        <th
                           class="w-1/3 min-w-[160px] py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Book Name
                        </th>
                        <th
                           class="w-1/3 min-w-[160px] py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Author
                        </th>
                        <th
                           class="w-1/8 min-w-[120px] py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Price
                        </th>
                        <th
                           class="w-1/6 min-w-[160px] py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Category
                        </th>

                        <th
                           class="w-1/6 min-w-[160px] border-r border-transparent py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Status
                        </th>

                        
                        <th
                           class="w-1/6 min-w-[160px] border-r border-transparent py-4 px-3 text-lg font-medium text-white lg:py-7 lg:px-4"
                           >
                           Action
                        </th>      

                     </tr>
                  </thead>

                  <tbody>

                  <%
                  BookDaoImpl dao = new BookDaoImpl(DBConnection.getConn());
                   List<BookDtls> ls = dao.getAllBooks();

                   for(BookDtls b:ls){
                     %>




                     <tr>
                      <td class=" border-b border-l border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getBookId()%>
                        </td>
                        <td class=" border-b border-l border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <img src="../books/<%=b.getPhotoName()%>" style="width: 50px; height: 50px;" alt="no book image"> 
                        </td>
                        <td class="border-b border-[#E8E8E8] bg-white  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getBookName()%>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-[#F3F6FF] py-2 px-2 text-center text-sm font-medium">
                           <%=b.getAuthor()%>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-white py-2 px-2 text-center text-sm font-medium">
                           <%=b.getPrice()%>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getBookCategory()%>
                        </td>
                        <td class=" border-b border-[#E8E8E8] bg-white  py-2 px-2 text-center text-sm font-medium">
                           <%=b.getStatus()%>
                        </td>

                        <td class="border-b border-r border-[#E8E8E8] bg-[#F3F6FF]  py-2 px-2 text-center text-sm font-medium">

                        <div class="flex items-center justify-center gap-1">

                           <a
                              href="../delete?id=<%=b.getBookId()%>"
                              class="inline-block px-6 py-2.5 border rounded-md border-primary text-primary hover:bg-primary hover:text-white font-medium"
                              >
                           <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-5">
                           <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />.
                            </svg>
                           </a>

                            <a
                              href="edit_books.jsp?id=<%=b.getBookId()%>"
                              class="inline-block px-6 py-2.5 border rounded-md border-primary text-primary hover:bg-primary hover:text-white font-medium"
                              >
                           <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-5">
                           <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" /> 
                           </svg>
                            </a>  

                        </div>
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