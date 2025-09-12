package dao;

import java.util.ArrayList;

import common.MysqlConnPool;
import dto.BoardDTO;

public class BoardDAO extends MysqlConnPool{
	public ArrayList<BoardDTO> selectBoard(){
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select * from board b left join member m on (b.id = m.id)";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
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
		} catch(Exception e) {
			e.printStackTrace();
		} 		
		return list; 
	}
}
