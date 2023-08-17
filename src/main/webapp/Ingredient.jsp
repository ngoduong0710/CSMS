<%-- 
    Document   : Drink
    Created on : Aug 4, 2023, 9:06:10 AM
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
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="css/styleKhoi.css">
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <!-- font css -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

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
                    <div class="header_section">
                        <div class="coffee_section_1">
                            <div class="input-group" style="justify-content: center">
<!--                                <img src="./images/banner-img.png" alt="" width="50px" height="50px">-->
                                <div style="margin: 0 150px 0 20px; font-size: 25px;">Coffee shop</div>
                                <form action="searchIngredient" method="POST" style="display: flex">
                                    <input type="text" name="textName" class="form-control" placeholder="Enter text...">
                                    <div class="input-group-append" style="margin-left: 10px">
                                        <button class="btn btn-primary" type="submit">Search</button>
                                    </div>
                                </form>
                            </div>             
                        </div>
                        <!-- banner section start --> 
                        <!-- banner section end -->
                    </div>
                    <!-- header section end -->
                    <!-- coffee section start -->
                    <div class="coffee_section layout_padding">
                        <div class="container">
                            <div class="row">
                                <h1 class="coffee_taital">List Ingredient</h1>
                                <div class="d-flex justify-content-center">
                                    <div class="input-group-append">
                                        <button 
                                            class="btn btn-primary ms-1" 
                                            type="button" data-bs-toggle="modal" 
                                            data-bs-target="#addIngredient" 
                                        >
                                            Add a new ingredient
                                        </button> 
                                        <button 
                                            class="btn btn-primary ms-1" 
                                            type="button" data-bs-toggle="modal" 
                                            data-bs-target="#ingredientPerDay" 
                                        >
                                            Ingredient per day
                                        </button> 
                                    </div>
                                </div>
                                <div class="bulit_icon"><img src="images/bulit-icon.png"></div>
                            </div>
                        </div>
                        <div class="coffee_section_2"> 
                            <table id='bill-process' class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Weight</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Update</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.listNL}" var="nl">
                                        <tr>
                                            <th scope="row">${nl.id}</th>
                                            <td>${nl.name}</td>
                                            <td>${nl.weight}</td><!-- comment -->
                                            <td>${nl.date}</td><!-- comment -->
                                            <td>${nl.status}</td>
                                            <td>
                                                <button 
                                                    class="btn btn-primary ms-1" 
                                                    type="button" data-bs-toggle="modal" 
                                                    data-bs-target="#editIngredient" 
                                                    onclick="showOldDataWhenEdit(['${nl.id}','${nl.name}','${nl.weight}','${nl.date}','${dri.status}'])"
                                                >
                                                Edit
                                                </button>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>                      
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl text-center px-4 small">Copyright © CSMS 2023</div>
                </footer>
            </div>
        </div>
                                    
        <!-- Add form -->
        <div id="addIngredient" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addIngredient" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Information Drink</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Weight</label>
                                <input name="weight" type="number" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-info" value="Create">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Edit form -->
        <div id="editIngredient" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editIngredient" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Information Drink</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Id</label>
                                <input name="id" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Weight</label>
                                <input name="weight" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Date</label>
                                <input name="date" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" id="edit-se" class="form-select" aria-label="Default select example">
                                    <option value="1">available</option>
                                    <option value="0">unavailable</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Per day form -->
        <div id="ingredientPerDay" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 900px;">
                <div class="modal-content">
                    <form action="updateIngredientPerDay" method="POST">
                        <c:set var="listNLPD" value="${sessionScope.listNLPD}"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Ingredient Per Day</h4>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
                        </div>
                        <div class="row" style="margin:auto 0">
                            <c:forEach items="${sessionScope.listNLPD}" var="nlpd">
                                <div class="col-md-4 d-flex p-1">
                                    <label style="width: 40%; line-height: 3">${nlpd.nl.name}</label>
                                    <input name="weight" type="number" class="form-control" value='${nlpd.weight}' style="width: 50%">
                                </div>
                            </c:forEach>                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
                                    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script>            
            function showOldDataWhenEdit(arr){
                var formEdit = document.querySelector('#editIngredient form');
                var i = 0;
                var listInput = formEdit.querySelectorAll('.modal-body .form-group input');

                listInput.forEach((input)=>{
                    input.value = arr[i++];              
                })

                // take element select>option
                
                var selectEle = formEdit.querySelector('.modal-body .form-group select[name="status"]');
                console.log(selectEle.options);
                Array.from(selectEle.options).forEach((option)=>{
                    if(option.value == arr[arr.length - 1]) option.selected = true;
                })
            }
        </script>
    </body>
</html>
