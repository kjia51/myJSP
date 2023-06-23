package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;
import dto.Criteria;
import dto.Member;

public class NewBoardDao {

	public NewBoardDao() {
		// TODO Auto-generated constructor stub
	}
	public List<Board> getList(Criteria criteria){
		List<Board> list = new ArrayList<>();
		String sql = "select num, title, content, id, decode(to_char(postdate,'YYYY-mm-dd'),to_char(sysdate,'YYYY-mm-dd'),to_char(postdate,'HH:MM:SS'),to_char(postdate,'YYYY-mm-dd')) postdate, VISITCOUNT from board";
		
		if(criteria.getSearchWord()!=null && !"".equals(criteria.getSearchWord())) {
			sql += " where "+ criteria.getSearchField() + " like '%" + criteria.getSearchWord()+"%'";
		}
		
		sql += " order by num desc";
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery()){
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String postdate = rs.getString("postdate");
				String visitcount = rs.getString("visitcount");
				Board board = new Board(num, title, content, id, postdate, visitcount);
				list.add(board);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<Board> getListPage(Criteria criteria){
		List<Board> list = new ArrayList<>();
		String sql = "select * from ("
				+"select rownum rn, t.*"
				+"from (select NUM, TITLE, CONTENT, ID, "
				+"decode(to_char(postdate,'YYYY-mm-dd')"
				+",to_char(sysdate,'YYYY-mm-dd')"
				+",to_char(postdate,'HH:MM:SS'),"
				+"to_char(postdate,'YYYY-mm-dd')) postdate, "
				+"visitcount from board ";
		if(criteria.getSearchWord()!=null && !"".equals(criteria.getSearchWord())) {
			sql += " where "+ criteria.getSearchField() + " like '%" + criteria.getSearchWord()+"%'";
		}
		
		sql += ")t) where rn between " + criteria.getStartNo()+ " and " + criteria.getEndNo() + "order by num desc";
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery()){
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String postdate = rs.getString("postdate");
				String visitcount = rs.getString("visitcount");
				Board board = new Board(num, title, content, id, postdate, visitcount);
				list.add(board);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertBoard(Board board) {
		int res = 0;
		String sql = "insert into board (num, title, content, id, postdate, visitcount) "
				+ "values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
		
		try(Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			res = psmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateBoard(Board board){
		int res=0;
		String sql ="update board set title =?, content=? where num=?";
		
		try(Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getNum());
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	public int totalCount(Criteria criteria){
		int res=0;
		String sql ="select count(*) from board";
		if(criteria.getSearchWord()!=null && !"".equals(criteria.getSearchField())) {
			sql += " where criteria.getSearchField() like '%"+criteria.getSearchField()+"%'";
		}
		
		try(Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery();){
				while(rs.next()) {
					res =rs.getInt(1);
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public Board SelectOne(String num) {
		Board board = null;
		String sql = "select * from board where num=?";
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, num);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostDate(rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
	
	public void updateVisitCount(String num) {
		String sql = "update board set visitcount=visitcount+1 where num=?";
		
		try(Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, num);
			ResultSet rs = psmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	public int deleteBoard(String num) {
		int res = 0;
		String sql = "delete from board where num=?";

		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, num);
			res = psmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

}
