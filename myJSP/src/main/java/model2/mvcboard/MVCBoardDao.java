package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Criteria;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}
	public List<MVCBoardDto> getList(Criteria cri) {
		List<MVCBoardDto> list  = new ArrayList<MVCBoardDto>();
		String sql  = "select * from mvcboard";
		if(cri.getSearchWord()!=null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField()+ " like '%" + cri.getSearchWord() +"%'";
		}
			sql += " order by idx desc";
			try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery()){
				while(rs.next()) {
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String postdate =rs.getString("postdate");
					String ofile = rs.getString("ofile");
					String sfile = rs.getString("sfile");
					int downcount = rs.getInt("downcount");
					String pass = rs.getString("pass");
					int visitcount = rs.getInt("visitcount");
					
					
					MVCBoardDto board = new MVCBoardDto(idx, name, title, content, postdate, ofile, sfile, downcount, pass, visitcount);
					
					list.add(board);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return list;
	}
	public int getTotalCount(Criteria criteria) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<MVCBoardDto> getListPage(Criteria cri) {
		List<MVCBoardDto> list  = new ArrayList<MVCBoardDto>();

		String sql  = "select * from (select tb.*, rownum rn from( select * from mvcboard";
		if(cri.getSearchWord()!=null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField()+ " like '%" + cri.getSearchWord() +"%'";
		}
			sql += " order by idx desc) tb) where rn between ? and ? order by rn desc";
			try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
					psmt.setInt(1, cri.getStartNo());
					psmt.setInt(2, cri.getEndNo());
				ResultSet rs = psmt.executeQuery();
				while(rs.next()) {
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String postdate =rs.getString("postdate");
					String ofile = rs.getString("ofile");
					String sfile = rs.getString("sfile");
					int downcount = rs.getInt("downcount");
					String pass = rs.getString("pass");
					int visitcount = rs.getInt("visitcount");
					
					
					MVCBoardDto board = new MVCBoardDto(idx, name, title, content, postdate, ofile, sfile, downcount, pass, visitcount);
					
					list.add(board);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return list;
	}
	public int getTotalCnt(Criteria cri) {
		int total = 0;
		String sql  = "select count(*) from mvcboard";
		if(cri.getSearchWord()!=null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField()+ " like '%" + cri.getSearchWord() +"%'";
		}
			sql += " order by idx desc";
			try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery()){
				while(rs.next()) {
					total = rs.getInt(1);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return total;
	}
	public MVCBoardDto selectOne(int no) {

		MVCBoardDto dto  = new MVCBoardDto();
		String sql  = "select * from mvcboard where idx=? order by idx desc";
			try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				
				psmt.setInt(1, no);
				ResultSet rs = psmt.executeQuery();
				while(rs.next()) {
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String postdate =rs.getString("postdate");
					String ofile = rs.getString("ofile");
					String sfile = rs.getString("sfile");
					int downcount = rs.getInt("downcount");
					String pass = rs.getString("pass");
					int visitcount = rs.getInt("visitcount");
					
					
					dto = new MVCBoardDto(idx, name, title, content, postdate, ofile, sfile, downcount, pass, visitcount);
					
					
				}
			} catch (SQLException e) {
				System.out.println("게시물 상세 보기 중 오류 발생");
				e.printStackTrace();
			}
			
		return dto;
	}
	public boolean confirmPw(String pass, String idx) {
		// TODO Auto-generated method stub
		boolean res = false;
		MVCBoardDto dto  = new MVCBoardDto();
		String sql  = "select count(*) from mvcboard where idx=? and pass=?";
			try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				
				psmt.setString(1, idx);
				psmt.setString(2, pass);
				
				ResultSet rs = psmt.executeQuery();
				res = rs.next();
			} catch (SQLException e) {
				System.out.println("게시물 상세 보기 중 오류 발생");
				e.printStackTrace();
			}
		
		return res;
	}
	public int delete(String idx) {
		// TODO Auto-generated method stub
		int res = 0;
		MVCBoardDto dto  = new MVCBoardDto();
		String sql  = "delete from mvcboard where idx=?";
			try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				psmt.setString(1, idx);
				
				res = psmt.executeUpdate();
				
			} catch (SQLException e) {

				e.printStackTrace();
			}

		
		return res;
	}


}
