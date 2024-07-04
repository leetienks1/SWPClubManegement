package payment.impl;

import DAO.TicketDAO;
import DAO.TicketPurchaseDAO;
import Model.Ticket;
import Model.TicketPurchase;
import Model.User;
import dto.GetPaymentResponse;
import payment.IPaymentService;
import payment.PaymentResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public abstract class AbstractTicketPurchasePaymentService implements IPaymentService {

    protected TicketDAO ticketDAO = new TicketDAO();
    protected TicketPurchaseDAO ticketPurchaseDAO = new TicketPurchaseDAO();

    @Override
    public PaymentResponse payment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        final User user = (User) req.getSession().getAttribute("user");
        final String ticketId = req.getParameter("ticketId");
        final String paymentMethod = req.getParameter("paymentMethod");
        final Ticket ticket = this.ticketDAO.get(Integer.parseInt(ticketId))
                .orElseThrow(() -> new RuntimeException("khong tim thay ticket"));
        TicketPurchase ticketPurchase = new TicketPurchase();
        ticketPurchase.setTicketID(ticket.getTicketId());
        ticketPurchase.setPurchaseDate(new Date());
        ticketPurchase.setStatus(0);
        ticketPurchase.setPaymentMethod(paymentMethod);
        ticketPurchase.setUserId(2);
//        ticketPurchase.setUserId(user.getUserId()); // mở comment dòng này khi hoàn thành xác thực người dùng.
        this.ticketPurchaseDAO.save(ticketPurchase);
        Map<String, Object> header = new HashMap<>();
        header.put(ticketPurchase.getClass().getName(), ticketPurchase);
        header.put(ticket.getClass().getName(), ticket);
        return this.payment(req, resp, header);
    }

    @Override
    public GetPaymentResponse query(Map<String, Object> header) {
        final TicketPurchase ticketPurchase = (TicketPurchase) header.get(TicketPurchase.class.getName());
        final Properties properties = (Properties) header.get(Properties.class.getName());
        return this.query(ticketPurchase, properties);
    }

    public abstract PaymentResponse payment(HttpServletRequest req, HttpServletResponse reps, Map<String, Object> headers) throws IOException;

    public abstract GetPaymentResponse query(TicketPurchase ticketPurchase, Properties properties);
}
