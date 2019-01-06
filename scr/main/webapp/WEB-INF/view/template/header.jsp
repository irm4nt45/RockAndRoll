<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--jstl tagai = c--%>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/29/2018
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>RockAndRoll</title>
    <%--1.5.6   --%>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="//resources/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="//resources/css/carousel.css"/>" rel="stylesheet">
    <link href="<c:url value="//resources/css/main.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>


    <script type="text/javascript" scr="<c:url value="//resources/js/controller.js"/>"></script>

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">



</head>


<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">Carousel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/product/productList" /> ">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
            <ul class="nav navbar-nav pull-right">
                <c:if test = "${pageContext.request.userPrincipal.name != null}">
                    <li><a class="nav-link">Welcome, ${pageContext.request.userPrincipal.name} </a></li>
                    <li><a class="nav-link" href="<c:url value="/login?logout"/>"> Logout</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != 'admin'}" >
                        <li><a class="nav-link" href="<c:url value ="/customer/cart"/>"> Cart</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}" >
                        <a class="nav-link" href="<c:url value="/admin" /> ">Admin</a>
                    </c:if>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}" >
                <li>
                    <a class="nav-link" href="<c:url value="/login" /> ">Login </a>
                </li>
                <li>
                    <a class="nav-link" href="<c:url value="/register" /> ">Register </a>
                </li>
                </c:if>
            </ul>
            <form class="form-inline mt-2 mt-md-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</header>