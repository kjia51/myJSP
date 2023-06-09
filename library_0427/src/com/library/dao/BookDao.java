package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.common.DBConnPool;
import com.library.vo.Book;
import com.library.vo.Criteria;

public class BookDao {
	/**
	 * 도서목록 조회
	 * @param cri 
	 * @return
	 */
	public List<Book> getList(Criteria cri){
		List<Book> list = new ArrayList<Book>();
		
		//String sql = "select * from book order by no";
		String sql = 
				"select * from ("
				+ "select t.*, rownum rn from("
				+ "select no, title, author"
				//+ ", nvl((select 대여여부 from 대여 where 도서번호 = no and 대여여부='Y'),'N') rentyn"
				+ " from book order by no desc) t)";
		if (cri.getSearchWord()!= null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField() +" like '% "+ cri.getSearchWord() + " %'";

		}
				sql += " order by rn desc";
		
		// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String author = rs.getString(3);
				String rentYN = rs.getString(4);
				
				Book book = new Book(no, title, author, rentYN);
				list.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Book> getPageList(Criteria cri){
		List<Book> list = new ArrayList<Book>();
		
		//String sql = "select * from book order by no";
		String sql = 
				"select * from ("
				+ "select t.*, rownum rn from("
				+ "select no, title, author"
				+ ", nvl((select 대여여부 from 대여 where 도서번호 = no and 대여여부='Y'),'N') rentyn"
				+ " from book ";
		if (cri.getSearchWord()!= null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField() +" like '% "+ cri.getSearchWord() + " %'";

		}
			sql += "order by no) t) where rn between "+cri.getStartNo()+" and " + cri.getEndNo() + " order by rn desc";

		// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String author = rs.getString(3);
				String rentYN = rs.getString(4);
				
				Book book = new Book(no, title, author, rentYN);
				list.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	/**
	 * 도서 등록
	 * @param book
	 * @return
	 */
	public int insert(Book book) {
		int res = 0;
		
		String sql = String.format
	("insert into book values (SEQ_BOOK_NO.NEXTVAL, '%s', '%s', '%s', '%s','%s', null)"
				, book.getTitle(), book.getAuthor(), book.getRentyn(), book.getOfile(), book.getSfile());

		// 실행될 쿼리를 출력해봅니다
		//System.out.println(sql);
		
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 도서 삭제
	 * @return
	 */
	public int delete(String noStr) {
		int res = 0;
		
		String sql = String.format
						("delete from book where no in (%s)", noStr);
	
		// 실행될 쿼리를 출력해봅니다
		//System.out.println(sql);
		
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 도서 업데이트
	 * @return
	 */
	public int update(int no, String rentYN) {
		int res = 0;
		
		String sql = String.format
		("update book set rentYN = '%s' where no = %d", rentYN ,no);
	
		// 실행될 쿼리를 출력해봅니다
		//System.out.println(sql);
		
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public String getRentYN(int bookNo) {
		String rentYN = "";
		String sql = 
				String.format(
					"SELECT RENTYN FROM BOOK WHERE NO = %s", bookNo);
		
		
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt= conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);){
			// 조회된 행이 있는지 확인
			if(rs.next()) {
				// DB에서 조회된 값을 변수에 저장
				rentYN = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rentYN;
	}

	public int getTotalCnt(Criteria cri) {
		int count = 0;
		String sql = "select count(*) from book ";
		if (cri.getSearchWord()!=null && !cri.getSearchWord().equals("")) {
			sql += "where "+cri.getSearchField() +" like '% "+ cri.getSearchWord() + "%'";
		}
		sql += "order by no";
		
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt= conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);){
			while(rs.next()) {
				count = rs.getInt(1);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

	public int rentBook(Book book) {
		// 대여번호 조회(R00001)
		int res =0;
		String res1 = "";
		String sql1 = "select 'R' || LPAD(seq_대여.nextval,5,0) from dual";
		// book 테이블 업데이트 rentyn = y rentno=대여번호
		// 조건 도서번호, rentno가 null 또는 빈 문자열
		String sql2 = "update book set rentno=? where no = ? and (rentno is null or rentno='')";
		// 대여 테이블 인서드()
		String sql3 = "insert into 대여 values( ?, ?, ?,'N', sysdate, NULL, sysdate+14, NULL)";
		try (Connection conn = DBConnPool.getConnection();){
			conn.setAutoCommit(false);
			PreparedStatement psmt= conn.prepareStatement(sql1);
			ResultSet rs = psmt.executeQuery();
			if(!rs.next()) {
				return res;
			} else {
				String rentno = rs.getString(1);
				psmt.close();
				psmt = conn.prepareStatement(sql2);
				psmt.setString(1, rentno);
				psmt.setString(2, book.getNo());
				
				res = psmt.executeUpdate();
				
				if(res>0) {
					psmt.close();
					psmt = conn.prepareStatement(sql3);
					psmt.setString(1, rentno);
					psmt.setString(2, book.getNo());
					psmt.setString(3, book.getId());
					
					res = psmt.executeUpdate();
					if(res>0) {
						conn.commit();
					} else {
						conn.rollback();
						
					}
					
				} else {
					conn.rollback();
				}
				
		
			}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
		return res;
}

	public Book selectOne(String no) {
		Book book = null;
		
		String sql = " select "
					  + " b.no, b.title, d.대여여부, b.author, d.아이디"
					  + " , to_char(대여일,'yy/mm/dd') 대여일, to_char(반납가능일,'yy/mm/dd') 반납가능일" 
					  + " , 반납일, sfile, ofile, d.대여번호"
					  + " from book b, 대여 d where b.rentno = d.대여번호(+) and b.no="+no;
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery();){
				while(rs.next()) {
					
					String bookno = rs.getString(1);
					String title = rs.getString(2);
					String rentyn = rs.getString(3);
					String author = rs.getString(4);
					book = new Book(bookno, title, author, rentyn);
					book.setId(rs.getString(5));
					book.setStartDate(rs.getString(6));
					book.setEndDate(rs.getString(7));
					book.setReturnDate(rs.getString(8));
					book.setSfile(rs.getString(9));
					book.setOfile(rs.getString(10));
					book.setRentno(rs.getString(11));
					
				}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return book;
	}
}
























