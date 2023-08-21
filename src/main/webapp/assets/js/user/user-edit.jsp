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
            window.location.replace("edit-user?id=${requestScope.currentId}");
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
            window.location.replace("edit-user?id=${requestScope.currentId}");
        }
    });
    </c:if>

    $(document).ready(function () {
        $('button.sure').on('click', function () {
            Swal.fire({
                title: `Luu thay doi`,
                text: "Ban co chac chan muon luu thay doi",
                icon: 'question',
                showDenyButton: true,
                allowOutsideClick: false,
                confirmButtonText: 'Luu',
                denyButtonText: `Huy`,
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