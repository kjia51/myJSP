package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;
import dto.Board;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Board> getList() {
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board order by num desc";
		
		try(Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();) {
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String id = rs.getString(4);
				String postDate = rs.getString(5);
				String visitcount = rs.getString(6);
			Board board = new Board(no, title, content, id, postDate, visitcount);
			list.add(board);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int getTotalCount(){
		int count = 0;
		String sql = "select count(*) from board order by num desc";
		try(Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery();) {
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
