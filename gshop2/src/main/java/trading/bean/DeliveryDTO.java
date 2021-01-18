package trading.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

/*
 * DB DELIVERY 관련 요소 관리 클래스
 */
@Component
@Data
public class DeliveryDTO {
	private int delivery_code;
	private String delivery_type;
	private int delivery_fee;
	public int getDelivery_code() {
		return delivery_code;
	}
	public void setDelivery_code(int delivery_code) {
		this.delivery_code = delivery_code;
	}
	public String getDelivery_type() {
		return delivery_type;
	}
	public void setDelivery_type(String delivery_type) {
		this.delivery_type = delivery_type;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	
	
}
