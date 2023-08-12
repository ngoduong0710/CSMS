<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Tài khoản - Hồ sơ - CSMS</title>
        <link href="./assets/css/styles.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="./assets/image/favicon.png">
        <script data-search-pseudo-elements defer src="./assets/js/all.min.js"></script>
        <script src="./assets/js/feather.min.js"></script>
    </head>
    <body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
            id="sidenavAccordion" aria-label="topnav">
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
            <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="home.jsp">CSMS</a>
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ms-auto">
                <!-- User Dropdown-->
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage"
                        href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        <img class="img-fluid" src="./assets/image/profile.png" alt="avatar">
                    </a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
                        aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="assets/image/profile.png" alt="avatar">
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">Quản trị viên</div>
                                <div class="dropdown-user-details-email">admin@gmail.com</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="account-profile.jsp">
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
                <nav class="sidenav shadow-right sidenav-light" aria-label="sidenav">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Heading (Addons)-->
                            <div class="sidenav-menu-heading">Mẫu</div>
                            <!-- Sidenav Link (Tables)-->
                            <a class="nav-link" href="tables.jsp">
                                <div class="nav-link-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout">
                                        <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="3" y1="9" x2="21" y2="9"></line>
                                        <line x1="9" y1="21" x2="9" y2="9"></line>
                                    </svg></div>
                                Bảng
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
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-xl px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                    height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-user">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg></div>
                                            Tài khoản
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Account page navigation-->
                        <nav class="nav nav-borders" aria-label="subnav">
                            <a class="nav-link active ms-0" href="account-profile.jsp">Hồ sơ</a>
                            <a class="nav-link" href="account-security.jsp">Bảo mật</a>
                        </nav>
                        <hr class="mt-0 mb-4">
                        <div class="row d-flex justify-content-center">
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">Chi tiết tài khoản</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- Profile picture card-->
                                            <div class="card-body text-center">
                                                <!-- Profile picture image-->
                                                <img class="img-account-profile rounded-circle mb-2" src="assets/image/profile.png"
                                                    alt="">
                                                <!-- Profile picture help block-->
                                                <div class="small font-italic text-muted mb-4">Định dạng JPG hoặc PNG dưới 5 MB
                                                </div>
                                                <!-- Profile picture upload button-->
                                                <button class="btn btn-primary" type="button">Tải hình ảnh lên</button>
                                            </div>
                                            <!-- Form Group (username)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputUsername">Tên đăng nhập</label>
                                                <input class="form-control" id="inputUsername" type="text"
                                                    placeholder="Nhập tên tài khoản của bạn" value="admin">
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (full name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputFullName">Họ và tên</label>
                                                    <input class="form-control" id="inputFullName" type="text"
                                                        placeholder="Nhập họ và tên của bạn" value="Quản trị viên">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputGender">Giới tính</label>
                                                    <input class="form-control" id="inputGender" type="text"
                                                        placeholder="Nhập giới tính của bạn" value="Nam">
                                                </div>
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (phone number)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                    <input class="form-control" id="inputPhone" type="tel"
                                                        placeholder="Nhập số điện thoại của bạn" value="0987******">
                                                </div>
                                                <!-- Form Group (birthday)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputBirthday">Ngày sinh</label>
                                                    <input class="form-control" id="inputBirthday" type="text"
                                                        name="birthday" placeholder="Nhập ngày sinh của bạn"
                                                        value="04/08/2023">
                                                </div>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <input class="form-control" id="inputEmailAddress" type="email"
                                                    placeholder="Nhập địa chỉ email của bạn" value="admin@gmail.com">
                                            </div>
                                            <!-- Form Group (location)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputLocation">Địa chỉ</label>
                                                <input class="form-control" id="inputLocation" type="text"
                                                    placeholder="Nhập địa chỉ của bạn" value="Quy Nhơn, Bình Định">
                                            </div>
                                            <!-- Save changes button-->
                                            <div class="d-flex justify-content-center">
                                                <button class="btn btn-primary" type="button">Lưu thay đổi</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl text-center px-4 small">Copyright © CSMS 2023</div>
                </footer>
            </div>
        </div>
        <script src="./assets/js/custom-bundle.min.js"></script>
        <script src="./assets/js/scripts.js"></script>
        <script src="./assets/js/sb-customizer.js"></script>
    </body>
</html>
