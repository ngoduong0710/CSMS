<%-- 
    Document   : Bill
    Created on : Aug 4, 2023, 9:06:02 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Doze Cafe</title>
        <link rel="stylesheet" type="text/css" href="css/styleKhoi.css">
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .close{
                font-size: 25px;
                cursor: pointer;
                border-radius: 50%;
            }

            .close:hover{
                color: red;
                background-color: #fff;
            }
        </style>
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
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Heading (Addons)-->
                            <div class="sidenav-menu-heading">Coffee Store</div>
                            <!-- Sidenav Link (Tables)-->
                            <a class="nav-link" href="#">
                                Home
                            </a>
                            <a class="nav-link" href="viewDrinks?navbar=drink">Drink</a>
                            <a class="nav-link" href="viewDrinks?navbar=bill">Bill</a>
                            <a class="nav-link" href="viewIngredient">Ingredient</a>
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
                    <div class="system-bill-coffee">
                        <div class="row">
                            <div class="col-md-6 ui-1">
                                <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2" style="background-color: #607D8B">
                                    <!-- Container wrapper -->
                                    <div class="container-fluid">

                                        <!-- Navbar brand -->
                                        <a class="navbar-brand" href="#">Categories:</a>

                                        <!-- Toggle button -->
                                        <button 
                                            class="navbar-toggler" 
                                            type="button" 
                                            data-mdb-toggle="collapse" 
                                            data-mdb-target="#navbarSupportedContent2" 
                                            aria-controls="navbarSupportedContent2" 
                                            aria-expanded="false" 
                                            aria-label="Toggle navigation">
                                            <i class="fas fa-bars"></i>
                                        </button>

                                        <!-- Collapsible wrapper -->
                                        <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                                                <!-- Link -->
                                                <li class="nav-item acitve">
                                                    <a class="nav-link text-white" href="convert?cid=C0">All</a>
                                                </li><!-- comment -->
                                                
                                                <c:forEach items="${sessionScope.listCa}" var="ca">
                                                    <li class="nav-item">
                                                        <a class="nav-link text-white" href="convertDrink?cid=${ca.id}">${ca.name}</a>
                                                    </li>
                                                </c:forEach>
                                           </ul>

                                            <!-- Search -->
                                            <form action="search" class="w-auto py-1" style="max-width: 12rem">
                                                <input name="txt" type="search" class="form-control rounded-0" placeholder="Search" aria-label="Search">
                                            </form>

                                        </div>
                                    </div>
                                    <!-- Container wrapper -->
                                </nav>
                                <div class="row">
                                    <c:forEach items="${sessionScope.listDrink}" var="dri" >
                                        <div onclick="getInfoDrink(${dri})" class="col-md-4 item-coffee">
                                            <img src="${dri.pathImage}" alt="">
                                            <div class="name-coffee">${dri.name}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-md-6 ui-2">
                                <table id='bill-process' class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                                <div class="payment">
                                    <div class="total">
                                        <div class="total-title">Total quantity</div>
                                        <div class="total-number quantity">0</div>
                                    </div>
                                    <div class="total">
                                        <div class="total-title">Total money</div>
                                        <div class="total-number money">0</div>
                                    </div>
                                    <div class="action">
                                        <button onclick="showContentBill()" class="btn btn-primary ms-1" type="button" data-bs-toggle="modal" data-bs-target="#show-bill">
                                            Create Bill
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bill Modal HTML -->
                    <div id="show-bill" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="add" method="post">
                                    <div>						
                                        <div class="modal-title">Bill Payment</div>
                                        <hr>
                                        <div class="info">
                                            <div class="info-title">
                                                Date:
                                            </div>&nbsp;&nbsp;
                                            <div class="info-content date">
                                                
                                            </div>
                                        </div>
                                        <div class="info">
                                            <div class="info-title">
                                                Time:
                                            </div>&nbsp;&nbsp;
                                            <div class="info-content time">
                                                
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="modal-body">	
                                        <table id='bill-complete' class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Price/1 drink</th>
                                                    <th scope="col">Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="payment">
                                        <div class="total" style="color: black">
                                            <div class="total-title">Total quantity</div>
                                            <div class="total-number quantity-bill"></div>
                                        </div>
                                        <div class="total" style="color: black">
                                            <div class="total-title">Total money</div>
                                            <div class="total-number money-bill"></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="cancelBill()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <input onClick="sendBillToServlet()" type="button" class="btn btn-success" value="Add">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl text-center px-4 small">Copyright © CSMS 2023</div>
                </footer>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/handleBill.js"></script>
        
    </body>
</html>
