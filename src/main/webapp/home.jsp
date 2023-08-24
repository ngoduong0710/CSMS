<%--
  Created by IntelliJ IDEA.
  User: KhoaBug
  Date: 7/17/2023
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Affiliate Dashboard - SB Admin Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css" rel="stylesheet"/>
    <link href="assets/css/styles.css" rel="stylesheet"/>
    <script data-search-pseudo-elements="" defer=""
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.0/feather.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body class="nav-fixed">
<jsp:include page="/header.jsp"></jsp:include>

<div id="layoutSidenav">
    <jsp:include page="/navBar.jsp"></jsp:include>

    <div id="layoutSidenav_content">
        <main>
            <!-- Main page content-->
            <div class="container-xl px-4 mt-5">
                <!-- Custom page header alternative example-->
                <div class="d-flex justify-content-between align-items-sm-center flex-column flex-sm-row mb-4">
                    <div class="me-4 mb-3 mb-sm-0">
                        <h1 class="mb-0">Dashboard</h1>
                    </div>
                    <!-- Date range picker example-->
                    <form action="${pageContext.request.contextPath}/dashboard" method="get" id="dashboardForm">
                        <div class="input-group input-group-joined border-0 shadow" style="width: 16.5rem">
                            <span class="input-group-text">
                                <i data-feather="calendar"></i>
                            </span>
                            <input class="form-control ps-0 pointer" id="litepickerRangePlugin"
                                   placeholder="Select date range..." name="dateRange"/>
                        </div>
                    </form>
                </div>
                <!-- Illustration dashboard card example-->
                <div class="card card-waves mb-4 mt-5">
                    <div class="card-body p-5">
                        <div class="row align-items-center justify-content-between">
                            <div class="col">
                                <h2 class="text-primary">Chào mừng trở lại, bảng điều khiển của bạn đã sẵn sàng!</h2>
                                <button class="btn btn-primary p-3 test" type="submit" form="dashboardForm">
                                    Bắt đầu
                                    <i class="ms-1" data-feather="arrow-right"></i>
                                </button>
                            </div>
                            <div class="col d-none d-lg-block mt-xxl-n4">
                                <img class="img-fluid px-xl-4 mt-xxl-n5"
                                     src="assets/image/statistics.svg"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <!-- Dashboard info widget 1-->
                        <div class="card border-start-lg border-start-primary h-100">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-grow-1">
                                        <div class="small fw-bold text-primary mb-1">Tổng tiền</div>
                                        <div class="h5">${requestScope.bill.totalPrice}</div>
                                    </div>
                                    <div class="ms-2">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-200"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <!-- Dashboard info widget 2-->
                        <div class="card border-start-lg border-start-secondary h-100">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-grow-1">
                                        <div class="small fw-bold text-secondary mb-1">Tổng đơn hàng</div>
                                        <div class="h5">${requestScope.bill.bills.size()}</div>
                                    </div>
                                    <div class="ms-2">
                                        <i class="fas fa-tag fa-2x text-gray-200"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <!-- Dashboard info widget 3-->
                        <div class="card border-start-lg border-start-success h-100">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-grow-1">
                                        <div class="small fw-bold text-success mb-1">Ngày nhiều đơn hàng nhất</div>
                                        <div class="h5">${requestScope.bill.mostPriceDate}</div>
                                    </div>
                                    <div class="ms-2">
                                        <i class="fas fa-mouse-pointer fa-2x text-gray-200"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <!-- Dashboard info widget 4-->
                        <div class="card border-start-lg border-start-info h-100">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-grow-1">
                                        <div class="small fw-bold text-info mb-1">Đơn hàng nhiều nhất trong ngày</div>
                                        <div class="h5">${requestScope.bill.maxFreq}</div>
                                    </div>
                                    <div class="ms-2">
                                        <i class="fas fa-percentage fa-2x text-gray-200"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <!-- Illustration card example-->
                        <div class="card mb-4">
                            <div class="card-body text-center p-5">
                                <img class="img-fluid mb-5" src="assets/image/data-report.svg"/>
                                <h4>In báo cáo</h4>
                                <p class="mb-4">Tính năng đang được phát triển</p>
                                <a class="btn btn-primary p-3" href="#!">Continue</a>
                            </div>
                        </div>
                        <!-- Report summary card example-->
                        <div class="card mb-4">
                            <div class="card-header">Top đồ uống bán chạy</div>
                            <div class="list-group list-group-flush small">
                                <a class="list-group-item list-group-item-action" href="#!">
                                    <i class="fas fa-dollar-sign fa-fw text-blue me-2"></i>
                                    Tính năng đang được phát triển

                                </a>
                            </div>
                            <div class="card-footer position-relative border-top-0">
                            </div>
                        </div>
                        <!-- Progress card example-->

                    </div>
                    <div class="col-lg-8 mb-4">
                        <!-- Area chart example-->
                        <div class="card mb-4">
                            <div class="card-header">Tóm tắt doanh thu</div>
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart" width="100%" height="80"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/footer.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="/assets/js/dashboard/chart.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="assets/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js" crossorigin="anonymous"></script>
<script src="assets/js/dashboard/litepicker.js"></script>
<script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
</body>

</html>
