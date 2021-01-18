package member.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String id, String pwd);
	MemberDTO checkId(String id);
	int write(MemberDTO memberDTO);
	void keepLogin(String id, String sessionId, Date sessionLimit);
	MemberDTO findLostId(Map<String, String> map);
	void deleteMember(String id);
	void setNewPwd(MemberDTO memberDTO);
	MemberDTO checkLoginBefore(String value);
	List<MemberDTO> getMemberList();
	MemberDTO getUser(String id);
	void setPoint(String id,String pointQty);
	void reducePoint(String id,String pointQty);
	//----------MEMBER_DELETE:START----------//	
		void deleteMemberAdmin(Map<String, String> map);
		MemberDTO getDeleteRequest(String id);
		void deleteRequest(String id);
	//----------MEMBER_DELETE:END----------//

}
