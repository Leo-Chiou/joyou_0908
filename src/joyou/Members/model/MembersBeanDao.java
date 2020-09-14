package joyou.Members.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("myMembersBeanDao")
public class MembersBeanDao {
	public Session session;
	SessionFactory factory;

	public MembersBeanDao() {
	}

	public MembersBeanDao(Session session) {
		this.session = session;
	}

	public MembersBean insert(MembersBean mBean) {
		if (mBean != null) {
			session.save(mBean);
			return mBean;
		}
		return null;
	}

	public MembersBean selectbyID(int id) {
		String hqlStr = "from MembersBean where memberID=:userID";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("userID", id);
		MembersBean resultAccount = query.uniqueResult();
		if (resultAccount != null) {
			return resultAccount;
		}
		return null;
	}

	public MembersBean selectbyAccount(String account) {
		String hqlStr = "from MembersBean where memberAcc=:acc";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("acc", account);
		MembersBean resultAccount = query.uniqueResult();
		if (resultAccount != null) {
			return resultAccount;
		}
		return null;
	}

	public MembersBean selectbyAccountPassword(String account, String password) {
		String hqlStr = "from MembersBean where memberAcc=:acc and memberPwd=:pwd";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("acc", account);
		query.setParameter("pwd", password);
		MembersBean resultAccount = query.uniqueResult();
		if (resultAccount != null) {
			return resultAccount;
		}
		return null;
	}

	public MembersBean selectbyMail(String mail) {
		String hqlStr = "from MembersBean where memberMail=:mailbox";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("mailbox", mail);
		MembersBean resultAccount = query.uniqueResult();
		if (resultAccount != null) {
			System.out.println(resultAccount.getId());
			return resultAccount;
		}
		return null;
	}

	public boolean checkDuplicateAccount(String account) {
		MembersBean resultAccount = selectbyAccount(account);
		if (resultAccount != null) {
			return true;
		}
		return false;
	}

	public boolean checkDuplicateMail(String mail) {
		MembersBean resultAccount = selectbyMail(mail);
		if (resultAccount != null) {
			return true;
		}
		return false;
	}
	
	
	//查足跡
	public String selectUserFoot(int id) { 
		
		String hqlStr = "from MembersBean where memberID=:id";
		String f1="";
		MembersBean m = (MembersBean) session.createQuery(hqlStr).setParameter("id", id).getSingleResult();
		f1 = m.getUserfoot();
		
		return f1;
		
	}
	
	//複寫足跡
	public void setUserFoot(int id,String f1) {
		String hql="update MembersBean m set m.memberUserfoot=:userfoot where m.memberID=:id";
		Query<MembersBean> query = session.createQuery(hql, MembersBean.class);
		
		query.setParameter("userfoot",f1);

		query.setParameter("id",id);

		query.executeUpdate();
	}
	
	
	
	//桑基圖
	public List<String> findAllUserFeet() {
		Session session = factory.getCurrentSession();
		String hql = "select memberUserfoot FROM MembersBean";
		Query query =session.createQuery(hql);
		List<String> list = query.list();
		return list;
	}

}