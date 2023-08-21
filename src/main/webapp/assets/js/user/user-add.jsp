<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    <c:if test="${not empty requestScope.errorMessage}">
    Swal.fire({
        title: "Loi",
        text: "${requestScope.errorMessage}",
        icon: 'error',
        allowOutsideClick: false
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace("add-user");
        }
    });
    </c:if>
    <c:if test="${not empty requestScope.successMessage}">
    Swal.fire({
        title: "Hoan tat",
        text: "${requestScope.successMessage}",
        icon: 'success',
        allowOutsideClick: false
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace("add-user");
        }
    });
    </c:if>
</script>