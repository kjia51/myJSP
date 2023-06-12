package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;

public class MemberDao {

	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	public Member login(String id, String pw) {
		Member member=null;
		String sql = "select * from member where id='"+id+"' and pass=?";
		
		// 리소스/ 자원을 자동 반환(close())하기 위해 괄호 안에서 자원을 생성함
		try(Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, pw);
			ResultSet rs = psmt.executeQuery();
			
			//아이디 비밀번호가 일치하는 회원이 있음 조회
			while(rs.next()) {
				String loginId = rs.getString("id");
				String name = rs.getString("name");
				String regdate = rs.getString("regidate");
				member = new Member(loginId, "", name, regdate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	
//	 회원 등록 몇건이 처리되었는지 반환
	public int insert(Member member) {
		int i=0;
		String sql = "insert into member values(?,?,?,sysdate)";

		try(Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getPass());
			psmt.setString(3, member.getName());
			i=psmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}
}
