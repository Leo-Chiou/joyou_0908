package joyou.Orders.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class OrdersBean {
	Integer orderId;
	Integer memberId;
	String receiver;
	String receiverPhone;
	String shippingAddress;
	Integer orderAmount;
	Date  orderDate;
	String payMethod;
	Set<OrderItemBean> items = new LinkedHashSet<>();
	String remarks;
	
	
	public OrdersBean() {
		
	}

	public OrdersBean(Integer orderId, Integer memberId, String receiver, String receiverPhone,
			String shippingAddress,Integer orderAmount,Date  orderDate ,String payMethod,Set<OrderItemBean> items, String remarks) {

		this.orderId=orderId;
		this.memberId=memberId;
		this.receiver=receiver;
		this.receiverPhone=receiverPhone;
		this.shippingAddress=shippingAddress;
		this.orderAmount=orderAmount;
		this.orderDate=orderDate;
		this.payMethod=payMethod;
		this.items=items;
		this.remarks=remarks;

	}
	
	@Id
	@Column(name="orderId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@Column(name="memberId")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name="receiver")
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Column(name="receiverphone")
	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	@Column(name="shippingAddress")
	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	@Column(name="orderamount")
	public Integer getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Integer orderAmount) {
		this.orderAmount = orderAmount;
	}

	@Column(name="orderdate")
	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Column(name="paymethod")
	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

//	public Set<OrderItemBean> getItems() {
//		return items;
//	}
//
//	public void setItems(Set<OrderItemBean> items) {
//		this.items = items;
//	}

	@Column(name="remarks")
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


}
