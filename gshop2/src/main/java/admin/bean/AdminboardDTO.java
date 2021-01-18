package admin.bean;

import org.springframework.stereotype.Component;

import lombok.Data;
/*
 * 문의 게시글에 대한 답변을 관리하는 BOARD_ADMIN DB의 구성요소를 관리하는 클래스
 */
@Component
@Data
public class AdminboardDTO {
	private int admin_seq;
	private int admin_pseq;
	private String user_id;
	private String admin_content;
	public int getAdmin_seq() {
		return admin_seq;
	}
	public void setAdmin_seq(int admin_seq) {
		this.admin_seq = admin_seq;
	}
	public int getAdmin_pseq() {
		return admin_pseq;
	}
	public void setAdmin_pseq(int admin_pseq) {
		this.admin_pseq = admin_pseq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAdmin_content() {
		return admin_content;
	}
	public void setAdmin_content(String admin_content) {
		this.admin_content = admin_content;
	}
	
	
}
