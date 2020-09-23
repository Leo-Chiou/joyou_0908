package joyou.Members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanService;
import joyou.util.HibernateUtil;

@WebServlet("/up_MemberEditProfileServlet")
public class MemberEditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String userAccount = request.getParameter("userAccount");
		String userMail = request.getParameter("userMail");
		String userNickName = request.getParameter("userNickName");
		String userTrueName = request.getParameter("userTrueName");
		String userPhone = request.getParameter("userPhone");
		String userGender = request.getParameter("userGender");
		Integer userPreferGameType = Integer.valueOf(request.getParameter("userPreferGameType"));

		System.out.println("account= " + userAccount);
		System.out.println("nickname= " + userNickName);
		System.out.println("userPreferGameType= " + userPreferGameType);
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();

		boolean UpdateSuccess = new MembersBeanService(session).update(
				new MembersBean(userAccount, null, null, userNickName, userTrueName, userPhone, userGender,
						userPreferGameType, null));

		tx.commit();

		if (UpdateSuccess) {

			request.getSession().setAttribute("UpdateSuccess", "更新會員資料成功");

			request.getSession().setAttribute("memberAccount", userAccount);
			request.getSession().setAttribute("memberMail", userMail);
			request.getSession().setAttribute("memberPhone", userPhone);
			request.getSession().setAttribute("memberTrueName", userTrueName);
			request.getSession().setAttribute("memberNickName", userNickName);
			request.getSession().setAttribute("memberGender", userGender);
			request.getSession().setAttribute("memberPreferGameType", userPreferGameType);

//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);
			request.getRequestDispatcher("member-profile.jsp").forward(request, response);

		} else {

			request.getSession().setAttribute("UpdateSuccess", "更新會員資料失敗");
//			request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);
			request.getRequestDispatcher("member-profile.jsp").forward(request, response);

		}

	}

}