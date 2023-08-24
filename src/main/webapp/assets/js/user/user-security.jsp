<%--
  Created by IntelliJ IDEA.
  User: KhoaBug
  Date: 8/22/2023
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    <c:if test="${not empty requestScope.errorMessage}">
    Swal.fire({
        title: "Lỗi",
        text: "${requestScope.errorMessage}",
        icon: 'error',
        allowOutsideClick: false
    })
    </c:if>
    <c:if test="${not empty requestScope.successMessage}">
    Swal.fire({
        title: "Hoàn tất",
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
