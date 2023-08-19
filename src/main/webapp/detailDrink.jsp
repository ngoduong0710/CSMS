<%-- 
    Document   : detailDrink
    Created on : Aug 5, 2023, 9:49:27 AM
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
        <title>Thức uống - CSMS</title>
        <!-- bootstrap css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <script data-search-pseudo-elements defer src="./assets/js/all.min.js"></script>
        <script src="./assets/js/feather.min.js"></script>
    </head>
    <body class="nav-fixed">
        <%
            if (session == null || session.getAttribute("email") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="nav-bar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-5">
                        <!--Grid row-->
                        <div class="row">
                            <c:set var="dri" value="${requestScope.getedDri}"/>
                            <!--Grid column-->
                            <div class="col-md-6 mb-4 p-4">
                                <img src="${dri.pathImage}" class="img-fluid" style="height: 382px; width: 500px" alt="" />
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-6 mb-4">
                                <!--Content-->
                                <div class="p-4">
                                    <div class="mb-3">
                                        <a href="">
                                            <span class="badge bg-dark me-1">${dri.ca.name}</span>
                                        </a>
                                        <a href="">
                                            <span class="badge bg-info me-1">New</span>
                                        </a>
                                        <a href="">
                                            <span class="badge bg-danger me-1">Bestseller</span>
                                        </a>
                                    </div>

                                    <p class="lead">
                                        <span>Name Drink: ${dri.name}</span><br>
                                        <span>Status: ${dri.status ? "Available" : "Unavailable"}</span>
                                    </p>

                                    <p class="lead">
                                        <span>Price: </span>
                                        <!--<span class="me-1">
                                            <del> ${dri.price*120/100} vnd</del>
                                        </span>-->
                                        <span>${dri.price} vnd</span>
                                    </p>

                                    <br>
                                    <strong>
                                        <p style="font-size: 20px; margin: 0;">Description</p>
                                    </strong>
                                    <p style="font-size: 18px; margin: 0;">${dri.name} là 1 loai do uong cua CSMS chung toi voi nhieu
                                        chat dinh duong can thiet . Loai do uong nay duoc che bien tu cac nguyen lieu cua hang san xuat 
                                        Hun kid , nhan vien pha che phai lam day du cac buoc de lam ra 1 loai do uong.</p>
                                    <br>
                                    <div class="d-flex justify-content-left">
                                        <!-- Default input -->
                                        <button 
                                            class="btn btn-primary ms-1" 
                                            type="button" data-bs-toggle="modal" 
                                            data-bs-target="#deleteDrink"
                                        >
                                            <a href="viewDrinks?navbar=drink">Back</a>
                                        </button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button 
                                            class="btn btn-primary ms-1" 
                                            type="button" data-bs-toggle="modal" 
                                            data-bs-target="#editDrink" 
                                            onclick="showOldDataWhenEdit(['${dri.id}','${dri.name}','${dri.pathImage}','${dri.price}','${dri.status}','${dri.ca.id}'])"
                                        >
                                            Edit
                                        </button>                                        
                                    </div>
                                </div>
                                <!--Content-->
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->

                        <hr />

                        <!--Grid row-->
                        <div class="row d-flex justify-content-center">
                            <!--Grid column-->
                            <div class="col-md-6 text-center">
                                <h4 class="my-4 h4">Additional information</h4>

                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus suscipit modi sapiente illo soluta
                                    odit voluptates, quibusdam officia. Neque quibusdam quas a quis porro? Molestias illo neque eum
                                    in laborum.</p>
                            </div>
                            <!--Grid column-->
                            
                        </div>
                        <!--Grid row--> 
                </main>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
                                        
        <!-- Edit form -->
        <div id="editDrink" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editDrink" method="POST">
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
                                <label>pathImage</label>
                                <input name="pathImage" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" id="edit-se" class="form-select" aria-label="Default select example">
                                    <option value="1">available</option>
                                    <option value="0">unavailable</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" id="edit-se" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${sessionScope.listCa}" var="ca">
                                        <option value="${ca.id}">${ca.name}</option>
                                    </c:forEach>
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
          
        <script src="./assets/js/sb-customizer.js"></script>
        <script src="./assets/js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>        
        <script>
            function showOldDataWhenEdit(arr){
                var formEdit = document.querySelector('#editDrink form');
                var i = 0;
                var listInput = formEdit.querySelectorAll('.modal-body .form-group input');

                listInput.forEach((input)=>{
                    input.value = arr[i++];              
                })

                // take element select>option
                var selectEle = formEdit.querySelector('.modal-body .form-group select[name="category"]');
                console.log(selectEle.options);
                Array.from(selectEle.options).forEach((option)=>{
                    if(option.value == arr[arr.length - 1]) option.selected = true;
                })

                var selectEle = formEdit.querySelector('.modal-body .form-group select[name="status"]');
                console.log(selectEle.options);
                Array.from(selectEle.options).forEach((option)=>{
                    if(option.value == arr[arr.length - 2]) option.selected = true;
                })
            }
        </script>
    </body>
</html>
