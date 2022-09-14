
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<body>
    <c:set scope="page" var="categorys" value="${requestScope.categorys}"/>
    <c:set scope="page" var="products" value="${requestScope.products}"/>
    <c:set scope="page" var="txtSearch" value="${sessionScope.txtSearch}"/>
    <c:set scope="page" var="priceMin" value="${sessionScope.priceMin}"/>
    <c:set scope="page" var="priceMax" value="${sessionScope.priceMax}"/>
    <c:set scope="page" var="priceMaxCurrent" value="${sessionScope.priceMaxCurrent}"/>
    <c:set scope="page" var="quantityPage" value="${sessionScope.quantityPage}"/>
    <c:set scope="page" var="page" value="${sessionScope.page}"/>
    <c:set scope="page" var="categoryID" value="${sessionScope.categoryID}"/>
    <c:set scope="page" var="productDetail" value="${requestScope.productDetail}"/>
    <c:set var="isUser" value="${not empty sessionScope.user}" scope="page"/>
    <div class="page-holder">
        <!-- navbar-->
        <header class="header bg-white">
            <div class="container px-0 px-lg-3">
                <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="MainController?action=index"><span class="font-weight-bold text-uppercase text-dark">S-TECHNOLOGY SHOP</span></a>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <!-- Link--><a class="nav-link" href="MainController?action=index">Home</a>
                            </li>
                            <li class="nav-item">
                                <!-- Link--><a class="nav-link active" href="MainController?action=searchProduct">Shop</a>
                            </li>
                            <c:if test="${pageScope.isUser}">
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="MainController?action=searchHistory">History Shopping</a>
                                </li>
                            </c:if>
                        </ul>
                        <ul class="navbar-nav ml-auto">               
                            <c:if test="${pageScope.isUser}">

                                <li class="nav-item"><a class="nav-link" href="MainController?action=cart"> <i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Cart</a></li>
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

        <!-- Detail Modal -->
        <div class="modal fade" id="productView" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body p-0">
                        <div class="row align-items-stretch">
                            <div class="col-lg-6 p-lg-0"><img src="${pageScope.productDetail.imageLink}" class="rounded mx-auto d-block" alt="..."/></div>
                            <div class="col-lg-6">
                                <button class="close p-4" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <div class="p-5 my-md-4">
                                    <h2 class="h4">${pageScope.productDetail.name}</h2>
                                    <p class="text-muted">$${pageScope.productDetail.price}</p>
                                    <p class="text-small mb-4">${pageScope.productDetail.description}</p>
                                    <div class="row align-items-stretch mb-4">
                                        <form action="MainController" method="POST">
                                            <div class="col-sm-7 pr-sm-0">
                                                <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                                                    <div class="quantity">
                                                        <input class="form-control border-0 shadow-0 p-0" type="number" value="1" name="quantity" min="1" max="${pageScope.productDetail.quantity}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="id" value="${pageScope.productDetail.id}" />
                                            <input type="hidden" name="price" value="${pageScope.productDetail.price}" />
                                            <input type="hidden" name="name" value="${pageScope.productDetail.name}"/>
                                            <input type="hidden" name="maxQuantity" value="${pageScope.productDetail.quantity}" />
                                            <input class="btn btn-dark btn-block" type="submit" name="action" value="Add to Cart" <c:if test="${(pageScope.productDetail.quantity == 0)or(empty sessionScope.user)}"> disabled="true" </c:if> />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                    

            <div class="container">
                <!-- HERO SECTION-->
                <section class="py-5 bg-light">
                    <div class="container">
                        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                            <div class="col-lg-6">
                                <h1 class="h2 text-uppercase mb-0">Shop</h1>
                            </div>
                            <div class="col-lg-6 text-lg-right">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                        <li class="breadcrumb-item"><a href="MainController?action=index">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Shop</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="py-5">
                    <div class="container p-0">
                        <div class="row">
                            <!-- SHOP SIDEBAR-->
                            <div class="col-lg-3 order-2 order-lg-1">
                                <h5 class="text-uppercase mb-4">Search</h5>
                                <div class="mb-5">
                                    <form action="MainController" method="POST" class="form-horizontal form-inline">
                                        <input class="form-control" type="text" name="txtSearch" value="${pageScope.txtSearch}">
                                    <div class="col-sm-5 pl-sm-0"><input class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" type="submit" name="action" value="Search"/></div>
                                </form>
                            </div>
                            <div class="btn-group font-weight-normal mb-4">
                                <a class="text-uppercase btn btn-dark btn-sm " href="MainController?action=searchByCategory&categoryID=all" >All categories</a>
                                <button type="button" class="btn btn-dark btn-sm  dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <c:forEach var="category" items="${pageScope.categorys}">
                                        <a class="reset-anchor dropdown-item <c:if test="${pageScope.category.id == pageScope.categoryID}"> active </c:if>" href="MainController?action=searchByCategory&categoryID=${pageScope.category.id}">${pageScope.category.name}</a>
                                    </c:forEach>
                                </div>
                            </div>
                            <h6 class="text-uppercase mb-4">Price range</h6>
                            <div class="price-range pt-4 mb-4">
                                <div id="range"></div>
                                <div class="row pt-2">
                                    <div class="col-6"><strong class="small font-weight-bold text-uppercase">From</strong></div>
                                    <div class="col-6 text-right"><strong class="small font-weight-bold text-uppercase">To</strong></div>
                                </div>
                                <form action="MainController" method="POST">
                                    <input type="text" name="txtPriceMin"  id="slider-margin-value-min" hidden="true"/>
                                    <input type="text" name="txtPriceMax"  id="slider-margin-value-max" hidden="true"/>
                                    <div class="col-sm-5 pl-sm-0"><input class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" type="submit" name="action" value="Filter" /></div>
                                </form>
                            </div>
                        </div>
                        <!-- SHOP LISTING-->
                        <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">

                            <div class="row">
                                <!-- PRODUCT-->
                                <c:if scope="page" test="${not empty pageScope.products}" var="isEmptyProducts">
                                    <c:forEach var="product" items="${pageScope.products}">
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="product text-center">
                                                <div class="mb-3 position-relative">
                                                    <div class="badge text-white badge-"></div><a class="d-block" href="MainController?action=loadDetailProduct&detailProductID=${pageScope.product.id}" ><img class="img-fluid w-100" src="${pageScope.product.imageLink}" alt="..."></a>
                                                    <div class="product-overlay">
                                                        <ul class="mb-0 list-inline">
                                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" <c:if test="${(pageScope.product.quantity != 0)and(not empty sessionScope.user) }"> href="MainController?action=Add to Cart&id=${pageScope.product.id}&quantity=1&price=${pageScope.product.price}&name=${pageScope.product.name}&maxQuantity=${pageScope.product.quantity}"</c:if> ><i class="fas fa-cart-plus"></i> Add to cart</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h6> <a class="reset-anchor" href="#">${pageScope.product.name}</a></h6>
                                                <p class="small text-muted">$${pageScope.product.price}</p>
                                            </div>
                                        </div>
                                    </c:forEach>


                                </div>
                                <!-- PAGINATION-->
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center justify-content-lg-end">
                                        <li class="page-item"><a class="page-link" href="MainController?action=previousPage" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <c:forEach begin="1" end="${pageScope.quantityPage}" step="1" var="counter">
                                            <li class="page-item <c:if test="${pageScope.page == pageScope.counter}"> active </c:if>"><a class="page-link" href="MainController?action=changePage&newPage=${pageScope.counter}">${pageScope.counter}</a></li>
                                            </c:forEach>
                                        <li class="page-item"><a class="page-link" href="MainController?action=nextPage" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
                            </c:if>
                            <c:if test="${not pageScope.isEmptyProducts}">
                                <h2 class="h2 text-uppercase mb-0">NO PRODUCT</h2>
                            </c:if>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- Nouislider Config-->
        <script src="vendor/nouislider/nouislider.min.js"></script>
        <script>
            var range = document.getElementById('range');
            var txtPrice = document.getElementById('txtPrice');

            noUiSlider.create(range, {
                range: {
                    'min': 0,
                    'max': ${pageScope.priceMaxCurrent}
                },
                step: 2,
                start: [${pageScope.priceMin}, ${pageScope.priceMax}],
                margin: 2,
                connect: true,
                direction: 'ltr',
                orientation: 'horizontal',
                behaviour: 'tap-drag',
                tooltips: true,
                format: {
                    to: function (value) {
                        return '$' + value;
                    },
                    from: function (value) {
                        return value.replace('', '');
                    }
                }
            });
            var marginMin = document.getElementById('slider-margin-value-min'),
                    marginMax = document.getElementById('slider-margin-value-max');

            range.noUiSlider.on('update', function (values, handle) {
                if (handle) {
                    marginMax.value = values[handle];
                } else {
                    marginMin.value = values[handle];
                }
            });
        </script>
        <c:if test="${not empty pageScope.productDetail}">
            <script>
                $(document).ready(function () {
                    // Show the Modal on load
                    $("#productView").modal("show");
                });
            </script> 
        </c:if>
        <%@include  file="footer.jsp" %>