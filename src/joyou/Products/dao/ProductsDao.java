package joyou.Products.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import joyou.Products.model.ProductsBean;

@Repository("myProductsDao")
public class ProductsDao {
	Session session;
	DataSource ds = null;
	public static final int RECORDS_PER_PAGE = 9;
	private int totalPages;
	private Query<ProductsBean> query;

	public ProductsDao(Session session) {
		this.session = session;
	}

	public ProductsDao() {

	}

	public ProductsBean insert(ProductsBean pBean) { // 新增商品
		if (pBean != null) {
			session.save(pBean);
			return pBean;
		}
		return null;
	}

	public ProductsBean selectbyId(Integer productId) { // 依ID查詢商品
		ProductsBean pBean = session.get(ProductsBean.class, productId);
		return pBean;
	}

	public List<ProductsBean> selectAll() { // 查詢全部商品
		Query<ProductsBean> query = session.createQuery("from ProductsBean", ProductsBean.class);
		return query.list();
	}

	public ProductsBean updatenoImg(Integer productId, String productName, // 依ID修改商品不含照片。
			Integer productStock, Integer productPrice, Integer gametypeId, String productAge, String productLang,String suggestNum,String productColor,String paintingStyle,String productIntro) {
		ProductsBean pBean = session.get(ProductsBean.class, productId);
		if (pBean != null) {
			pBean.setProductName(productName);
			pBean.setProductStock(productStock);
			pBean.setProductPrice(productPrice);
			pBean.setGametypeId(gametypeId);
			pBean.setProductAge(productAge);
			pBean.setProductLang(productLang);
			pBean.setSuggestNum(suggestNum);
			pBean.setProductColor(productColor);
			pBean.setPaintingStyle(paintingStyle);
			pBean.setProductIntro(productIntro);

		}
		return pBean;
	}

	public ProductsBean update(Integer productId, String productName, // 依ID修改商品含照片。
			Integer productStock, Integer productPrice, Integer gametypeId, String productAge, String productLang,
			String imgName, Blob productImg,String suggestNum,String productColor,String paintingStyle,String productIntro) {

		ProductsBean pBean = session.get(ProductsBean.class, productId);
		if (pBean != null) {
			pBean.setProductName(productName);
			pBean.setProductStock(productStock);
			pBean.setProductPrice(productPrice);
			pBean.setGametypeId(gametypeId);
			pBean.setProductAge(productAge);
			pBean.setProductLang(productLang);
			pBean.setImgName(imgName);
			pBean.setProductImg(productImg);
			pBean.setSuggestNum(suggestNum);
			pBean.setProductColor(productColor);
			pBean.setPaintingStyle(paintingStyle);
			pBean.setProductIntro(productIntro);
		}
		return pBean;
	}

	public boolean delete(int productId) { // 依ID刪除商品
		ProductsBean pBean = session.get(ProductsBean.class, productId);
		if (pBean != null) {
			session.delete(pBean);
			return true;
		}
		return false;
	}

	public List<ProductsBean> selectByPage(int page) {       //選擇各頁資料(每頁9筆)
//		List<ProductsBean> list = new ArrayList<ProductsBean>();
//		int first = 1+10*(page-1);
//		int last=9+10*(page-1);
//		try {
//		String sqlstr="SELECT * FROM Products WHERE productId BETWEEN '"+first+"' AND '"+last+"'";
//		Connection connection = ds.getConnection("@sa", "P@ssw0rd"); 
//		System.out.println(98);
//		PreparedStatement ps = connection.prepareStatement(sqlstr);
//		ResultSet rs = ps.executeQuery();
//		while (rs.next()) {
//			ProductsBean pBean = new ProductsBean();
//			pBean.setProductId(rs.getInt("ProductId"));
//			pBean.setProductName(rs.getString("productName"));
//			pBean.setProductStock(rs.getInt("ProductStock"));
//			pBean.setProductPrice(rs.getInt("ProductPrice"));
//			pBean.setGametypeId(rs.getInt("GametypeId"));
//			pBean.setProductAge(rs.getString("ProductAge"));
//			pBean.setProductLang(rs.getString("ProductLang"));
//			pBean.setProductImg(rs.getBlob("ProductImg"));
//
//			list.add(pBean);
//		}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}return list;
		
		int first = 1+9*(page-1);
		int last=9+9*(page-1);
		String sqlstr="FROM ProductsBean WHERE productId BETWEEN '"+first+"' AND '"+last+"'";
		query = session.createQuery(sqlstr, ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		return beanList;

	}
  
	public int getTotalPages() {      //計算頁數(無條件進位)
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) RECORDS_PER_PAGE));
		return totalPages;
	}

	public long getRecordCounts() {   //計算商品數量
		long count = 0;
		query = session.createQuery("from ProductsBean", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		for (ProductsBean pBean : beanList) {
			count++;
		}
		System.out.println("商品總數:"+count);
		return count;
	}
	
	public List<ProductsBean> selectPriceDesc(int page) {   //價錢由高至低
		query = session.createQuery("from ProductsBean order by productPrice desc ", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		List<ProductsBean> newlist = new ArrayList<>();
		for(int i=9*(page-1);i<=8+9*(page-1)&&i<beanList.size();i++) {
			newlist.add(beanList.get(i));
		}
		return newlist;

	}
	
	public List<ProductsBean> selectPriceAsc(int page) {   //價錢由低至高
		query = session.createQuery("from ProductsBean order by productPrice asc", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		List<ProductsBean> newlist = new ArrayList<>();
		for(int i=9*(page-1);i<8+9*(page-1)+1&&i<beanList.size();i++) {
			
				newlist.add(beanList.get(i));
		}
		return newlist;

	}
	
	public List<ProductsBean> selectNewProduct(){         //選擇最後三筆
		String sql="select top 3 * from ProductsBean order by productId desc";
		query = session.createQuery(sql, ProductsBean.class);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	
	public List<ProductsBean> selectSaleProduct(){         //選擇特價品
		
		query = session.createQuery("from ProductsBean where sale=1", ProductsBean.class);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
}
