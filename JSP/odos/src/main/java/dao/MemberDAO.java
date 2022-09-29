package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 종현 추가
	
	public ArrayList<MemberDTO> list(String sql) {
		ArrayList<MemberDTO> res = new ArrayList<MemberDTO>();

		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setM_id(rs.getString("m_id"));
				dto.setM_pw(rs.getString("m_pw"));
				dto.setM_name(rs.getString("m_name"));
				dto.setM_email(rs.getString("m_email"));
				dto.setM_addr(rs.getString("m_addr"));
				dto.setM_point(rs.getInt("m_point"));
				dto.setM_state(rs.getInt("m_state"));
				dto.setM_date(rs.getDate("m_date"));

				res.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	/*
	 * // 종현추가 public int total(){
	 * 
	 * sql = "select count(*) from member_management";
	 * 
	 * // limit 10,5 -> 10번 이후부터 5개를 뽑아라
	 * 
	 * try { ptmt = con.prepareStatement(sql);
	 * 
	 * rs = ptmt.executeQuery();
	 * 
	 * rs.next(); return rs.getInt(1);
	 * 
	 * 
	 * } catch (SQLException e) {
	 * 
	 * e.printStackTrace(); }finally { close(); } return 0; }
	 */

	// 종현 추가
	public MemberDTO detail(String m_id) {
		MemberDTO res = null;

		sql = "select * from member_management where m_id = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, m_id);
			rs = ptmt.executeQuery();

			if (rs.next()) {
				res = new MemberDTO();
				res.setM_id(rs.getString("m_id"));
				res.setM_pw(rs.getString("m_pw"));
				res.setM_name(rs.getString("m_name"));
				res.setM_email(rs.getString("m_email"));
				res.setM_addr(rs.getString("m_addr"));
				res.setM_point(rs.getInt("m_point"));
				res.setM_date(rs.getDate("m_date"));
				res.setM_state(rs.getInt("m_state"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	// 종현_회원정보 수정
	public void modify(MemberDTO dto) {
		try {
			sql = "update member_management set "
					+ "m_pw = ?, m_name = ?, m_addr = ?, m_point = ?, m_state = ? where m_id =?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.m_pw);
			ptmt.setString(2, dto.m_name);
			ptmt.setString(3, dto.m_addr);
			ptmt.setInt(4, dto.m_point);
			ptmt.setInt(5, dto.m_state);
			ptmt.setString(6, dto.m_id);

			ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	/*
	 * public void insert(MemberDTO dto) {
	 * 
	 * try {
	 * 
	 * sql = "insert into member_management (m_point) " + "values(?, ?, ?, ?, ?)";
	 * 
	 * ptmt = con.prepareStatement(sql); ptmt.setString(1, dto.getM_point());
	 * 
	 * // ptmt.setString(5, dto.getA_fix());
	 * 
	 * rs = ptmt.executeQuery(); rs.next();
	 * 
	 * } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } }
	 */

	// 종현 추가 회원정보 삭제
	public int delete(MemberDTO dto) {
		try {
			sql = "delete from member_management where m_id = ? and m_pw = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getM_id());
			ptmt.setString(2, dto.getM_pw());
			return ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return 0;
	}

	public void adminDelete(String id) {
		try {
			sql = "delete from member_management where m_id = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	/*
	 * // 종현추가 (이메일 인증 되어있는지) public int getUserEmailChecked(String m_id) { String
	 * sql = "select userEmailChecked from member_management where m_id = ?";
	 * Connection con = null; PreparedStatement ptmt = null; ResultSet rs = null;
	 * 
	 * try { con = DatabaseUtil.getConnection(); ptmt = con.prepareStatement(sql); }
	 * catch (Exception e) { // TODO: handle exception }
	 * 
	 * 
	 * return false;
	 * 
	 * }
	 */

	public int login(String id, String pw) {
		int res = 0;
		sql = "select * from member_management where m_id = ? and m_pw = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setString(2, pw);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				res = rs.getInt("m_state");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}

	public String MyPageCheck(String id, String pw) {
		String res = "";
		sql = "select * from member_management where m_id = ? and m_pw = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setString(2, pw);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				res = rs.getString("m_pw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}

	// 종현 이메일 인증 추가
	public String emailChk(String m_email) {
		String emailcheck = "emaimEmpty";

		try {
			sql = "select m_email from member_management where m_email = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, m_email);

			rs = ptmt.executeQuery();

			if (rs.next()) {
				emailcheck = "emailExist";
				System.out.println("db에 있는 이메일입니다." + m_email);
			} else {
				System.out.println("db에 업는 이메일입니다." + m_email);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return emailcheck;
	}
	// 종현 이메일 인증 추가 끝

	public String idChk(String id) {
		String check = "empty";

		try {
			sql = "select m_id from member_management where m_id=?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);

			rs = ptmt.executeQuery();

			if (rs.next()) {
				check = "exist";
				System.out.println("DB에 있는 ID : " + id);
			} else {
				System.out.println("DB에 없는 ID : " + id);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}

	public void memberJoinInsert(MemberDTO dto) {

		try {

			sql = "insert into member_management (m_id, m_pw, m_name, m_email, m_addr, m_date, m_state) "
					+ "values(?, ?, ?, ?, ?, sysdate(), 1)";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getM_id());
			ptmt.setString(2, dto.getM_pw());
			ptmt.setString(3, dto.getM_name());
			ptmt.setString(4, dto.getM_email());
			ptmt.setString(5, dto.getM_addr());

			rs = ptmt.executeQuery();
			rs.next();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void memberDrop(String id) {

		try {
			sql = "update member_management set m_state = 3 where m_id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);

			ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 이메일 인증 후 아이디 찾기
	public MemberDTO EmailChkForfindId(String m_email) {
		MemberDTO res = null;

		sql = "select m_id from member_management where m_email = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, m_email);
			rs = ptmt.executeQuery();

			if (rs.next()) {
				res = new MemberDTO();
				res.setM_id(rs.getString("m_id"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	// 종현_ password만 수정하는 곳 수정
	public void modifyPassword(MemberDTO dto) {
		try {
			sql = "update member_management set m_pw = ? where m_id =?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.m_pw);
			ptmt.setString(2, dto.m_id);

			ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void pointModify(MemberDTO dto) {
		try {
			sql = "update member_management set m_point = m_point + ? where m_id =?";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.m_point);
			ptmt.setString(2, dto.m_id);

			ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void close() {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (ptmt != null)
			try {
				ptmt.close();
			} catch (SQLException e) {
			}
		if (con != null)
			try {
				con.close();
			} catch (SQLException e) {
			}
	}
}
