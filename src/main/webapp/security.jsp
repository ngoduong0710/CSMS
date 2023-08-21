<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hồ sơ - CSMS</title>
    <link href="./assets/css/styles.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="./assets/image/favicon.png">
    <script data-search-pseudo-elements defer src="./assets/js/all.min.js"></script>
    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="./assets/js/feather.min.js"></script>
</head>
<body class="nav-fixed">
<%
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<jsp:include page="header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="navBar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                <div class="container-xl px-4">
                    <div class="page-header-content">
                        <div class="row align-items-center justify-content-between pt-3">
                            <div class="col-auto mb-3">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon">
                                        <i data-feather="user"></i>
                                    </div>
                                    Tài khoản
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Main page content-->
            <div class="container-xl px-4 mt-4">
                <!-- Account page navigation-->
                <nav class="nav nav-borders" aria-label="subnav">
                    <a class="nav-link ms-0" href="./profile">Hồ sơ</a>
                    <a class="nav-link active" href="./profile-change-pass">Bảo mật</a>
                </nav>
                <hr class="mt-0 mb-4">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <!-- Change password card-->
                        <div class="card mb-4">
                            <div class="card-header">Thay đổi mật khẩu</div>
                            <div class="card-body">
                                <form action="./profile-change-pass" method="post">
                                    <!-- Form Group (current password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="currentPassword">Mật khẩu hiện tại</label>
                                        <input class="form-control" id="currentPassword" type="password"
                                               name="currentPassword"
                                               placeholder="Nhập mật khẩu hiện tại" required>
                                    </div>
                                    <!-- Form Group (new password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="newPassword">Mật khẩu mới</label>
                                        <input class="form-control" id="newPassword" type="password"
                                               name="newPassword"
                                               placeholder="Nhập mật khẩu mới" required>
                                    </div>
                                    <!-- Form Group (confirm password)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="confirmPassword">Xác nhận mật khẩu</label>
                                        <input class="form-control" id="confirmPassword" type="password"
                                               placeholder="Xác nhận mật khẩu mới" required>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
    </div>
</div>
<script type="text/javascript">
    <c:if test="${not empty requestScope.errorMessage}">
    Swal.fire({
        title: "Loi",
        text: "${requestScope.errorMessage}",
        icon: 'error',
        allowOutsideClick: false
    })
    </c:if>
    <c:if test="${not empty requestScope.successMessage}">
    Swal.fire({
        title: "Hoan tat",
        text: "${requestScope.successMessage}",
        icon: 'success',
        allowOutsideClick: false
    })
    </c:if>

    var new_password = document.getElementById("newPassword");
    var confirm_password = document.getElementById("confirmPassword");

    function validatePassword() {
        if (new_password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Mật khẩu không khớp");
        } else {
            confirm_password.setCustomValidity('');
        }
    }
    new_password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
<script src="./assets/js/custom-bundle.min.js"></script>
<script src="./assets/js/scripts.js"></script>
<script src="./assets/js/sb-customizer.js"></script>
</body>
</html>