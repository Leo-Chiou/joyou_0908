package joyou.Members.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/up_MemberRegisterServlet")
public class MemberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private String userAccount;
	private String userPassword;
	private String userMail;
	private String userNickName;

	private String userTrueName;
	private String userPhone;

	private String userGender;
	// private String userBirth;
	// private String gameType;
	// private String md5Acc;
	// private String md5Pwd;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		request.setCharacterEncoding("UTF-8");

		userAccount = request.getParameter("userAccount");
		userPassword = request.getParameter("userPassword");
		userMail = request.getParameter("userMail");
		userNickName = request.getParameter("userNickName");
		userGender = request.getParameter("userGender");

		userTrueName = request.getParameter("userTrueName");
		userPhone = request.getParameter("userPhone");

		// userGender = request.getParameter("userGender");
		// userBirth = request.getParameter("userBirth");
		// gameType = request.getParameter("gameType");
		// md5Acc = changeMD5(userAcc)
		// md5Pwd = changeMD5(userPwd);

		// 有時間在補上驗證輸入資料
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		MembersBeanService mService = new MembersBeanService(session);
		mService.insert(new MembersBean(userAccount, userPassword, userMail, userNickName, userTrueName, userPhone,
				userGender, null));

		tx.commit();
		session.close();

		String randInt = new TestMail().sendMail(userMail);

		request.getSession().setAttribute("registerSuccess", "註冊成功請登入");
		request.getSession().setAttribute("memberNickName", userNickName);
		request.getSession().setAttribute("memberMail", userMail);
		request.getSession().setAttribute("VerifiedCode", randInt);
		// request.getRequestDispatcher("up_LoginPage.jsp").forward(request, response);
		request.getRequestDispatcher("member-into-3.jsp").forward(request, response);

	}

}
