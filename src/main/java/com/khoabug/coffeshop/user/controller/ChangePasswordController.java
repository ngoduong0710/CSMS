package com.khoabug.coffeshop.user.controller; /**
 * @author : KhoaBug
 * @since : 8/21/2023 ,Mon
 */

import com.khoabug.coffeshop.common.services.PBKDF2Hasher;
import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ChangePasswordController", value = "/profile-change-pass")
public class ChangePasswordController extends HttpServlet {

    private final String SECURITY = "security.jsp";
    private final String CURRENT_PASS = "currentPassword";
    private final String NEW_PASS = "newPassword";
    private final String SUCCESS_MESSAGE = "successMessage";
    private final String ERROR_MESSAGE = "errorMessage";
    private final String ID ="id";

    @Inject
    private PBKDF2Hasher hasher;
    @Inject
    private UserRepository repository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(SECURITY).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String id = (String) session.getAttribute(ID);
        String persistPass = repository.findPassById(id);

        String currentPass = request.getParameter(CURRENT_PASS);
        String newPass = request.getParameter(NEW_PASS);

        if (hasher.checkPassword(currentPass.toCharArray(), persistPass)) {

            repository.save(id, hasher.hash(newPass.toCharArray()));
            request.setAttribute(SUCCESS_MESSAGE, "Mật khẩu đã được thay đổi");
        } else {
            request.setAttribute(ERROR_MESSAGE, "Mật khẩu bạn nhập không đúng");
        }
        request.getRequestDispatcher(SECURITY).forward(request, response);
    }
}
