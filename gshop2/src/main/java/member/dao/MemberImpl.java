package member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;


@Repository
@DependsOn(value= {"sqlSession"})
public class MemberImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 로그인
	public MemberDTO login(String id, String pwd) {
		
		Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwd", pwd);
		return sqlSession.selectOne("memberSQL.login", map);	
	}

	// 회원가입 반영
	public int write(MemberDTO memberDTO) {
		return sqlSession.insert("memberSQL.write", memberDTO);
	}
	
	// 아이디 검색 결과 반환
	@Override
	public MemberDTO checkId(String id) {
		return sqlSession.selectOne("memberSQL.checkId", id);
	}
	//7. 회원삭제 요청을 통한 회원정보 만료화 반영
		@Override
		public void deleteMember(String id) {
			sqlSession.update("memberSQL.deleteMember", id);	
		}
	// 자동로그인 정보 업로드/업데이트
	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit){
		Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", id);
			map.put("sessionid", sessionId);
			map.put("sessionlimit", sessionLimit);		
			sqlSession.update("memberSQL.keepLogin", map);
	}

	// 자동로그인을 통한 회원 정보 호출
	@Override
	public MemberDTO checkLoginBefore(String value){
		return sqlSession.selectOne("memberSQL.checkLoginBefore", value);
	}
	// 아이디 찾기 결과 반환
	@Override
	public MemberDTO findLostId(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.findLostId",map);
	}
	// 비밀번호 임시번호로 재설정 반영
	@Override
	public void setNewPwd(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.setNewPwd",memberDTO);
	}
	//14. 회원 포인트 차감
		@Override
		public void reducePoint(String id, String pointQty) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("id", id);	map.put("pointQty", pointQty);
			sqlSession.update("memberSQL.reducePoint", map);		
		}
		
	
	// 회원 전체 정보 호출
	@Override
	public List<MemberDTO> getMemberList() {
		return sqlSession.selectList("memberSQL.getMemberList");
	}
	// 회원 정보 호출
	@Override
	public MemberDTO getUser(String id) {
		return sqlSession.selectOne("memberSQL.getMember",id);
	}
	//13. 회원 포인트 지급
		@Override
		public void setPoint(String id,String pointQty) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("id", id);	map.put("pointQty", pointQty);
			sqlSession.update("memberSQL.setPoint", map);	
		}

	//----------MEMBER_DELETE:START----------//	
		@Override
		public void deleteMemberAdmin(Map<String, String> map) {
			sqlSession.insert("memberSQL.deleteMemberAdmin",map);		
		}	
		@Override
		public MemberDTO getDeleteRequest(String id) {
			return sqlSession.selectOne("memberSQL.getDeleteRequest",id);
		}
		@Override
		public void deleteRequest(String id) {
			sqlSession.delete("memberSQL.deleteRequest",id);	
		}
	//----------MEMBER_DELETE:END----------//

}
