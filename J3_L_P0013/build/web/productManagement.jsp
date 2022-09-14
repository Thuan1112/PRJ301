
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
    <c:set scope="page" var="deleteProductID" value="${param.deleteProductID}"/>
    <c:set scope="page" var="productUpdate" value="${requestScope.productUpdate}"/>
    <c:set scope="page" var="quantityPage" value="${sessionScope.quantityPage}"/>
    <c:set scope="page" var="page" value="${sessionScope.page}"/>
    <c:set scope="page" var="categoryID" value="${sessionScope.categoryID}"/>
    <c:set scope="page" var="productDetail" value="${requestScope.productDetail}"/>

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
                                <!-- Link--><a class="nav-link active" href="MainController?action=searchProduct">Product management</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">               
                            <li class="nav-item"><a class="nav-link" href="MainController" > <i class="fas fa-user-alt mr-1 text-gray"></i>Log out</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <!-- Modal Confirm delete -->
        <div id="deleteModal" class="modal fade" data-backdrop="static">
            <div class="modal-dialog modal-confirm">
                <div class="modal-content">
                    <div class="modal-header flex-column">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <div class="text-center text-danger w-100">
                            <i class="fas fa-times fa-7x"></i>
                        </div>				
                        <h4 class="modal-title w-100">Are you sure?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Do you really want to delete these product?</p>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <form action="MainController" method="POST">
                            <input type="text" hidden="true" value="${pageScope.deleteProductID}" name="idDeleteProduct"/>
                            <input type="submit" class="btn btn-danger" value="Delete" name="action"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Detail Modal -->
        <div class="modal fade" id="productView" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
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
                                        <div class="col-sm-7 pr-sm-0">
                                            <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                                                <div class="quantity">
                                                    <input class="form-control border-0 shadow-0 p-0" type="text" value="${pageScope.productDetail.quantity}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                    

        <!-- Edit Modal -->
        <div id="editModal" class="modal fade" data-backdrop="static">
            <div class="modal-dialog contact-modal">
                <div class="modal-content">
                    <div class="modal-header">				
                        <h4 class="modal-title">Edit product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="MainController" method="post">
                            <div class="form-group">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="inputName" name="updateName" value="${pageScope.productUpdate.name}" required>
                            </div>
                            <div class="form-group">
                                <label for="inputImageLink">Image link</label>
                                <input type="text" class="form-control" id="inputImageLink" name="updateImageLink" value="${pageScope.productUpdate.imageLink}" required>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <input type="number" class="form-control" id="inputPrice" required min="1" max="9999" value="${pageScope.productUpdate.price}" name="updatePrice"></div>
                                    <div class="col">
                                        <label for="inputQuantity">Quantity</label>
                                        <input type="number" class="form-control" id="inputQuantity" required min="1" max="9999" value="${productUpdate.quantity}" name="updateQuantity">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputCategory">Category</label>
                                <select class="custom-select form-control" id="inputCategory" name="updateCategory">
                                    <c:forEach var="category" items="${pageScope.categorys}">
                                        <option value="${pageScope.category.id}" <c:if test="${pageScope.category.id == pageScope.productUpdate.categoryID}" > selected </c:if> >${pageScope.category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputDescription">Description</label>
                                <textarea class="form-control" id="inputDescription" rows="2" required name="updateDescription">${pageScope.productUpdate.description}</textarea>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Update" name="action">
                            <input type="button" class="btn btn-link" data-dismiss="modal" value="Cancel">
                            <input type="hidden" name="updateID" value="${pageScope.productUpdate.id}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>                    


        <!-- Add Modal -->
        <div id="addModal" class="modal fade" data-backdrop="static">
            <div class="modal-dialog contact-modal">
                <div class="modal-content">
                    <div class="modal-header">				
                        <h4 class="modal-title">Add new a product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="MainController" method="post">
                            <div class="form-group">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="inputName" name="newName" required>
                            </div>
                            <div class="form-group">
                                <label for="inputImageLink">Image link</label>
                                <input type="text" class="form-control" id="inputImageLink" name="newImageLink"  required>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <input type="number" class="form-control" id="inputPrice" required min="1" max="9999" value="1" name="newPrice"></div>
                                    <div class="col">
                                        <label for="inputQuantity">Quantity</label>
                                        <input type="number" class="form-control" id="inputQuantity" required min="1" max="9999" value="1" name="newQuantity">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputCategory">Category</label>
                                <select class="custom-select form-control" id="inputCategory" name="newCategory">
                                    <c:forEach var="category" items="${pageScope.categorys}">
                                        <option value="${pageScope.category.id}" >${pageScope.category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputDescription">Description</label>
                                <textarea class="form-control" id="inputDescription" rows="2" required name="newDescription"></textarea>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Add" name="action">
                            <input type="button" class="btn btn-link" data-dismiss="modal" value="Cancel">
                        </form>
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
                            <h1 class="h2 text-uppercase mb-0">Product management</h1>
                        </div>
                        <div class="col-lg-6 text-lg-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                    <li class="breadcrumb-item"><a href="MainController?action=index">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Product management</li>
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
                            <div class="mb-5"><a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0 trigger-btn" href="#addModal" data-toggle="modal"><i class="fas fa-plus"></i> Add new a product</a></div>
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
                                        <a class="reset-anchor dropdown-item <c:if test="${pageScope.category.id == pageScope.categoryID}" > active </c:if>" href="MainController?action=searchByCategory&categoryID=${pageScope.category.id}">${pageScope.category.name}</a>
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
                                <c:if scope="page"  test="${not empty pageScope.products}" var="isEmptyProducts">
                                    <c:forEach var="product" items="${pageScope.products}">
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="product text-center">
                                                <div class="mb-3 position-relative">
                                                    <div class="badge text-white badge-"></div><a class="d-block" href="MainController?action=loadDetailProduct&detailProductID=${pageScope.product.id}" ><img class="img-fluid w-100" src="${pageScope.product.imageLink}" alt="..."></a>
                                                    <div class="product-overlay">
                                                        <ul class="mb-0 list-inline">
                                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="MainController?action=loadUpdateProduct&updateProductID=${pageScope.product.id}"><i class="fas fa-edit"></i></a></li>
                                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="MainController?action=searchProduct&deleteProductID=${pageScope.product.id}"><i class="fas fa-trash-alt"></i></a></li>
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
                                            <li class="page-item <c:if test="${pageScope.page == pageScope.counter}" > active </c:if>"><a class="page-link" href="MainController?action=changePage&newPage=${pageScope.counter}">${pageScope.counter}</a></li>
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
        <c:if test="${not empty pageScope.deleteProductID}" >
            <script>
                $(document).ready(function () {
                    // Show the Modal on load
                    $("#deleteModal").modal("show");
                });
            </script> 
        </c:if>
        <c:if test="${not empty pageScope.productUpdate}" >
            <script>
                $(document).ready(function () {
                    // Show the Modal on load
                    $("#editModal").modal("show");
                });
            </script> 
        </c:if>
        <c:if  test="${not empty pageScope.productDetail}">
            <script>
                $(document).ready(function () {
                    // Show the Modal on load
                    $("#productView").modal("show");
                });
            </script> 
        </c:if>
        <%@include  file="footer.jsp" %>