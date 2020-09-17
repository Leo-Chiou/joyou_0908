package joyou.Orders.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import joyou.Orders.model.OrdersBean;


@Repository("myOrdersDao")
public class OrdersDao {
	Session session;
	SessionFactory factory;

	public OrdersDao() {
	}
	
	public OrdersDao(Session session) {
		this.session=session;
	}

	public OrdersBean insert(OrdersBean oBean) { // 新增
		if (oBean != null) {
			session.save(oBean);
			return oBean;
		}
		return null;
	}
	
	public List<OrdersBean> selectAll() { // 查詢
		Query<OrdersBean> query = session.createQuery("from OrdersBean", OrdersBean.class);
		return query.list();
	}
	
	
	public boolean delete(int orderId) { // 刪除
		OrdersBean oBean = session.get(OrdersBean.class, orderId);
		if (oBean != null) {
			session.delete(oBean);
			return true;
		}
		return false;
	}
	
	
}
