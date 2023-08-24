<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="./users" id="pageForm" method="get" hidden>
    <input name="page" id="page" value="1">
    <input name="size" value="10">
</form>
<script>
    $(document).ready(function () {
        $('#pagination').jqPaginator({
            totalPages: ${requestScope.pageable.totalPage},
            visiblePages: 5,
            currentPage: ${requestScope.pageable.page},
            prev: '<li class="prev"><a href="javascript:;">‹</a></li>',
            next: '<li class="next"><a href="javascript:;">›</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (num) {
                if (this.currentPage != num) {
                    $('#page').val(num),
                        $('#pageForm').submit()
                }
            }
        });
    })

    $('#keyword').keypress(function (e) {
        let key = e.which;
        if (key == 13) {
            $('#pageForm').submit();
            return false;
        }
    })
</script>