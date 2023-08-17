<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Đăng nhập - CSMS</title>
    <link href="./assets/css/styles.css" rel="stylesheet" type="text/css">
    <link rel="icon" type="image/x-icon" href="./assets/image/favicon.png">
    <script src="./assets/js/feather.min.js"></script>
    <script src="./assets/js/sweetalert2.all.min.js"></script>
</head>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <!-- Basic login form-->
                <div class="center">
                    <h1>ĐĂNG NHẬP</h1>
                    <div class="px-1 pb-5">
                        <form action="login" method="post">
                            <div class="txt_field">
                                <input id="username" name="username" type="text" value="" required>
                                <span></span>
                                <label for="username">Tên tài khoản</label>
                            </div>
                            <div class="txt_field">
                                <input id="password" name="password" type="password" required>
                                <span></span>
                                <label for="password">Mật khẩu</label>
                            </div>
                            <div class="forgot-pass-link small"><a href="forgot-password.jsp">Quên mật khẩu?</a></div>
                            <input type="submit" value="Đăng nhập">
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="footer-admin mt-auto footer-light">
                <div class="container-xl px-4 text-center small">Copyright © CSMS 2023</div>
            </footer>
        </div>
    </div>

    <c:if test="${not empty requestScope.errorMessage}">
        <script type="text/javascript">
            Swal.fire({
                title: 'Lỗi!',
                text: '${requestScope.errorMessage}',
                icon: 'error',
                confirmButtonText: 'OK'
            })
        </script>
    </c:if>
</body>
</html>
