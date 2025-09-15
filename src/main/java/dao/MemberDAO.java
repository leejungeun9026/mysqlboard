package dao;

import common.MysqlConnPool;
import dto.MemberDTO;

public class MemberDAO extends MysqlConnPool{
	public MemberDAO() {
	}
	
	public int insertMemberDTO(String uid, String pass, String name) {
		String sql = "insert into member(id, pass, name) values(?,?,?)";
		int result = 0;
		try {			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			psmt.setString(3, name);
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public MemberDTO loginMember(String uid, String pass) {
		MemberDTO member = new MemberDTO();
		String sql = "select * from member where id = ? and pass = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();			
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setRegidate(rs.getDate("regidate"));
			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}		
		return member;
	}
	
	public MemberDTO getMemberDTO(String uid) {
		MemberDTO member = new MemberDTO();
		String sql = "select * from member where id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();			
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setRegidate(rs.getDate("regidate"));
			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}		
		return member;
	}
	
	public int updatePass(String id, String pass, String nPass1, String nPass2) {
		int result = 0;
		if(!nPass1.equals(nPass2)) {
			System.out.println("변경할 비밀번호 불일치");
			return result;
		}
		String sql = "update member set pass = ? where id = ? and pass = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nPass1);
			psmt.setString(2, id);
			psmt.setString(3, pass);
			result = psmt.executeUpdate();
			System.out.println("비밀번호 변경 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
