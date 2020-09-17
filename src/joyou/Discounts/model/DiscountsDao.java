package joyou.Discounts.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("myDiscountsDao")
public class DiscountsDao {

	private Session session;

	public DiscountsDao(Session session) {
		this.session = session;
	}

	public DiscountsDao() {

	}

	public DiscountsBean insert(DiscountsBean dBean) { // 新增折扣代碼
		if (dBean != null) {
			session.save(dBean);
			return dBean;
		}
		return null;
	}

	public DiscountsBean selectbyId(Integer dicountId) { // 依ID折扣代碼
		DiscountsBean dBean = session.get(DiscountsBean.class, dicountId);
		return dBean;
	}

	public List<DiscountsBean> selectAll() { // 查詢全部
		Query<DiscountsBean> query = session.createQuery("from DiscountsBean", DiscountsBean.class);
		return query.list();
	}

	public boolean delete(int dicountId) { // 依ID刪除
		DiscountsBean dBean = session.get(DiscountsBean.class, dicountId);
		if (dBean != null) {
			session.delete(dBean);
			return true;
		}
		return false;
	}

	public DiscountsBean selectByCode(String Code) { // 依代碼尋找
		Query<DiscountsBean> query = session.createQuery("from DiscountsBean where code=:inputCode",
				DiscountsBean.class);
		query.setParameter("inputCode", Code);
		DiscountsBean result = query.uniqueResult();

		return result;

	}

	public boolean checkCode(String Code) { // 查詢代碼是否存在

		Query<DiscountsBean> query = session.createQuery("from DiscountsBean", DiscountsBean.class);
		for(DiscountsBean dBean : query.list()) {
			if(dBean.getCode().equals(Code)) {
				return true;
			}
		}return false;

	}

}
