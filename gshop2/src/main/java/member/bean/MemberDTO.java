package member.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/*
 * 회원 및 사용자 정보를 관리하는 클래스
 */

@Component
@Data
public class MemberDTO {
	
	//Member DB 
	private int seq;
	private int state;
	private String id;
	private String pwd;
	private String name;
	private String email1;
	private String textemail;
	private String tel1;
	private String tel2;
	private String tel3;
	private String sample2_postcode;
	private String sample2_address;
	private String sample2_detailAddress;
	private String sample2_extraAddress;
	private int point;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date registerdate;
	private String sessionid;
	private Date sessionLimit;
	
	//MEMBER_DELETE DB 열 순서(id 제외)
		private String delete_mail;
		private int delete_reason;
		private String reason_etc;
		@JsonFormat(pattern="yyyy.MM.dd")
		private Date delete_date;
		
		//매출 관련 요소
		private int orderTotal;
		private int orderNum;
}
