package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;
import common.DBConnPool;
import dto.Board;
import dto.Criteria;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 검색 조건 추가하기
	 * @return
	 */
	public List<Board> getList(String searchField, String searchWord) {
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board";
		//검색어가 입력되면 검색조건 추가
		if(searchWord!=null && !"".equals(searchWord)) {
			sql+= " where " + searchField + " like '%" + searchWord +"%'";
			
		}
			sql += " order by num desc";
		
		try(Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();) {
			while(rs.next()) {
				String no = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String postDate = rs.getString("postdate");
				String visitcount = rs.getString("visitcount");
			Board board = new Board(no, title, content, id, postDate, visitcount);
			list.add(board);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Board> getListPage(Criteria criteria) {
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from (select t.*, rownum rn from(select board.* from board";
		//검색어가 입력되면 검색조건 추가
		if(criteria.getSearchWord()!=null && !"".equals(criteria.getSearchWord())) {
			sql+= " where " + criteria.getSearchField() + " like '%" + criteria.getSearchWord() +"%'";
			
		}
			sql += " order by num desc ) t ) where rn between "+ criteria.getStartNo() +" and " + criteria.getEndNo() ;
		
		try(Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();) {
			while(rs.next()) {
				String no = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String postDate = rs.getString("postdate");
				String visitcount = rs.getString("visitcount");
			Board board = new Board(no, title, content, id, postDate, visitcount);
			list.add(board);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotalCount(Criteria criteria){
		int count = 0;
		
		String sql = "select count(*) from board";
		//검색어가 입력되면 검색조건 추가
		if(criteria.getSearchWord()!=null && !"".equals(criteria.getSearchWord())) {
			sql+= " where " + criteria.getSearchField() + " like '%" + criteria.getSearchWord() +"%'";
			
		}
			sql += " order by num desc";
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
	
	public int insertBoard(Board board) {
		int res=0;
		String sql = "insert into board(num, title, content, id, postdate, visitcount) values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";

		try(Connection conn = ConnectionUtil.getConnection();
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
	public Board selectOne(String num) {
		Board board = null;
		String sql = "select * from board where num=?";
		if(num==null|| "".equals(num)) {
			return null;
		}
		try(Connection conn = ConnectionUtil.getConnection();
				
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, num);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				//줄바꿈 처리를 서버에서 해줌
				board.setContent(rs.getString("content").replace("\r\n","<br/>"));
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
	
	//게시물의 조회수 
	public int update(String num) {
		int res = 0;
		String sql = "update board set visitcount=visitcount+1 where num=?";
		try(Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, num);
			res = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int update(Board board) {
		int res=0;
		String sql = "update board set title=?, content=? where num=?";
		
		try(Connection conn=DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
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
	
	public int delete(String num) {
		int res=0;
		String sql = "delete board where num=?";
		
		try(Connection conn=DBConnPool.getConnection();
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
