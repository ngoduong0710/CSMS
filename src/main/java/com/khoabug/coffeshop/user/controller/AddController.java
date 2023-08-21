package com.khoabug.coffeshop.user.controller;

import com.khoabug.coffeshop.common.services.PBKDF2Hasher;
import com.khoabug.coffeshop.common.services.RandomPasswordGenerator;
import com.khoabug.coffeshop.common.services.RequestMapper;
import com.khoabug.coffeshop.role.infrastructure.repository.RoleRepository;
import com.khoabug.coffeshop.role.model.Role;
import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import com.khoabug.coffeshop.user.model.UserRegisterDTO;
import jakarta.inject.Inject;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import static com.khoabug.coffeshop.user.listener.SendPassword.SendInfo;

@WebServlet(name = "AddController", value = "/add-user")
public class AddController extends HttpServlet {
    private final String SEND_INFO = "info";
    private final String SUCCESS_MESSAGE = "successMessage";
    private final String ERROR_MESSAGE = "errorMessage";
    private final String ADD_USER_JSP_PATH = "/WEB-INF/jsp/user-management-add-user.jsp";

    @Inject
    private UserRepository userRepository;
    @Inject
    private RoleRepository roleRepository;
    @Inject
    private PBKDF2Hasher pbkdf2Hasher;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Role> roles = roleRepository.findAll();
        if (roles.isEmpty()) {
            request.setAttribute(ERROR_MESSAGE,"Danh sách quyền còn trống");
        } else {
            request.setAttribute("roles", roleRepository.findAll());
        }
        request.getRequestDispatcher(ADD_USER_JSP_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserRegisterDTO registerUser = RequestMapper.toModel(UserRegisterDTO.class, request);

        if (userRepository.isExistEmail(registerUser.getEmail())) {
            String password = RandomPasswordGenerator.generateSecureRandomPassword();
            String hashedPassword = pbkdf2Hasher.hash(password.toCharArray());
            registerUser.setPassword(hashedPassword);
            userRepository.save(registerUser);

            ServletContext context = request.getServletContext();
            context.setAttribute(SEND_INFO, new SendInfo(registerUser.getEmail(), password));
            request.setAttribute(SUCCESS_MESSAGE, "Tạo tài khoản thành công!");
        } else {
            request.setAttribute(ERROR_MESSAGE, "Tài khoản đã tồn tại trong hệ thống.");
        }
        request.getRequestDispatcher(ADD_USER_JSP_PATH).forward(request, response);
    }
}
