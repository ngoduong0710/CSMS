<%--
  Created by IntelliJ IDEA.
  User: KhoaBug
  Date: 8/19/2023
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hồ sơ - CSMS</title>
    <link href="./assets/css/styles.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="./assets/image/favicon.png">
    <script data-search-pseudo-elements defer
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="assets/js/user/user-name-concat.js"></script>
    <script src="assets/js/sweetalert2.all.min.js"></script>
</head>
<body class="nav-fixed">
<%--<%--%>
<%--    if (session == null || session.getAttribute("email") == null) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>
<jsp:include page="/header.jsp"></jsp:include>
<div id="layoutSidenav">
    <jsp:include page="/navBar.jsp"></jsp:include>
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
                    <a class="nav-link active ms-0" href="./profile">Hồ sơ</a>
                    <a class="nav-link" href="./profile-change-pass">Bảo mật</a>
                </nav>
                <hr class="mt-0 mb-4">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">Chi tiết tài khoản</div>
                            <div class="card-body">
                                <form action="./profile" method="post" id="editForm">
                                    <!-- Profile picture card-->
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-account-profile rounded-circle mb-2"
                                             src="assets/image/profile.png"
                                             alt="">
                                        <!-- Profile picture help block-->
                                        <div class="small font-italic text-muted mb-4">Định dạng JPG hoặc PNG dưới 5 MB
                                        </div>
                                        <!-- Profile picture upload button-->
                                        <button class="btn btn-primary" type="button">Tải hình ảnh lên</button>
                                    </div>
                                    <!-- Form Row-->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (full name)-->
                                        <c:set var="fullName" value="${requestScope.user.name}"/>
                                        <c:set var="firstName" value="${fn:substringAfter(fullName, ' ')}"/>
                                        <c:set var="lastName" value="${fn:substringBefore(fullName, ' ')}"/>
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputLastName">Họ</label>
                                            <input class="form-control" id="inputLastName" type="text"
                                                   placeholder="Nhập họ của bạn" value="${lastName}"
                                                   title="Không chứa số và kí tự đặc biệt"
                                                   pattern="[\p{L} ]{1,7}" required
                                            >
                                        </div>
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputFirstName">Tên</label>
                                            <input class="form-control" id="inputFirstName" type="text"
                                                   title="Không chứa số và kí tự đặc biệt"
                                                   pattern="[\p{L} ]{1,35}" required
                                                   placeholder="Nhập tên của bạn" value="${firstName}">
                                        </div>
                                        <input name="name" id="inputFullName" type="hidden">
                                    </div>
                                    <!-- Form Row-->
                                    <div class=" mb-3">
                                        <!-- Form Group (gender)-->
                                        <label class="small mb-1">Giới tính</label>
                                        <select class="form-select" name="gender" aria-label="Default select example"
                                                required>
                                            <option selected="" value="" disabled="">Chọn giới tính:</option>
                                            <c:choose>
                                                <c:when test="${requestScope.user.gender}">
                                                    <option value="1" selected>Nam</option>
                                                    <option value="0">Nữ</option>
                                                </c:when>
                                                <c:when test="${requestScope.user.gender == false}">
                                                    <option value="1">Nam</option>
                                                    <option value="0" selected>Nữ</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="1">Nam</option>
                                                    <option value="0">Nữ</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputBirthday">Ngày sinh</label>
                                        <input class="form-control" id="inputBirthday" type="date"
                                               name="date" placeholder="Nhập ngày sinh của bạn"
                                               value="${requestScope.user.dob}" required>
                                    </div>
                                    <!-- Form Group (email address)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">Email</label>
                                        <input class="form-control" id="inputEmailAddress" type="email"
                                               placeholder="Nhập địa chỉ email của bạn" name="email"
                                               value="${requestScope.user.email}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="small mb-1" for="role">Quyền</label>
                                        <input class="form-control" id="role" disabled
                                               value="${requestScope.user.role.name}">
                                    </div>
                                    <!-- Save changes button-->
                                    <div class="d-flex justify-content-center">
                                        <button class="btn btn-primary sure" type="button">Lưu thay đổi
                                        </button>
                                        <button class="summit" type="submit" hidden></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/footer.jsp"></jsp:include>
    </div>
</div>
<script src="assets/js/scripts.js"></script>
<jsp:include page="/assets/js/user/user-profile.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
</body>
</html>
