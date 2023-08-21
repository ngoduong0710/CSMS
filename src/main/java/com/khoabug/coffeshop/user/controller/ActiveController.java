package com.khoabug.coffeshop.user.controller; /**
 * @author : KhoaBug
 * @since : 8/16/2023 ,Wed
 */

import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import com.khoabug.coffeshop.user.model.User;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "ActiveController", value = "/active-user")
public class ActiveController extends HttpServlet {
    private final String DEACTIVATE = "deactivate";
    private final String ACTIVATE = "reactivate";

    @Inject
    private UserRepository repository;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("currentId");
        String action = request.getParameter("action");
        Optional<User> user = repository.findById(id);

        if (user.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (action.equals(ACTIVATE)) {
            user.get().setActive(true);
        } else {
            user.get().setActive(false);
        }
        repository.save(user.get());
        response.sendRedirect(request.getContextPath() + "/users?page=1&size=10");
    }
}
