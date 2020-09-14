package joyou.Members.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.util.HibernateUtil;

@WebServlet("/up_EditProfileServlet")
public class TestEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private String userAcc;
	private String userPwd;
	private String userMail;
	private String userNickName;

	private String userTrueName;
	private String userPhone;

//	private String userGender;
//	private String userBirth;
//	private String gameType;
//	private String md5Acc;
//	private String md5Pwd;
	private Session session;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();

			request.setCharacterEncoding("UTF-8");

			userAcc = request.getParameter("userAcc");
			userNickName = request.getParameter("userNickName");
			userTrueName = request.getParameter("userTrueName");
			userPhone = request.getParameter("userPhone");

//			userGender = request.getParameter("userGender");
//			userBirth = request.getParameter("userBirth");
//			gameType = request.getParameter("gameType");
//			md5Acc = changeMD5(userAcc)
//			md5Pwd = changeMD5(userPwd);

			checkUpdateData(request, response);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.close();
	}

	private void checkUpdateData(HttpServletRequest request, HttpServletResponse response) // 判斷帳號是否重複若無則寫入資料庫
			throws IOException, SQLException, ServletException {

		SessionFactory factory = HibernateUtil.getSessionFactory();

		session = factory.getCurrentSession();
		session.beginTransaction();

		MembersBeanDao mDao = new MembersBeanDao(session);

		MembersBean mBean = new MembersBean(userAcc, userPwd, userMail, userNickName, userTrueName, userPhone);
		mDao.insert(mBean);
//		TestMail mail = new TestMail();
//		mail.sendMail(mBean);
		session.getTransaction().commit();
		session.close();
		request.setAttribute("p", "修改資料成功");
//		request.getRequestDispatcher("<c:url value='up_LoginPage.jsp'/>").forward(request, response);
		request.getRequestDispatcher("up_MemberProfilePage.jsp").forward(request, response);

	}

}
