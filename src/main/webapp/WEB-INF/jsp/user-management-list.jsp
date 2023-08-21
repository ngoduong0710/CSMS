<%--
  Created by IntelliJ IDEA.
  User: KhoaBug
  Date: 8/16/2023
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Nhan vien</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/styles.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/image/favicon.png">
    <script data-search-pseudo-elements defer
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="assets/js/sweetalert2.all.min.js"></script>
</head>

<body class="nav-fixed">
<jsp:include page="/header.jsp"></jsp:include>
<div id="layoutSidenav">
    <jsp:include page="/navBar.jsp"></jsp:include>
    <div id="layoutSidenav_content">
        <main>
            <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                <div class="container-fluid px-4">
                    <div class="page-header-content">
                        <div class="row align-items-center justify-content-between pt-3">
                            <div class="col-auto mb-3">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon">
                                        <i data-feather="user"></i>
                                    </div>
                                    Danh sách nhân viên
                                </h1>
                            </div>
                            <div class="col-12 col-xl-auto mb-3">
                                <a class="btn btn-sm btn-light text-primary" href="./add-user">
                                    <i class="me-1" data-feather="user-plus"></i>
                                    Thêm nhân viên
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main page content-->
            <div class="container-fluid px-4">
                <div class="card mb-4">
                    <div class="card-header">Nhân viên</div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Vai trò</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${requestScope.users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>${user.role.name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.active==true}">
                                                <span class="badge bg-green rounded-pill">Active</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-red rounded-pill">Non-active</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a class="btn btn-datatable btn-icon btn-transparent-dark me-2"
                                           href="./edit-user?id=${user.id}">
                                            <i data-feather="edit"></i>
                                        </a>
                                        <c:choose>
                                            <c:when test="${(user.active==true)}">
                                                <button class="btn btn-datatable btn-icon btn-transparent-dark deactivate"
                                                        value="${user.id}">
                                                    <i data-feather="trash-2"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-datatable btn-icon btn-transparent-dark me-2 reactivate"
                                                        value="${user.id}">
                                                    <i data-feather="rotate-ccw"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/footer.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="/assets/js/user/user-active.jsp"></jsp:include>
<script>
    window.addEventListener('DOMContentLoaded', event => {
        const datatablesSimple = document.getElementById('datatablesSimple');
        if (datatablesSimple) {
            new simpleDatatables.DataTable(datatablesSimple);
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="assets/js/scripts.js"></script>
<script src="assets/js/simple-datatables.js"></script>
<script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
</body>

</html>