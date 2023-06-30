package com.library.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.common.DBConnPool;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.library.vo.User;

public class userdao {

	public List<User> getList(Criteria cri){
		List<User> userlist = new ArrayList<User>();
		
		String sql = "select * from ("
				+ "select t.*, rownum rn from("
				+ "select * from userlist order by no) t)";
		if (cri.getSearchWord()!= null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField() +" like '% "+ cri.getSearchWord() + " %'";

		}
				sql += " order by rn desc";
				


		// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
		try (Connection conn = DBConnPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String adminyn = rs.getString(4);
				
				User user = new User(no, id, name, adminyn);
				userlist.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userlist;
	}
	public List<User> getPageList(Criteria cri){
		List<User> userlist = new ArrayList<User>();
		
		//String sql = "select * from book order by no";
		String sql = 
				"select * from ("
				+ "select t.*, rownum rn from("
				+ "select * from userlist";
		if (cri.getSearchWord()!= null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField() +" like '% "+ cri.getSearchWord() + " %'";

		}
			sql += " order by no) t) where rn between "+cri.getStartNo()+" and " + cri.getEndNo() + " order by rn desc";
			System.out.println(sql);
		// try ( 리소스생성 ) => try문이 종료되면서 리소스를 자동으로 반납
			try (Connection conn = DBConnPool.getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql)){
				while(rs.next()) {
					int no = rs.getInt(1);
					String id = rs.getString(2);
					String name = rs.getString(3);
					String adminyn = rs.getString(4);
					
					User user = new User(no, id, name, adminyn);
					userlist.add(user);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return userlist;
	}
	
	public int getTotalCount(Criteria cri) {
		int count = 0;
		String sql = "select count(*) from userlist ";
		if (cri.getSearchWord()!=null && !cri.getSearchWord().equals("")) {
			sql += " where "+cri.getSearchField() +" like '% "+ cri.getSearchWord() + " %'";
		}
		sql += "order by no";
		System.out.println(sql);
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
	
	public userdao() {
		// TODO Auto-generated constructor stub
	}

}
