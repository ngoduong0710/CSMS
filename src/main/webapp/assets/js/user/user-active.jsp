<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="./active-user" method="post" id="activeForm" hidden>
    <input id="current-id" name="currentId" hidden>
    <input id="action" name="action" hidden>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $('button.deactivate').on('click', function () {
            Swal.fire({
                title: 'Hủy kích hoạt',
                text: "Bạn chắc chắn muốn hủy kích hoạt",
                icon: 'question',
                showDenyButton: true,
                allowOutsideClick: false,
                confirmButtonText: 'Có',
                denyButtonText: 'Không',
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#current-id').val($(this).val())
                    $('#action').val('deactivate')
                    $('#activeForm').submit();
                } else if (result.isDenied) {
                    Swal.fire('Thay đổi không được lưu', '', 'info')
                }
            });
        });
    });
    $(document).ready(function () {
        $('button.reactivate').on('click', function () {
            Swal.fire({
                title: 'Tái kích hoạt',
                text: 'Bạn chắc chắn muốn tái kích hoạt',
                icon: 'question',
                showDenyButton: true,
                allowOutsideClick: false,
                confirmButtonText: 'Có',
                denyButtonText: 'Không',
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#current-id').val($(this).val())
                    $('#action').val('reactivate')
                    $('#activeForm').submit();
                } else if (result.isDenied) {
                    Swal.fire('Thay đổi không được lưu', '', 'info')
                }
            });
        });
    });
</script>