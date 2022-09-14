<%@page pageEncoding="UTF-8" contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="header.jsp" %>
<body>
    <div class="page-holder">
        <!-- navbar-->
        <header class="header bg-white">
            <div class="container px-0 px-lg-3">
                <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="MainController?action=index"><span class="font-weight-bold text-uppercase text-dark">S-TECHNOLOGY SHOP</span></a>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <!-- Link--><a class="nav-link active" href="MainController?action=index">Home</a>
                            </li>
                            <c:set var="userID" value="${sessionScope.user.id}" scope="page"/>
                            <c:set scope="page" var="isAdmin" value="${sessionScope.user.isAdmin}"/>
                            <c:if scope="page" test="${not empty pageScope.userID}" var="isUser">
                                <c:if test="${pageScope.isAdmin}">
                                    <li class="nav-item">
                                        <!-- Link--><a class="nav-link" href="MainController?action=searchProduct">Product management</a>
                                    </li>
                                </c:if>
                            </c:if>
                            <c:if test="${not pageScope.isAdmin}">
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="MainController?action=searchProduct">Shop</a>
                                </li>
                            </c:if>

                            <c:if scope="page" test="${not empty pageScope.userID}" var="isUser">
                                <c:if test="${not pageScope.isAdmin}">
                                    <li class="nav-item">
                                        <!-- Link--><a class="nav-link" href="MainController?action=searchHistory">History Shopping</a>
                                    </li>
                                </c:if>
                            </c:if>
                        </ul>
                        <ul class="navbar-nav ml-auto">               
                            <c:if test="${pageScope.isUser}">
                                <c:if test="${not pageScope.isAdmin}">
                                    <li class="nav-item"><a class="nav-link" href="MainController?action=cart"> <i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Cart</a></li>
                                    </c:if>
                                <li class="nav-item"><a class="nav-link" href="MainController" > <i class="fas fa-user-alt mr-1 text-gray"></i>Log out</a></li>
                                </c:if>
                                <c:if  test="${not pageScope.isUser}" >
                                <li class="nav-item"><a class="nav-link trigger-btn" href="#myModal" data-toggle="modal"> <i class="fas fa-user-alt mr-1 text-gray"></i>Login</a></li>
                                </c:if>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!-- Modal LOGIN HTML -->
        <div id="myModal" class="modal fade">
            <div class="modal-dialog modal-login">
                <div class="modal-content">
                    <form action="MainController" method="post">
                        <div class="modal-header">				
                            <h4 class="modal-title">Login</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">				
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required="required" name="txtUserID">
                            </div>
                            <div class="form-group">
                                <div class="clearfix">
                                    <label>Password</label>

                                </div>

                                <input type="password" class="form-control" required="required" name="txtPassword">
                            </div>
                            <font style="color: red">${requestScope.error.loginError}</font>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/J3_L_P0013/MainController?action=loginByGoogle&response_type=code
                               &client_id=688137221585-c3d5ebf5droccpp94a6b1676d4l2lp9v.apps.googleusercontent.com&approval_prompt=force" class="nav-link"><i class="fab fa-google"></i> Login by Google</a>
                            <input type="submit" class="btn btn-primary" value="Login" name="action">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!-- HERO SECTION-->
        <div class="container">
            <section class="hero pb-3 bg-cover bg-center d-flex align-items-center" style="background: url(img/hero-banner-alt.jpg)">
                <div class="container py-5">
                    <div class="row px-4 px-lg-5">
                        <div class="col-lg-6">
                            <c:if test="${pageScope.isUser}">
                                <h4 class="text-muted small text-uppercase mb-2" >WELCOME</h4>
                                <h1 class="h2 text-uppercase mb-3">${sessionScope.user.name}</h1>
                                <c:if  test="${pageScope.isAdmin}">
                                    <a class="btn btn-dark" href="MainController?action=searchProduct">Management</a>
                                </c:if>
                                <c:if  test="${not pageScope.isAdmin}">
                                    <a class="btn btn-dark" href="MainController?action=searchProduct">Shopping now</a>
                                </c:if>
                            </c:if>
                            <c:if test="${not pageScope.isUser}" >
                                <p class="text-muted small text-uppercase mb-2">S-TECHNOLOGY SHOP</p>
                                <h1 class="h2 text-uppercase mb-3">Cheap and Quality</h1>
                                <a class="btn btn-dark" href="MainController?action=searchProduct">Shopping now</a>
                            </c:if>

                        </div>
                    </div>
                </div>
            </section>

            <!-- CATEGORIES SECTION-->
            <section class="pt-5">
                <header class="text-center">
                    <p class="small text-muted small text-uppercase mb-1"></p>
                    <h2 class="h5 text-uppercase mb-4">Category</h2>
                </header>
                <div class="row">
                    <div class="col-md-4 mb-4 mb-md-0"><a class="category-item" href="MainController?action=searchByCategory&categoryID=1"><img class="img-fluid" src="img/cat-img-1.jpg" alt=""><strong class="category-item-title">Smart phone</strong></a></div>
                    <div class="col-md-4 mb-4 mb-md-0"><a class="category-item mb-4" href="MainController?action=searchByCategory&categoryID=2"><img class="img-fluid" src="img/cat-img-2.jpg" alt=""><strong class="category-item-title">Laptop</strong></a><a class="category-item" href="MainController?action=searchByCategory&categoryID=3"><img class="img-fluid" src="img/cat-img-3.jpg" alt=""><strong class="category-item-title">Tablet</strong></a></div>
                    <div class="col-md-4"><a class="category-item" href="MainController?action=searchByCategory&categoryID=5"><img class="img-fluid" src="img/cat-img-4.jpg" alt=""><strong class="category-item-title">Ear phone</strong></a><a class="category-item" href="MainController?action=searchByCategory&categoryID=4"><img class="img-fluid" src="img/cat-img-5.jpg" alt=""><strong class="category-item-title">Smart watch</strong></a></div>
                </div>
            </section>
            <c:set scope="page" var="error" value="${requestScope.error.loginError}"/>
            <c:if test="${not empty pageScope.error}">
                <script>
                    $(document).ready(function () {
                        // Show the Modal on load
                        $("#myModal").modal("show");
                    });
                </script>    
            </c:if>
            <%@include  file="footer.jsp" %>
