package com.khoabug.coffeshop.dashboard.controller; /**
 * @author : KhoaBug
 * @since : 8/16/2023 ,Wed
 */

import com.khoabug.coffeshop.bill.infrastructure.repository.BillRepository;
import com.khoabug.coffeshop.bill.model.Bill;
import com.khoabug.coffeshop.common.services.RequestDateGetter;
import com.khoabug.coffeshop.dashboard.model.Dashboard;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "DashboardController", value = "/dashboard")
public class DashboardController extends HttpServlet {

    private String DASHBOARD_JSP_PATH = "home.jsp";
    private final String WARNING_MESSAGE = "warnMessage";

    @Inject
    private BillRepository billRepository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dateRange = request.getParameter("dateRange");
        Date startDate;
        Date endDate;

        if (dateRange == null) {
            startDate = new Date(Calendar.getInstance().getTime().getTime());
            endDate = startDate;
        } else {
            startDate = new Date(RequestDateGetter.getStartDate(dateRange).getTime());
            endDate = new Date(RequestDateGetter.getEndDate(dateRange).getTime());
        }
        List<Bill> bills = billRepository.findByRange(startDate, endDate);
        if (bills.isEmpty()) {
            request.setAttribute(WARNING_MESSAGE, "Không có bill nào trong khoảng thời gian này");
        } else {
            request.setAttribute("bill", new Dashboard(bills));
        }
        request.getRequestDispatcher(DASHBOARD_JSP_PATH).forward(request, response);
    }
}
