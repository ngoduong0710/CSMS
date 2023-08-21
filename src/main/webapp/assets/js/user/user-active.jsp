<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="./active-user" method="post" id="activeForm" hidden>
    <input id="current-id" name="currentId" hidden>
    <input id="action" name="action" hidden>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $('button.deactivate').on('click', function () {
            Swal.fire({
                title: `Huy kich hoat`,
                text: "Ban co chac chan muon huy kich hoat",
                icon: 'question',
                showDenyButton: true,
                allowOutsideClick: false,
                confirmButtonText: 'Co',
                denyButtonText: `Khong`,
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#current-id').val($(this).val())
                    $('#action').val('deactivate')
                    $('#activeForm').submit();
                } else if (result.isDenied) {
                    Swal.fire('Thay doi khong duoc luu', '', 'info')
                }
            });
        });
    });
    $(document).ready(function () {
        $('button.reactivate').on('click', function () {
            Swal.fire({
                title: `Tai kich hoat`,
                text: "Ban co chac chan muon tai kich hoat",
                icon: 'question',
                showDenyButton: true,
                allowOutsideClick: false,
                confirmButtonText: 'Co',
                denyButtonText: `Khong`,
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#current-id').val($(this).val())
                    $('#action').val('reactivate')
                    $('#activeForm').submit();
                } else if (result.isDenied) {
                    Swal.fire('Thay doi khong duoc luu', '', 'info')
                }
            });
        });
    });


</script>