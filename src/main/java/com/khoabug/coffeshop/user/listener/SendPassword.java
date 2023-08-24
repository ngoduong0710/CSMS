package com.khoabug.coffeshop.user.listener; /**
 * @author : KhoaBug
 * @since : 8/20/2023 ,Sun
 */

import com.khoabug.coffeshop.common.services.MailSender;
import jakarta.servlet.ServletContextAttributeEvent;
import jakarta.servlet.ServletContextAttributeListener;
import jakarta.servlet.annotation.WebListener;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebListener
public class SendPassword implements ServletContextAttributeListener {
    private final String SEND_INFO = "info";
    private final String TITLE = "Chào mừng bạn đến với tiệm cà phê CSMS";
    private final String CONTENT = "Mật khẩu của bạn là: ";
    private ExecutorService executor;

    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        executor = Executors.newSingleThreadExecutor();
        executor.submit(() -> {
            if (event.getName().equals(SEND_INFO)) {
                SendInfo info = (SendInfo) event.getValue();
                MailSender.sendEmail(
                        info.receiveEmail(),
                        TITLE,
                        CONTENT + info.password());
                event.getServletContext().removeAttribute(SEND_INFO);
            }
        });
        executor.shutdown();
    }

    public record SendInfo(String receiveEmail, String password) {
    }
}
