package joyou.Orders.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OrderItem")
public class OrderItemBean {
	Integer orderitemId;
	Integer productId;
	String productName;
	Integer productPrice;
	String productLang;
	Integer orderitemQty;
	Integer totalPrice;
	
	public OrderItemBean(Integer productId,String productName,Integer productPrice,String productLang,
	Integer orderitemQty,Integer totalPrice) {
		this.productId=productId;
		this.productName=productName;
		this.productPrice=productPrice;
		this.productLang=productLang;
		this.orderitemQty=orderitemQty;
		this.totalPrice=totalPrice;
	}
	

	@Id
	@Column(name="orderitemid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getOrderitemId() {
		return orderitemId;
	}
	
	public void setOrderitemId(Integer orderitemId) {
		this.orderitemId = orderitemId;
	}
	
	@Column(name="productid")
	public Integer getProductId() {
		return productId;
	}
	
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	@Column(name="productname")
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Column(name="productprice")
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	
	@Column(name="productlang")
	public String getProductLang() {
		return productLang;
	}
	
	public void setProductLang(String productLang) {
		this.productLang = productLang;
	}
	
	@Column(name="orderitemqty")
	public Integer getOrderitemQty() {
		return orderitemQty;
	}
	
	public void setOrderitemQty(Integer orderitemQty) {
		this.orderitemQty = orderitemQty;
	}
	
	@Column(name="totalPrice")
	public Integer getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
