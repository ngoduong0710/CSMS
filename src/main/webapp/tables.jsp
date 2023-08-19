<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bảng - CSMS</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
        <link href="assets/css/styles.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="assets/image/favicon.png">
        <script data-search-pseudo-elements defer src="./assets/js/all.min.js"></script>
        <script src="./assets/js/feather.min.js"></script>
    </head>
    <body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
             id="sidenavAccordion">
            <!-- Sidenav Toggle Button-->
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                     class="feather feather-menu">
                <line x1="3" y1="12" x2="21" y2="12"></line>
                <line x1="3" y1="6" x2="21" y2="6"></line>
                <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </button>
            <!-- Navbar Brand-->
            <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="index.jsp">CSMS</a>
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ms-auto">
                <!-- User Dropdown-->
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage"
                       href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"><img class="img-fluid" src="assets/image/profile.png"></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
                         aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="assets/image/profile.png">
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">Quản trị viên</div>
                                <div class="dropdown-user-details-email">admin@gmail.com</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="account-security.jsp">
                            <div class="dropdown-item-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                                 stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                                </svg></div>
                            Tài khoản
                        </a>
                        <a class="dropdown-item" href="login.jsp">
                            <div class="dropdown-item-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                                 stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                <polyline points="16 17 21 12 16 7"></polyline>
                                <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg></div>
                            Đăng xuất
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Heading (Addons)-->
                            <div class="sidenav-menu-heading">Mẫu</div>
                            <!-- Sidenav Link (Tables)-->
                            <a class="nav-link" href="listRole">
                                <div class="nav-link-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout">
                                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="3" y1="9" x2="21" y2="9"></line>
                                    <line x1="9" y1="21" x2="9" y2="9"></line>
                                    </svg></div>
                                Bảng
                            </a>

                            <a class="nav-link" href="addRole.jsp">
                                <div class="nav-link-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout">
                                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="3" y1="9" x2="21" y2="9"></line>
                                    <line x1="9" y1="21" x2="9" y2="9"></line>
                                    </svg></div>
                                Thêm vai trò
                            </a>
                        </div>
                    </div>
                    <!-- Sidenav Footer-->
                    <div class="sidenav-footer">
                        <div class="sidenav-footer-content">
                            <div class="sidenav-footer-subtitle">Đăng nhập tại:</div>
                            <div class="sidenav-footer-title">Chưa biết</div>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-5">
                        <div class="card mb-4">
                            <div class="card-header">Danh sách vai trò</div>
                            <div class="card-body">
                                <table id="datatablesSimple" >
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Authorize</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.data}" var="c">
                                            <c:set var="id" value="${c.id}"/>
                                            <tr>
                                                <td>${id}</td>
                                                <td>${c.name}</td>
                                                <td>${c.authorize}</td>
                                                <td><a class="nav-link" href="editRole?id=${id}">
                                                        <button class="btn btn-datatable btn-icon btn-transparent-dark"   >
                                                            <i class="fa-solid fa-ellipsis-vertical"></i>
                                                        </button> Edit
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>



                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Authorize</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4 text-center small">© CSMS 2023</div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="assets/js/simple-datatables.js"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
        <script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
    </body>
</html>
