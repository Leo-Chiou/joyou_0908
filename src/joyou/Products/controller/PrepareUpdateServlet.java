package joyou.Products.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.google.gson.Gson;
import joyou.Products.dao.ProductsDao;
import joyou.Products.model.ProductsBean;
import joyou.util.HibernateUtil;

@WebServlet("/PrepareUpdateServlet.do")
public class PrepareUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductsBean pBean;
	private PrintWriter out;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();

		
		
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			System.out.println("&scscwdwdwd"+productId);
			ProductsDao pDao = new ProductsDao(session);
			pBean = pDao.selectbyId(productId);
			
			request.getSession().setAttribute("upId", pBean.getProductId());
			request.getSession().setAttribute("upName", pBean.getProductName());
			request.getSession().setAttribute("upStock", pBean.getProductStock());
			request.getSession().setAttribute("upPrice", pBean.getProductPrice());
			request.getSession().setAttribute("upIntro", pBean.getProductIntro());
			
			out = response.getWriter();
			request.setAttribute("UpdateMsg", "Inert Sucess!");
			request.getRequestDispatcher("WebMaintain/Products_Update.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("UpdateMsg", "Inert Sucess!");
			session.getTransaction().rollback();
		}

		
		session.getTransaction().commit();
		
	}

}
