package product.bean;

import java.text.NumberFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
/*
 * 상품 정보 관리 클래스
 */
@Component
@Data
public class ProductDTO{
	
	//PRODUCT_NAME DB 관련 : 실제로 업로드된 상품
	private int product_name_no;
	private int product_category_no;
	private String product_name_title;
	private String product_name_detail;
	private int product_name_price;
	private String product_name_image;
	private int product_hit;
	private int product_like;
	private int product_salesMount;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date product_name_instockdate;
	private String product_onstore;
	
	//PRODUCT DB 관련 : 입점한 이력이 있는 상품
	private String productID;
	private int unitcost;
	private int stock;
	private int promotioncode;
	private String productName;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date product_registerdate;
	private int ordernum;
	
	//PRODUCT_CATEGORY 관련 : CATEGORY의 이름
	private String product_category_name;
	
	//장바구니 관련(DB 항목X)
	private int cart_qty;
	
	//메인 화면 상품 리스트 컨테이너
	private StringBuffer productListHTML;
	
	public int getProduct_name_no() {
		return product_name_no;
	}

	public void setProduct_name_no(int product_name_no) {
		this.product_name_no = product_name_no;
	}

	public int getProduct_category_no() {
		return product_category_no;
	}

	public void setProduct_category_no(int product_category_no) {
		this.product_category_no = product_category_no;
	}

	public String getProduct_name_title() {
		return product_name_title;
	}

	public void setProduct_name_title(String product_name_title) {
		this.product_name_title = product_name_title;
	}

	public String getProduct_name_detail() {
		return product_name_detail;
	}

	public void setProduct_name_detail(String product_name_detail) {
		this.product_name_detail = product_name_detail;
	}

	public int getProduct_name_price() {
		return product_name_price;
	}

	public void setProduct_name_price(int product_name_price) {
		this.product_name_price = product_name_price;
	}

	public String getProduct_name_image() {
		return product_name_image;
	}

	public void setProduct_name_image(String product_name_image) {
		this.product_name_image = product_name_image;
	}

	public int getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}

	public int getProduct_like() {
		return product_like;
	}

	public void setProduct_like(int product_like) {
		this.product_like = product_like;
	}

	public int getProduct_salesMount() {
		return product_salesMount;
	}

	public void setProduct_salesMount(int product_salesMount) {
		this.product_salesMount = product_salesMount;
	}

	public Date getProduct_name_instockdate() {
		return product_name_instockdate;
	}

	public void setProduct_name_instockdate(Date product_name_instockdate) {
		this.product_name_instockdate = product_name_instockdate;
	}

	public String getProduct_onstore() {
		return product_onstore;
	}

	public void setProduct_onstore(String product_onstore) {
		this.product_onstore = product_onstore;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public int getUnitcost() {
		return unitcost;
	}

	public void setUnitcost(int unitcost) {
		this.unitcost = unitcost;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPromotioncode() {
		return promotioncode;
	}

	public void setPromotioncode(int promotioncode) {
		this.promotioncode = promotioncode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getProduct_registerdate() {
		return product_registerdate;
	}

	public void setProduct_registerdate(Date product_registerdate) {
		this.product_registerdate = product_registerdate;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public String getProduct_category_name() {
		return product_category_name;
	}

	public void setProduct_category_name(String product_category_name) {
		this.product_category_name = product_category_name;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public StringBuffer getProductListHTML() {
		return productListHTML;
	}

	public void setProductListHTML(StringBuffer productListHTML) {
		this.productListHTML = productListHTML;
	}

	//상품 리스트 작성 메소드
	public void makeProductListHTML(){
		Date date = new Date();
        long diff = date.getTime() - product_name_instockdate.getTime();
        long diffNew = date.getTime() - product_registerdate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        long diffNewDays = diffNew/(24 * 60 * 60 * 1000);
        
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        
        productListHTML = new StringBuffer();
        
          productListHTML.append("<li class='testyo'><div class='proBox'><div class='thumbnail'>");
          productListHTML.append("<a href='/product/productView.do?product_name_no="+product_name_no+"'>");
          productListHTML.append("<img class='productList_view' src='/storage/showProduct.do?product_name_image="+product_name_image+"' alt=''></div>");
          productListHTML.append("<div class='product_description'><ul class='des_inner'><li class='product_name'><a href='/product/productView.do?product_name_no="+product_name_no+"'><span>"+productName+"</span></li>");
          if(unitcost<product_name_price) {
        		productListHTML.append("<ul class='product_price'><li><span style='color:red;font-size:8px;text-decoration:line-through;'>"+nf.format(product_name_price)+"</span>&nbsp&nbsp<span>"+nf.format(unitcost)+"&emsp;</span><span class='evtIco_obj' style='color:#c1744c; border-color:#c1744c;'>특가</span>");}
        	  else {
        		productListHTML.append("<ul class='product_price'><li><span>"+nf.format(unitcost)+"&emsp;</span>");}
          if(diffNewDays>=0 && diffNewDays<=14) {
        	  	productListHTML.append("<span class='evtIco_obj' style='color:#cf3b3b; border-color:#cf3b3b;'>신규입고</span></li></ul></ul></div></div>");}
			  else {
				productListHTML.append("</li></ul></ul></div></div>"); }  

}
        
        

	//(목록의 일부를 Filter)
	public void makeSpecialListHTML(String condition){
		Date date = new Date();
        long timeDiff = date.getTime() - product_registerdate.getTime();
        long timeDiffDays = timeDiff/(24 * 60 * 60 * 1000);
        
        if(condition.equals("onSale")) {
        	if(unitcost<product_name_price) {
        			makeProductListHTML();}
        	else return;}
        else if(condition.equals("newArrival")) {
        	if(timeDiffDays>=0 && timeDiffDays<=3) {
        			makeProductListHTML();}
        	else return;}
        else return;}
}
