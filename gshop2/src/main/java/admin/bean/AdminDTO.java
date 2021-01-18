package admin.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
/*
 * 관리자 페이지에 권한을 가진 admin과 ADMIN DB에 대한 정보를 관리하는 클래스
 */
@Component
@Data
public class AdminDTO {
	private String admin_id;
	private String admin_pwd;
	private String admin_email_addr;
	private String admin_email_pwd;
	private String admin_shop_tel;
	private String admin_account;
	@JsonFormat(pattern="yyyy년MM월dd일")
	private Date admin_opendate;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public String getAdmin_email_addr() {
		return admin_email_addr;
	}
	public void setAdmin_email_addr(String admin_email_addr) {
		this.admin_email_addr = admin_email_addr;
	}
	public String getAdmin_email_pwd() {
		return admin_email_pwd;
	}
	public void setAdmin_email_pwd(String admin_email_pwd) {
		this.admin_email_pwd = admin_email_pwd;
	}
	public String getAdmin_shop_tel() {
		return admin_shop_tel;
	}
	public void setAdmin_shop_tel(String admin_shop_tel) {
		this.admin_shop_tel = admin_shop_tel;
	}
	public String getAdmin_account() {
		return admin_account;
	}
	public void setAdmin_account(String admin_account) {
		this.admin_account = admin_account;
	}
	public Date getAdmin_opendate() {
		return admin_opendate;
	}
	public void setAdmin_opendate(Date admin_opendate) {
		this.admin_opendate = admin_opendate;
	}
	
	
}
