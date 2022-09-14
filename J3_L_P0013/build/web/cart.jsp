<%-- 
    Document   : cart
    Created on : Jan 20, 2021, 2:01:43 PM
    Author     : Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<div class="page-holder">
    <c:set scope="page" var="cart" value="${sessionScope.cart}"/>
    <c:set scope="page" var="total" value="0"/>
    <c:set scope="page" var="deleteProductID" value="${param.deleteProductID}"/>
    <!-- navbar-->
    <header class="header bg-white">
        <div class="container px-0 px-lg-3">
            <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="MainController?action=index"><span class="font-weight-bold text-uppercase text-dark">HANA SHOP</span></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <!-- Link--><a class="nav-link" href="MainController?action=index">Home</a>
                        </li>
                        <li class="nav-item">
                            <!-- Link--><a class="nav-link" href="MainController?action=searchProduct">Shop</a>
                        </li>
                        <li class="nav-item">
                            <!-- Link--><a class="nav-link" href="MainController?action=searchHistory">History Shopping</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">   
                        <li class="nav-item"><a class="nav-link active" href="#"> <i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Cart</a></li>                            
                        <li class="nav-item"><a class="nav-link" href="MainController" > <i class="fas fa-user-alt mr-1 text-gray"></i>Log out</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Modal Confirm delete -->
    <div id="deleteModal" class="modal fade" data-backdrop="static">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content text-center">
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
                        <input type="text" hidden="true" value="${pageScope.deleteProductID}" name="id"/>
                        <input type="submit" class="btn btn-danger" value="Delete product" name="action"/>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment Success Modal -->
    <div id="successModal" class="modal fade" data-backdrop="static">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <h4>Success!</h4>	
                    <p>Your payment is successful</p>
                    <a class="btn btn-dark" href="MainController?action=Cash Payment&status=1">OK</a>
                </div>
            </div>
        </div>
    </div>                    

    <!-- Check out Modal -->
    <div id="checkOutModal" class="modal fade">
        <div class="modal-dialog modal-login">
            <div class="modal-content">
                <div class="modal-header x-100 ">				
                    <h4 class="modal-title text-center">Check out</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="MainController" method="POST">
                        <div class="form-group">
                            <input type="hidden" name="status" value="0" />
                            <input class="btn btn-block btn-dark" name="action" value="Cash Payment" type="submit">
                        </div>
                        <div class="text-center text-gray">OR</div>
                        <div class="form-group">
                            <div id="paypal-button-container"></div>	
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Error Modal -->
    <div id="errorModal" class="modal fade">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-header justify-content-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body text-center">
                    <h4>Warning!</h4>	
                    <p>${requestScope.productError} are out of sufficient quantity</p>
                    <button class="btn btn-danger" data-dismiss="modal">Try Again</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment Fail Modal -->
    <div id="failModal" class="modal fade">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-header justify-content-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body text-center">
                    <h4>Fail!</h4>	
                    <p>Payment failed, please review the balance in your account.</p>
                    <button class="btn btn-dark" data-dismiss="modal">Try Again</button>
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
                        <h1 class="h2 text-uppercase mb-0">Cart</h1>
                    </div>
                    <div class="col-lg-6 text-lg-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                <li class="breadcrumb-item"><a href="MainController?action=index">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Cart</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <c:if test="${not empty pageScope.cart}">
            <section class="py-5 vh-100">
                <h2 class="h5 text-uppercase mb-4">Shopping cart</h2>
                <div class="row">
                    <div class="col-lg-8 mb-4 mb-lg-0">
                        <!-- CART TABLE-->
                        <div class="table-responsive mb-4">
                            <table class="table">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Product</strong></th>
                                        <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Price</strong></th>
                                        <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Quantity</strong></th>
                                        <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Total</strong></th>
                                        <th class="border-0" scope="col"> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="productInCart" items="${pageScope.cart}">
                                        <tr>
                                            <th class="pl-0 border-0" scope="row">
                                                <div class="media-body ml-3"><strong class="h6">${pageScope.productInCart.name}</strong></div>
                                            </th>
                                            <td class="align-middle border-0">
                                                <p class="mb-0 small">$${pageScope.productInCart.price}</p>
                                            </td>
                                            <td class="align-middle border-0">
                                                <div class="border d-flex align-items-center justify-content-between px-3">
                                                    <form action="MainController" method="POST" class="quantity row">
                                                        <input class="form-control form-control-sm border-0 shadow-0 p-0 col" type="number" value="${pageScope.productInCart.quantity}" name="quantity" min="1" max="${pageScope.productInCart.maxQuantity}" required="true"/>
                                                        <input type="hidden" name="id" value="${pageScope.productInCart.id}" />
                                                        <button class="btn-sm" type="submit" name="action" value="updateProductInCart"><i class="fas fa-edit small text-muted"></i></button>
                                                    </form>
                                                </div>
                                            </td>
                                            <td class="align-middle border-0">
                                                <p class="mb-0 small">$${pageScope.productInCart.price * pageScope.productInCart.quantity}</p>
                                            </td>
                                            <td class="align-middle border-0"><a class="reset-anchor" href="MainController?action=cart&deleteProductID=${pageScope.productInCart.id}"><i class="fas fa-trash-alt small text-muted"></i></a></td>
                                        </tr>
                                        <c:set scope="page" var="total" value="${pageScope.total+(pageScope.productInCart.price * pageScope.productInCart.quantity)}"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- CART NAV-->
                        <div class="bg-light px-4 py-3">
                            <div class="row align-items-center text-center">
                                <div class="col-md-6 mb-3 mb-md-0 text-md-left"><a class="btn btn-link p-0 text-dark btn-sm" href="MainController?action=searchProduct"><i class="fas fa-long-arrow-alt-left mr-2"> </i>Continue shopping</a></div>
                            </div>
                        </div>
                    </div>
                    <!-- ORDER TOTAL-->
                    <div class="col-lg-4">
                        <div class="card border-0 rounded-0 p-lg-4 bg-light">
                            <div class="card-body">
                                <h5 class="text-uppercase mb-4">Cart total</h5>
                                <div class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$${pageScope.total}</span></div>
                            </div>
                        </div>
                        <div class="card border-0 rounded-0 p-lg-4 bg-light">
                            <div class="card-body">
                                <a class="btn btn-outline-dark btn-sm" href="MainController?action=checkCart">Procceed to checkout<i class="fas fa-long-arrow-alt-right ml-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>
        <c:if test="${empty pageScope.cart}">
            <h1 class="text-center w-100 vh-100">NO PRODUCT IN CART</h1>
        </c:if>
    </div>
    <script src="https://www.paypal.com/sdk/js?client-id=${initParam["clienID"]}&currency=USD"></script>
    <script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function (data, actions) {
                return actions.order.create({
                    purchase_units: [{
                            amount: {
                                value: '${pageScope.total}'
                            }
                        }]
                });
            },

            // Finalize the transaction
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    $(document).ready(function () {
                        // Hide the Modal on load
                        $("#checkOutModal").modal("hide");
                    });
                    var errorDetail = Array.isArray(details) && details[0];

                    if (errorDetail && errorDetail.issue === 'INSTRUMENT_DECLINED') {
                        return actions.restart(); // Recoverable state, per:
                        // https://developer.paypal.com/docs/checkout/integration-features/funding-failure/
                    }
                    if (errorDetail) {
                        $(document).ready(function () {
                            // Show the Modal on load
                            $("#failModal").modal("show");
                        });
                        return;
                    }

                    // Show a success message to the buyer
                    $(document).ready(function () {
                        // Show the Modal on load
                        $("#successModal").modal("show");
                    });

                });
            }

        }).render('#paypal-button-container');

    </script>
    <c:if test="${not empty pageScope.deleteProductID}" >
        <script>
            $(document).ready(function () {
                // Show the Modal on load
                $("#deleteModal").modal("show");
            });
        </script> 
    </c:if>
    <c:if test="${requestScope.check != null}">
        <c:if test="${requestScope.check}" >
            <script>
                $(document).ready(function () {
                    // Show the Modal on load
                    $("#checkOutModal").modal("show");
                });
            </script> 
        </c:if>
        <c:if test="${not requestScope.check}" >
            <script>
                $(document).ready(function () {
                    // Show the Modal on load
                    $("#errorModal").modal("show");
                });
            </script> 
        </c:if>
    </c:if>
    <%@include file="footer.jsp" %>
