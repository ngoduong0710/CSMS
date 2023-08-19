<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hóa đơn - CSMS</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/styles.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/styleKhoi.css">
    <link rel="stylesheet" type="text/css" href="css/style1.css">
    <link rel="icon" type="image/x-icon" href="assets/image/favicon.png">
    <script data-search-pseudo-elements defer src="./assets/js/all.min.js"></script>
    <script src="./assets/js/feather.min.js"></script>
</head>
<body class="nav-fixed">
    <%
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <jsp:include page="header.jsp"></jsp:include>
    <div id="layoutSidenav">
        <jsp:include page="nav-bar.jsp"></jsp:include>
        <div id="layoutSidenav_content">
            <main>
                <!-- Main page content-->
                <div class="container-xl px-4 mt-5">
                    <div class="card mb-4">
                        <div class="card-header">View list bill</div>
                        <%--                            <div class="action">--%>
                        <%--                                <button onclick="showContentBill()" class="btn btn-primary ms-1" type="button" data-bs-toggle="modal" data-bs-target="#show-bill">--%>
                        <%--                                    Show Bill--%>
                        <%--                                </button>--%>
                        <%--                            </div>--%>
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Total Price</th>
                                <th>Create At</th>
                                <th>Create By</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.dt}" var="b">
                                <c:set var="id" value="${b.id}"/>
                                <tr>
                                    <td>${id}</td>
                                    <td>${b.totalPrice}</td>
                                    <td>${b.createdAt}</td>
                                    <td>${b.takeCreateBy}</td>
                                    <td>
                                        <button onclick="showContentBill()" class="btn btn-primary ms-1" type="button"
                                                data-bs-toggle="modal" data-bs-target="#show-bill">
                                            Show Bill
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Total Price</th>
                                <th>Create At</th>
                                <th>Create By</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

                <div id="show-bill" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="add" method="post">
                                <div>
                                    <div class="modal-title">Bill Payment</div>
                                    <hr>
                                </div>
                                <div class="modal-body">
                                    <table id='bill-complete' class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price/1 drink</th>
                                            <th scope="col">Quantity</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.da}" var="c">
                                            <c:set var="id" value="${c.id}"/>
                                            <tr>
                                                <td>${id}</td>
                                                <td>${c.bill_id}</td>
                                                <td>${c.drink_id}</td>
                                                <td>${c.price}</td>
                                                <td>${c.number}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="payment">
                                    <div class="total" style="color: black">
                                        <div class="total-title">Total money</div>
                                        <div class="total-number money-bill"></div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button onclick="cancelBill()" type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Cancel
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
    <script src="./assets/js/custom-bundle.min.js"></script>
    <script src="./assets/js/scripts.js"></script>
    <script src="./assets/js/simple-datatables.js"></script>
    <script src="./assets/js/datatables-simple-demo.js"></script>
    <script src="./assets/js/sb-customizer.js"></script>
</body>
</html>
