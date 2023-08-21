package com.khoabug.coffeshop.user.controller; /**
 * @author : DangKhoa
 * @since : 3/11/2023, Sat
 **/

import com.khoabug.coffeshop.common.paging.Pageable;
import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UserController", urlPatterns = {"/users"})
public class UserController extends HttpServlet {

    @Inject
    private UserRepository repository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pageable pageable = Pageable.of(
                null,
                request,
                repository.count()
        );
        request.setAttribute("users", repository.findAll(pageable));
        request.setAttribute("page", pageable);
        request.getRequestDispatcher("/WEB-INF/jsp/user-management-list.jsp").forward(request, response);
    }

}
