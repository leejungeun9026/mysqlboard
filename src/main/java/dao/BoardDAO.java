package dao;

import java.util.ArrayList;
import java.util.Map;

import common.MysqlConnPool;
import dto.BoardDTO;

public class BoardDAO extends MysqlConnPool {
	public ArrayList<BoardDTO> selectBoard(Map<String, String> search) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select b.*, m.name from board b left join member m on (b.id = m.id)";
		if(search.get("searchWord") != null) {
			if(search.get("searchField").equals("all")) {				
			   sql += " where title like '%" + search.get("searchWord") + "%'"
			   		+ " or content like '%" + search.get("searchWord") + "%'";
			} else if(search.get("searchField").equals("userid")) {
			   sql += " where b.id like '%" + search.get("searchWord") + "%'";
			} else if(search.get("searchField").equals("username")) {
			   sql += " where m.name like '%" + search.get("searchWord") + "%'";
			} else {
			   sql += " where " + search.get("searchField") + " like '%" + search.get("searchWord") + "%'";
			}
		}
			   sql += " order by num desc";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO b = new BoardDTO();
				b.setNum(rs.getInt("num"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setName(rs.getString("name"));
				b.setPostdate(rs.getTimestamp("postdate"));
				b.setVisitcount(rs.getInt("visitcount"));
				list.add(b);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int insertBoardDTO(String title, String content, String id) {
		int result = 0;
		String sql = "insert into board(title, content, id) values(?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, id);
			result = psmt.executeUpdate();
			System.out.println("게시물 저장완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
	
	public BoardDTO selectOne(int num) {
		BoardDTO board = new BoardDTO();
		String sql="select * from board b left join member m on (b.id = m.id) where num = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setPostdate(rs.getTimestamp("postdate"));
				board.setVisitcount(rs.getInt("visitcount"));
			}
			close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public void visitCount(int num) {
		String sql="update board set visitcount = visitcount + 1 where num = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateBoardDTO(String title, String content, int num) {
		String sql = "update board set title = ?, content = ? where num = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, num);
			result = psmt.executeUpdate();
			close();
			System.out.println("수정 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteBoardDTO(int num) {
		String sql = "delete from board where num = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
