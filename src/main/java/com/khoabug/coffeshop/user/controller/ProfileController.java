package com.khoabug.coffeshop.user.controller; /**
 * @author : KhoaBug
 * @since : 8/19/2023 ,Sat
 */

import com.khoabug.coffeshop.common.services.RequestDateGetter;
import com.khoabug.coffeshop.common.services.RequestMapper;
import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import com.khoabug.coffeshop.user.model.User;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.Optional;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {

    private final String SUCCESS_MESSAGE = "successMessage";
    private final String ERROR_MESSAGE = "errorMessage";
    private final String ID = "id";
    private final String PROFILE_JSP = "profile.jsp";

    @Inject
    private UserRepository repository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Optional<User> user = repository.findById((String) session.getAttribute(ID));
        if (user.isPresent()) {
            request.setAttribute("user", user.get());
            request.getRequestDispatcher(PROFILE_JSP).forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Date date = new Date(RequestDateGetter.getDate(request.getParameter("date")).getTime());
        User newUserInfo = RequestMapper.toModel(User.class, request);
        newUserInfo.setDob(date);
        Optional<User> persistUser = repository.findById((String) session.getAttribute(ID));

        if (persistUser.get().getEmail().equals(newUserInfo.getEmail())) {
            updateUserByBasicInfo(persistUser, newUserInfo);
            request.setAttribute(SUCCESS_MESSAGE, "Lưu thông tin thành công!");
        } else if (repository.findEmailByEmailNotById(newUserInfo.getId(),
                newUserInfo.getEmail()).isEmpty()) {
            updateUserByBasicInfo(persistUser, newUserInfo);
            request.setAttribute(SUCCESS_MESSAGE, "Lưu thông tin thành công!");
        } else {
            request.setAttribute(ERROR_MESSAGE, "Email đã tồn tại trong hệ thống.");
        }
        request.getRequestDispatcher(PROFILE_JSP).forward(request, response);
    }

    private void updateUserByBasicInfo(Optional<User> persistUser, User newUserInfo) {
        User updatedUser = persistUser.get();
        updatedUser.setName(newUserInfo.getName());
        updatedUser.setDob(newUserInfo.getDob());
        updatedUser.setGender(newUserInfo.getGender());
        updatedUser.setEmail(newUserInfo.getEmail());
        repository.save(updatedUser);
    }
}
