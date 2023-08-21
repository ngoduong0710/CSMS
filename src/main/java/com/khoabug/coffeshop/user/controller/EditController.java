package com.khoabug.coffeshop.user.controller; /**
 * @author : KhoaBug
 * @since : 8/16/2023 ,Wed
 */

import com.khoabug.coffeshop.common.services.RequestMapper;
import com.khoabug.coffeshop.role.infrastructure.repository.RoleRepository;
import com.khoabug.coffeshop.role.model.Role;
import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import com.khoabug.coffeshop.user.model.User;
import com.khoabug.coffeshop.user.model.UserRegisterDTO;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "EditController", value = "/edit-user")
public class EditController extends HttpServlet {
    private final String SUCCESS_MESSAGE = "successMessage";
    private final String ERROR_MESSAGE = "errorMessage";
    private final String EDIT_USER_JSP_PATH = "/WEB-INF/jsp/user-management-edit-user.jsp";

    @Inject
    private RoleRepository roleRepository;
    @Inject
    private UserRepository userRepository;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            request.setAttribute("roles", roleRepository.findAll());
            request.setAttribute("user", user.get());
            request.getRequestDispatcher(EDIT_USER_JSP_PATH).forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserRegisterDTO updateUserInfo = RequestMapper.toModel(UserRegisterDTO.class, request);
        Optional<User> persistUser = userRepository.findById(updateUserInfo.getId());

        if (persistUser.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (persistUser.get().getEmail().equals(updateUserInfo.getEmail())) {
            updateBasicInfo(persistUser, updateUserInfo);
            request.setAttribute(SUCCESS_MESSAGE, "Lưu thông tin thành công!");
        } else if (userRepository.findEmailByEmailNotById(updateUserInfo.getId(),
                updateUserInfo.getEmail()).isEmpty()) {
            updateBasicInfo(persistUser, updateUserInfo);
            request.setAttribute(SUCCESS_MESSAGE, "Lưu thông tin thành công!");
        } else {
            request.setAttribute(ERROR_MESSAGE, "Email đã tồn tại trong hệ thống.");
        }
        request.setAttribute("currentId", updateUserInfo.getId());
        request.getRequestDispatcher(EDIT_USER_JSP_PATH).forward(request, response);
    }

    private void updateBasicInfo(Optional<User> persistUser, UserRegisterDTO basicInfo) {
        User updatedUser = persistUser.get();
        updatedUser.setName(basicInfo.getName());
        updatedUser.setRole(new Role(basicInfo.getRoleId()));
        updatedUser.setEmail(basicInfo.getEmail());
        userRepository.save(updatedUser);
    }
}
