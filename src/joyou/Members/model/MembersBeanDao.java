package joyou.Members.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class MembersBeanDao {

	private SessionFactory factory;
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public MembersBeanDao() {
	}

	public MembersBeanDao(Session session) {
		this.session = session;
	}

	public MembersBean getMemberById(Integer id) {
		if (id != null) {
			MembersBean bean = session.get(MembersBean.class, id);
			return bean;
		}
		return null;
	}

	public MembersBean getMemberByAccount(String account) {
		String hqlStr = "FROM MembersBean WHERE account=:acc";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("acc", account);
		MembersBean resultAccount = query.uniqueResult();
		return resultAccount;

	}

	public MembersBean getMemberByAccountPassword(String account, String password) {
		String hqlStr = "FROM MembersBean WHERE account=:acc AND password=:pwd";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("acc", account);
		query.setParameter("pwd", password);
		MembersBean resultAccount = query.uniqueResult();
		return resultAccount;
	}

	public MembersBean getMemberByMail(String mail) {
		String hqlStr = "FROM MembersBean WHERE mail=:mailbox";
		Query<MembersBean> query = session.createQuery(hqlStr, MembersBean.class);
		query.setParameter("mailbox", mail);
		MembersBean resultAccount = query.uniqueResult();
		return resultAccount;

	}

	@SuppressWarnings("unchecked")
	public List<MembersBean> getAllMember() {
//		Session session = factory.getCurrentSession();
		String hql = "FROM MembersBean";
		List<MembersBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	public void insertMember(MembersBean mBean) {
		session.save(mBean);
	}

	public void updateMember(MembersBean mBean) {
		MembersBean originBean = getMemberByAccount(mBean.getAccount());
		if (mBean.getPassword() == null) {
			originBean.setNickName(mBean.getNickName());
			originBean.setTrueName(mBean.getTrueName());
			originBean.setPhone(mBean.getPhone());
			originBean.setGender(mBean.getGender());
		} else {
			originBean.setPassword(mBean.getPassword());
		}
		session.save(originBean);
	}

	public void deleteMember(MembersBean mBean) {
		session.delete(mBean);
	}

	// 查足跡
	public String selectUserFoot(int id) {
		Session session = factory.getCurrentSession();
		String hqlStr = "FROM MembersBean WHERE id=:id";
		String f1 = "";
		MembersBean m = (MembersBean) session.createQuery(hqlStr).setParameter("id", id).getSingleResult();
		f1 = m.getUserfoot();

		return f1;

	}

	// 複寫足跡
	public void setUserFoot(int id, String f1) {
		Session session = factory.getCurrentSession();
		String hql = "update MembersBean m set m.memberUserfoot=:userfoot where m.memberID=:id";
		Query<MembersBean> query = session.createQuery(hql, MembersBean.class);

		query.setParameter("userfoot", f1);

		query.setParameter("id", id);

		query.executeUpdate();
	}

	// 桑基圖
	public List<String> findAllUserFeet() {
		Session session = factory.getCurrentSession();
		String hql = "select memberUserfoot FROM MembersBean";
		Query query = session.createQuery(hql);
		List<String> list = query.list();
		return list;
	}

}