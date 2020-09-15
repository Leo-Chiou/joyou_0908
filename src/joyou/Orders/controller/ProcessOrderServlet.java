package joyou.Orders.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import joyou.Orders.dao.OrdersDao;
import joyou.Orders.model.OrderItemBean;
import joyou.Orders.model.OrdersBean;
import joyou.Shopping.ShoppingCartDao;


@WebServlet("/ProcessOrderServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;
	private ShoppingCartDao sc;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		
		String finalDecision = request.getParameter("finalDecision");	
		
		if (session == null) {   //超過時間回到首頁
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
			return;
		}
		
		sc = (ShoppingCartDao)session.getAttribute("ShoppingCart");
		
		if  (finalDecision.equals("CANCEL")){
			session.removeAttribute("ShoppingCart");
			response.sendRedirect(response.encodeRedirectURL (request.getContextPath()));
			return;
		}
		
		Integer total = sc.getSubtotal();
		int mId=(int) request.getSession().getAttribute("memberID");
		String recievename = request.getParameter("recievename");
		String recievephone = request.getParameter("recievephone");
		String address = request.getParameter("address");
		String remarks = request.getParameter("remarks");
		String card = request.getParameter("card");
		Date today = new Date();
		
		Set<OrderItemBean> items = new HashSet<OrderItemBean>();
		Map<Integer, OrderItemBean> cart = sc.getContent();
		Set<Integer> set = cart.keySet();
		for (Integer k : set) {
			OrderItemBean oi = cart.get(k); 
			OrderItemBean oib = new OrderItemBean(oi.getProductId(), oi.getProductName(), oi.getProductPrice(), oi.getProductLang(), oi.getOrderitemQty(), oi.getTotalPrice());
			items.add(oib);
		}
		
		OrdersBean oBean = new OrdersBean(null, mId, recievename, recievephone,
				address,total ,today,card,items, remarks);
		
		OrdersDao oDao = new OrdersDao();
		oDao.insert(oBean);
		session.removeAttribute("ShoppingCart");
		response.sendRedirect(response.encodeRedirectURL ("OrderFinish.jsp"));
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
