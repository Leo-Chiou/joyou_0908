package joyou.Members.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.util.HibernateUtil;

@WebServlet("/up_LoginServlet")
public class TestLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String loginAcc;
	private String loginPwd;

	private Session session;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");

			loginAcc = request.getParameter("userAcc");
			loginPwd = request.getParameter("userPwd");

			System.out.println("userAcc=" + loginAcc);
			System.out.println("userPwd=" + loginPwd);

			SessionFactory factory = HibernateUtil.getSessionFactory();
			session = factory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			MembersBeanDao md = new MembersBeanDao(session);
			MembersBean mBean = md.selectbyAccountPassword(loginAcc, loginPwd);
			tx.commit();
			if (mBean != null) {
//				((HttpSession) session).setAttribute("p", "登入成功");
//				((HttpSession) session).setAttribute("memberID", mBean.getId());
//				((HttpSession) session).setAttribute("memberMail", mBean.getMail());
//				((HttpSession) session).setAttribute("memberPhone", mBean.getPhone());
//				((HttpSession) session).setAttribute("memberTrueName", mBean.getTruename());
//				((HttpSession) session).setAttribute("memberNickName", mBean.getNickname());
				request.getSession().setAttribute("p", "登入成功");
				request.getSession().setAttribute("memberID", mBean.getId());
				request.getSession().setAttribute("memberAccount", mBean.getAccount());
				request.getSession().setAttribute("memberMail", mBean.getMail());
				request.getSession().setAttribute("memberPhone", mBean.getPhone());
				request.getSession().setAttribute("memberTrueName", mBean.getTruename());
				request.getSession().setAttribute("memberNickName", mBean.getNickname());

				request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);

			} else {
				request.setAttribute("p", "帳號或密碼錯誤");
				request.getRequestDispatcher("up_LoginPage.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}