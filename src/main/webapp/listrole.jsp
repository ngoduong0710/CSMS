<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Vai trò - CSMS</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
        <link href="assets/css/styles.css" rel="stylesheet">
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
                            <div class="card-header">Danh sách vai trò</div>
                            <div class="card-body">
                                <table id="datatablesSimple" >
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Authorize</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.data}" var="c">
                                            <c:set var="id" value="${c.id}"/>
                                            <tr>
                                                <td>${id}</td>
                                                <td>${c.name}</td>
                                                <td>${c.authorize}</td>
                                                <td><a class="nav-link" href="editRole?id=${id}">
                                                        <button class="btn btn-datatable btn-icon btn-transparent-dark"   >
                                                            <i class="fa-solid fa-ellipsis-vertical"></i>
                                                        </button> Edit
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Authorize</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
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
