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

    private final String KEYWORD = "keyword";
    private final String USERS = "users";
    private final String PAGEABLE = "pageable";
    private final String USERS_JSP_PATH = "/WEB-INF/jsp/user-management-list.jsp";


    @Inject
    private UserRepository repository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String predicate = request.getParameter(KEYWORD);
        Pageable pageable = Pageable.of(
                null, request, 0
        );
        if (predicate == null || predicate.isBlank()) {
            pageable.setTotalItem(repository.count());
            request.setAttribute(USERS, repository.findAll(pageable));
        } else {
            pageable.setTotalItem(repository.countByIdOrEmailOrFullNameOrRole_Name(predicate));
            request.setAttribute(USERS, repository.findByIdOrEmailOrFullNameOrRole_Name(pageable, predicate));
            request.setAttribute(KEYWORD, predicate);
        }
        request.setAttribute(PAGEABLE, pageable);
        request.getRequestDispatcher(USERS_JSP_PATH).forward(request, response);
    }

}
