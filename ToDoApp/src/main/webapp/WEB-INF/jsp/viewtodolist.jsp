<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>To-Do List</title>
  
   <link href="${pageContext.request.contextPath}/css/Style.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
     
</head>
<body>
<jsp:include page="header.jsp" />
    <h3 style="
    background-color: beige;
    margin-bottom: unset;
    text-align: center;
    padding: 9px;
    border-radius: 20px 20px 0px 0px;
">To-Do Application</h3>

    <!-- Form to add a new To-Do item -->
    <form:form >
        
    

    <!-- Table to display To-Do items -->
    
    <table>
  
  <col>
  <col>
  <col>
   <thead>
  
            <tr>
             
                <th>S.no</th>
                <th>Task</th>
                <th>Date</th>
                <th class="action_big">Notes</th>
                <th >Status</th>
                <th class="action_big">Mark Completed</th>
                <th class="action_big">Edit</th>
                 <th class="action_big">Delete</th>
                 <th class="action">Action</th>
            </tr>
        </thead>
 <tbody>
            <c:forEach var="item" items="${list}" varStatus="loop" >
                <tr>
                   <!--  <td>${item.id}</td>-->
                   <td>${loop.index + 1}</td>
                    <td>${item.title}</td>
                    <td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd" /></td>
                     <td class="action_big">${item.notes}</td>

                    <td >${item.status}</td>
                    <td class="action_big">
                       
                            <button type="button" class="greenbut"><a href="/updateToDostatus/${item.id} ">Completed</a></button>
                 <a href="/updateToDostatus/${item.id} " class="greenbuticon">      <i class="fa fa-check" aria-hidden="true"></i></a>
                    </td>
                       <td class="action_big">
                       
                            <button type="button" class="bluebut"><a href="/editTodoItem/${item.id} ">Edit</a></button>
                       <a href="/editTodoItem/${item.id}" class="bluebuticon"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                    </td>
                      <td class="action_big">
                       
                            <button type="button" class="redbut"><a href="/deletetodo/${item.id} ">Delete</a></button>
                      <a href="/deletetodo/${item.id}" class="redbuticon"> <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                    </td>
                    
                     <td class="action">
<a href="/updateToDostatus/${item.id} " class="greenbuticon">      <i class="fa fa-check" aria-hidden="true"></i></a>
  <a href="/editTodoItem/${item.id}" class="bluebuticon"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                      <a href="/deletetodo/${item.id}" class="redbuticon"> <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                    </td>
                </tr>
            </c:forEach>
          
        </tbody>
    </table>
    
    </form:form>
   
      <div class="bootom ">
    <p><a href="/addTodoitem" style="
    font-size: 35px;
"> <i class="fas fa-plus-circle "></i></a></p>
    </div>
    
<jsp:include page="footer.jsp" />
<script src="ttps://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    
   
<script>
    // Your JavaScript code goes here
    
    // ---------Responsive-navbar-active-animation-----------
    function test(){
        var tabsNewAnim = $('#navbarSupportedContent');
        var selectorNewAnim = $('#navbarSupportedContent').find('li').length;
        var activeItemNewAnim = tabsNewAnim.find('.active');
        var activeWidthNewAnimHeight = activeItemNewAnim.innerHeight();
        var activeWidthNewAnimWidth = activeItemNewAnim.innerWidth();
        var itemPosNewAnimTop = activeItemNewAnim.position();
        var itemPosNewAnimLeft = activeItemNewAnim.position();
        $(".hori-selector").css({
            "top":itemPosNewAnimTop.top + "px", 
            "left":itemPosNewAnimLeft.left + "px",
            "height": activeWidthNewAnimHeight + "px",
            "width": activeWidthNewAnimWidth + "px"
        });
        $("#navbarSupportedContent").on("click","li",function(e){
            $('#navbarSupportedContent ul li').removeClass("active");
            $(this).addClass('active');
            var activeWidthNewAnimHeight = $(this).innerHeight();
            var activeWidthNewAnimWidth = $(this).innerWidth();
            var itemPosNewAnimTop = $(this).position();
            var itemPosNewAnimLeft = $(this).position();
            $(".hori-selector").css({
                "top":itemPosNewAnimTop.top + "px", 
                "left":itemPosNewAnimLeft.left + "px",
                "height": activeWidthNewAnimHeight + "px",
                "width": activeWidthNewAnimWidth + "px"
            });
        });
    }
    $(document).ready(function(){
        setTimeout(function(){ test(); });
    });
    $(window).on('resize', function(){
        setTimeout(function(){ test(); }, 500);
    });
    $(".navbar-toggler").click(function(){
        $(".navbar-collapse").slideToggle(300);
        setTimeout(function(){ test(); });
    });

    // --------------add active class-on another-page move----------
    jQuery(document).ready(function($){
        var path = window.location.pathname.split("/").pop();
        if ( path == '' ) {
            path = 'index.html';
        }
        var target = $('#navbarSupportedContent ul li a[href="'+path+'"]');
        target.parent().addClass('active');
    });
</script>

</body>
</html>
