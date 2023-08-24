<%--
  Created by IntelliJ IDEA.
  User: KhoaBug
  Date: 8/21/2023
  Time: 2:41 AM
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
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace("profile");
        }
    });
    </c:if>
    <c:if test="${not empty requestScope.successMessage}">
    Swal.fire({
        title: "Hoàn tất",
        text: "${requestScope.successMessage}",
        icon: 'success',
        allowOutsideClick: false
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace("profile");
        }
    });
    </c:if>

    $(document).ready(function () {
        $('button.sure').on('click', function () {
            Swal.fire({
                title: `Lưu thay đổi`,
                text: "Bạn có chắc muốn lưu thay đổi",
                icon: 'question',
                showDenyButton: true,
                allowOutsideClick: false,
                confirmButtonText: 'Lưu',
                denyButtonText: `Hủy`,
            }).then((result) => {
                if (result.isConfirmed) {
                    $('button.summit').click();
                } else if (result.isDenied) {
                    Swal.fire('Thay doi khong duoc luu', '', 'info')
                }
            });
        });
    });


</script>
</html>
