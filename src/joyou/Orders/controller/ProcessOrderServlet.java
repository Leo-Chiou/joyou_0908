package joyou.Orders.controller;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import joyou.Orders.dao.OrdersDao;
import joyou.Orders.model.OrderItemBean;
import joyou.Orders.model.OrdersBean;
import joyou.Shopping.ShoppingCart;
import joyou.util.HibernateUtil;


//執行結帳頁面
@WebServlet("/ProcessOrderServlet.do")
@javax.servlet.annotation.MultipartConfig
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		
//		String responseCode=request.getParameter("ResponseCode");
		
//		if(!responseCode.equals("00")) {
//			response.sendRedirect(response.encodeRedirectURL ("ShoppingPage.jsp"));
//		}
		
		ShoppingCart sc = (ShoppingCart) request.getSession().getAttribute("ShoppingCart");
		
		Integer total = sc.getSubtotal();
		
			
		
//		int mId=(int) request.getSession().getAttribute("memberID");
		int mId =1000; 
		String recievename = (String) request.getSession().getAttribute("recievename");
		String recievephone = (String) request.getSession().getAttribute("recievephone");
		String address = (String) request.getSession().getAttribute("address");
		
		Date today = new Date();
		String card = "信用卡付款"; //專案只演示信卡付款。
		String remarks = (String) request.getSession().getAttribute("remarks");	
		
		
		
		OrdersBean oBean = new OrdersBean(null,mId, recievename, recievephone,
				address,total,today ,card, remarks,null);
		
		Map<Integer, OrderItemBean> cart = sc.getContent();
		
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = cart.keySet();
		for(Integer i : set) {
			OrderItemBean oib = cart.get(i);
			oib.setOrdersBean(oBean);
			items.add(oib);
		}
		
		oBean.setItems(items); 
		OrdersDao oDao = new OrdersDao(session);
		oDao.insert(oBean);
		
		System.out.println(oBean.getReceiver());
		session.getTransaction().commit();
		
		request.getSession().removeAttribute("ShoppingCart");
		response.sendRedirect(response.encodeRedirectURL ("OrderFinish.jsp"));
		
		
	}


}
