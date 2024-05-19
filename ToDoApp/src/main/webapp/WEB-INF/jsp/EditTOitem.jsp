<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add To-Do Item</title>
    <link href="${pageContext.request.contextPath}/css/Style.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
    <div class="container " style="max-width: 100%;">
        <h1 class="mb-4">Edit Task</h1>

        <!-- Display message if present -->
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="alert">
                ${message}
            </div>
        </c:if>
        <div class="container ">

        <!-- Form to add a new To-Do item -->
        <form:form modelAttribute="todo" action="/editsaveTodoItem" method="post">
      
              
                <form:input path="id" type="hidden"/>
           
           
           <div class="row">
    <div class="col-25">
      <label for="fname">Task</label>
    </div>
    <div class="col-75">
      <form:input path="title" required="true" class="" id="title"/>
    </div>
  </div>
    
  <div class="row">
    <div class="col-25">
      <label for="lname">Date</label>
    </div>
    <div class="col-75">
    <form:input id="date" type="date" path="date" required="true" class=""/>
    </div>
  </div>  
    
<!--  <div class="row">
    <div class="col-25">
      <label for="email">Email</label>
    </div>
    <div class="col-75">
      <input type="email" id="email" name="email" placeholder="Your email..">
    </div>
  </div> --> 
      <div class="row">
    <div class="col-25">
      <label for="lname">status</label>
    </div>
    <div class="col-75">
     <form:input type="text" id="status" path="status" required="true" value="Incomplete" cssClass="form-control"/>
    </div>
  </div>  
  
  

    
  <div class="row">
    <div class="col-25">
      <label for="Notes">Notes</label>
    </div>
    <div class="col-75">
   <!--   <form:input id="Notes" type="textarea" path="date" required="true" class=""/>-->
     <form:input id="Notes" type="text" path="Notes" required="true" class=""/>
    </div>
  </div>
    
  <div class="rows">
    <button type="submit" class="sub my-3" >Save</button>
  </div>
    
           
           
           
           
           
        
        </form:form>

        <!-- Link back to the To-Do list -->
       
    </div>
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
