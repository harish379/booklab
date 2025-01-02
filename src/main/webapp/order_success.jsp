<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@include file="/components/csscomponents.jsp"%>
  </head>

<body>
  <%@ include file="/components/navbar.jsp" %>


  <section class="py-24 min-h-screen">
        <div class="w-full max-w-7xl px-4 md:px-5 lg-6 mx-auto">
            <h2 class="font-manrope font-bold text-4xl leading-10 text-black text-center">
                Order Successful
            </h2>
            <p class="mt-4 font-normal text-lg leading-8 text-gray-500 mb-11 text-center">Thanks for making a ordering
                you can
                check our order summary from below</p>
            <div class="main-box border border-gray-200 rounded-xl max-w-xl max-lg:mx-auto lg:max-w-full flex justify-center lg:pt-6 items-center">
                <div
                    class="flex flex-col lg:flex-row lg:items-center justify-between px-6 pb-6 border-b border-gray-200">
                    
                    <a href="user_orders.jsp"
                        class="rounded-md py-3 px-7 font-semibold text-sm leading-7 text-white bg-indigo-600 max-lg:mt-5 shadow-sm shadow-transparent transition-all duration-500 hover:bg-indigo-700 hover:shadow-indigo-400">Check
                        Your Order</a>
                </div>
            </div>
        </div>
    </section>


</body>
</html>