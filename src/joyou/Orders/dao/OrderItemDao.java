package joyou.Orders.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import joyou.Orders.model.OrderItemBean;
import joyou.util.HibernateUtil;



@Repository("myOrderItemDao")
public class OrderItemDao {
	
	
	Session session;
	
	public OrderItemDao() {
	}
	
	public OrderItemDao(Session session) {
		this.session=session;
	}
	
	public OrderItemBean insert(OrderItemBean oBean) { // 新增
		if (oBean != null) {
			session.save(oBean);
			return oBean;
		}
		return null;
	}
	
	
	
	public List<OrderItemBean> selectAll() { // 查詢
		Query<OrderItemBean> query = session.createQuery("from OrderItemBean", OrderItemBean.class);
		return query.list();
	}
//	public List<OrderItemBean> selectAll2() { // 查詢  
//		Session session = factory.getCurrentSession();
//		String hql = "from OrderItemBean";
//		List<OrderItemBean> list = session.createQuery(hql).getResultList();
//		
//		return list;
//	}
	
	
	
	
	public boolean delete(int orderId) { // 刪除
		OrderItemBean oBean = session.get(OrderItemBean.class, orderId);
		if (oBean != null) {
			session.delete(oBean);
			return true;
		}
		return false;
	}
}
