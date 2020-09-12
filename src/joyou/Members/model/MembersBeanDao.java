package joyou.Members.model;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("myMembersBeanDao")
public class MembersBeanDao {
	public Session session;

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

}