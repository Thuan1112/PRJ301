
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<body>
    <c:set scope="page" var="txtSearch" value="${sessionScope.txtSearch}"/>
    <c:set scope="page" var="bills" value="${requestScope.bills}"/>
    <c:set scope="page" var="minDate" value="${sessionScope.minDate}"/>
    <c:set scope="page" var="maxDate" value="${sessionScope.maxDate}"/>
    <c:set scope="page" var="productsInBill" value="${requestScope.productsInBill}"/>

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
                                <!-- Link--><a class="nav-link" href="MainController?action=searchProduct">Shop</a>
                            </li>
                            <li class="nav-item">
                                <!-- Link--><a class="nav-link active" href="MainController?action=searchHistory">History Shopping</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">               
                            <li class="nav-item"><a class="nav-link" href="MainController?action=cart"> <i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Cart</a></li>
                            <li class="nav-item"><a class="nav-link" href="MainController" > <i class="fas fa-user-alt mr-1 text-gray"></i>Log out</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <div class="container">
            <!-- HERO SECTION-->
            <section class="py-5 bg-light">
                <div class="container">
                    <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                        <div class="col-lg-6">
                            <h1 class="h2 text-uppercase mb-0">History Shopping</h1>
                        </div>
                        <div class="col-lg-6 text-lg-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                    <li class="breadcrumb-item"><a href="MainController?action=index">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">History Shopping</li>
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
                                    <div class="col-sm-5 pl-sm-0"><input class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" type="submit" name="action" value="Search bill"/></div>
                                </form>
                            </div>
                            <h5 class="text-uppercase mb-4">Shopping date</h5>
                            <div class="mb-5">
                                <form action="MainController" method="POST">
                                    <table class="table">
                                        <tr>
                                            <td>FROM</td>
                                            <td>
                                                <input type="text" id="timeCheckIn" class="form-control" name="minDate" value="${pageScope.minDate}" required="true" readonly="true"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>TO</td>
                                            <td>
                                                <input type="text" id="timeCheckOut" class="form-control" name="maxDate" value="${pageScope.maxDate}" required="true" readonly="true"/>
                                            </td>
                                        </tr>
                                    </table>    
                                    <input type="submit" name="action" class="btn btn-dark btn-sm" value="Search date"/>
                                </form>
                            </div>
                        </div>
                        <!-- SHOP LISTING-->
                        <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">

                            <div class="row">
                                <!-- HISTORY-->
                                <c:if scope="page" test="${not empty pageScope.bills}" var="isEmptyBills">
                                    <c:forEach var="bill" items="${pageScope.bills}">
                                        <details class="w-100">
                                            <summary class="w-100"><span class="col">ID: ${pageScope.bill.id}</span><span class="col">Total: $${pageScope.bill.total}</span><span class="col">Shopping date: ${pageScope.bill.createDate}</span><span class="col">Payment method: ${pageScope.bill.paymentMethod}</span></summary>
                                            <div class="table-responsive mb-4">
                                                <table class="table">
                                                    <thead class="bg-light">
                                                        <tr>
                                                            <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Product</strong></th>
                                                            <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Price</strong></th>
                                                            <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Quantity</strong></th>
                                                            <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Total</strong></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="productInCart" items="${pageScope.bill.productList}">
                                                            <tr>
                                                                <th class="pl-0 border-0" scope="row">
                                                                    <div class="media-body ml-3"><strong class="h6">${pageScope.productInCart.name}</strong></div>
                                                                </th>
                                                                <td class="align-middle border-0">
                                                                    <p class="mb-0 small">$${pageScope.productInCart.price}</p>
                                                                </td>
                                                                <td class="align-middle border-0">
                                                                    <div class="border d-flex align-items-center justify-content-between px-3">
                                                                        <input class="form-control form-control-sm border-0 shadow-0 p-0 col" type="number" value="${pageScope.productInCart.quantity}" name="quantity" min="1" max="${pageScope.productInCart.maxQuantity}" required="true"/>
                                                                    </div>
                                                                </td>
                                                                <td class="align-middle border-0">
                                                                    <p class="mb-0 small">$${pageScope.productInCart.price * pageScope.productInCart.quantity}</p>
                                                                </td>
                                                            </tr>
                                                            <c:set scope="page" var="total" value="${pageScope.total+(pageScope.productInCart.price * pageScope.productInCart.quantity)}"/>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </details>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${not pageScope.isEmptyBills}">
                                    <h2 class="h2 text-uppercase mb-0">NO BILL</h2>
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

        <script>
            $(function () {
                'use strict';
                var checkin = $('#timeCheckIn').datepicker().on('changeDate', function (ev) {

                    var newDate = new Date(checkin.date)
                    newDate.setDate(newDate.getDate() + 1);
                    checkout.setValue(newDate);
                    checkin.hide();
                    $('#timeCheckOut')[0].focus();
                }).data('datepicker');
                var checkout = $('#timeCheckOut').datepicker({
                    onRender: function (date) {
                        return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
                    }
                }).on('changeDate', function (ev) {
                    checkout.hide();
                }).data('datepicker');
            });
        </script>

        <%@include  file="footer.jsp" %>