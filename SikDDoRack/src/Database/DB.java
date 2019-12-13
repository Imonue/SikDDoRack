package Database;
import java.sql.*;
import java.util.ArrayList;

import Infomation.*;
import Security.Security;

public class DB {
	
	public static DB instance = new DB(); //占싱깍옙占쏙옙
	
	private Connection conn;
	
	private ArrayList<Store> storeList = new ArrayList<Store>();
	private ArrayList<Store> storeTypeList = new ArrayList<Store>();
	
	//////////////////////////Constructor/////////////////////////////
	DB(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost/sikddorack?useUnicode=yes&characterEncoding=UTF-8", "sikddorark", "1234");
			conn = DriverManager.getConnection("jdbc:mysql://211.46.116.181:3306/sikddorack", "back", "1234");				
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		SetStoList();
	}
	
	public void finalize() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//////////////////////////Method/////////////////////////////
	public void AddStoUser(Store store) {
		try {
			String sql = "insert into store values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, store.getSto_id());
			stmt.setString(2,  store.getSto_pw());
			stmt.setString(3,  store.getSto_name());
			stmt.setString(4,  store.getSto_phone());
			stmt.setString(5,  store.getSto_tel());
			stmt.setString(6,  store.getSto_type());
			stmt.setString(7,  store.getSto_addr());
			stmt.setFloat(8,  store.getSto_lati());
			stmt.setFloat(9,  store.getSto_longi());
			stmt.setInt(10,  store.getSto_max_table());
			stmt.setInt(11,  0);
			stmt.setString(12,  "불가능");
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void AddCusUser(Customer cus) {
		try {
			String sql = "insert into customer values(?,?,?,?)";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cus.getCus_id());
			stmt.setString(2, cus.getCus_pw());
			stmt.setString(3, cus.getCus_name());
			stmt.setString(4, cus.getCus_phone());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Store GetStoUser(String sto_id) {
		Store store = new Store();
		String sql = "select * from store where stoid = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, sto_id);
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			
			store.setSto_id(rs.getString("stoid"));
			store.setSto_pw(rs.getString("stopw"));
			store.setSto_name(rs.getString("stoname"));
			store.setSto_tel(rs.getString("stotel"));
			store.setSto_phone(rs.getString("stophone"));
			store.setSto_type(rs.getString("stotype"));
			store.setSto_addr(rs.getString("stoaddr"));
			store.setSto_lati(rs.getFloat("stolati"));
			store.setSto_longi(rs.getFloat("stolongi"));
			store.setSto_max_table(rs.getInt("stomaxtable"));
			store.setSto_now_table(rs.getInt("stonowtable")); 
			store.setSto_res_pos(rs.getString("storespos"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return store;
	}
	
	public Customer GetCusUser(String cus_id) {
		Customer customer = new Customer();
		String sql = "select * from customer where cusid = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cus_id);
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			customer.setCus_id(rs.getString("cusid"));
			customer.setCus_pw(rs.getString("cuspw"));
			customer.setCus_name(rs.getString("cusname"));
			customer.setCus_phone(rs.getString("cusphone"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customer;
	}
	
	public boolean LoginCusUser(String id, String pw) {
		String sql = "Select * from customer where cusid = ? and cuspw = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean LoginStoUser(String id, String pw) {
		String sql = "select * from store where stoid = ? and stopw = ?";
		System.out.println(sql);
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public void UpdateStoUser(Store store, String sto_id) {
		String sql = "update store set stopw = ?, stotel = ?, stophone = ?, stomaxtable = ?, stonowtable = ?, storespos = ? where stoid = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1,  store.getSto_pw());
			stmt.setString(2,  store.getSto_tel());
			stmt.setString(3,  store.getSto_phone());
			stmt.setInt(4,  store.getSto_max_table());
			stmt.setInt(5,  store.getSto_max_table());
			stmt.setString(6,  store.getSto_res_pos());
			stmt.setString(7,  sto_id);
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void UpdateCusUser(Customer customer, String cus_id) {
		String sql = "update customer set cuspw = ?, cusphone = ? where cusid = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  customer.getCus_pw());
			stmt.setString(2,  customer.getCus_phone());
			stmt.setString(3,  cus_id);
		
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void AddReser(Reservation en_reser) {
		// 복호화 목록 손님 아이디, 가게 아이디, 예약 날짜, 손님 핸드폰 번호
		Reservation reser = Security.instance.DeReser(en_reser);
		
		try {
			String sql = "insert into reservation(resid, cusid, stoid, stoname, resdate, cuscount, cusphone) values(current_timestamp(),?,?,?,?,?,?)";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  reser.getCus_id());
			stmt.setString(2,  reser.getSto_id());
			stmt.setString(3,  reser.getSto_name());
			stmt.setString(4,  reser.getRes_date());
			stmt.setInt(5,  reser.getCus_count());
			stmt.setString(6,  reser.getCus_phone());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet GetStoReser(String sto_id) {
		String sql = "select * from reservation where stoid = ? order by resid";
		ResultSet rs = null;
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sto_id);
			
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet GetCusReser(String cus_id) {
		
		String sql = "select * from reservation where stoid = ? order by resid";
		ResultSet rs = null;
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cus_id);
			
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public void DeleteReser(String cus_id, String sto_id) {
		try {
			String sql = "delete from reservation where cusid = ? and stoid = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  cus_id);
			stmt.setString(2,  sto_id);
	
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void AddResercom(Reservation_com reser_com) {
		try {
			String sql = "insert into reservation_com(resid_com, cusid_com, stoid_com, stoname_com, resdate_com, cuscount_com, cusphone_com) values(?,?,?,?,?,?,?)";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  reser_com.getRes_id_com());
			stmt.setString(2,  reser_com.getCus_id_com());
			stmt.setString(3,  reser_com.getSto_id_com());
			stmt.setString(4,  reser_com.getSto_name_com());
			stmt.setString(5,  reser_com.getRes_date_com());
			stmt.setInt(6,  reser_com.getCus_count_com());
			stmt.setString(7,  reser_com.getCus_phone_com());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet GetStoResercom(String sto_id) {
		
		String sql = "select * from reservation_com where stoid_com = ? order by resid_com";
		ResultSet rs = null;
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sto_id);
			
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet GetCusResercom(String cus_id) {
		
		String sql = "select * from reservation_com where stoid_com = ? order by resid_com";
		ResultSet rs = null;
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cus_id);
			
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public void DeleteResercom(String cus_id, String sto_id) {
		try {
			String sql = "delete from reservation_com where cusid_com = ? and stoid_com = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,  cus_id);
			stmt.setString(2,  sto_id);
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Reservation CheckReser(String cus_id, String sto_id) {
		Reservation reser = new Reservation();
		String sql = "select * from reservation where cusid = ? and stoid = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cus_id);
			stmt.setString(2, sto_id);
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			reser.setRes_id(rs.getString("resid"));
			reser.setCus_id(rs.getString("cusid"));
			reser.setSto_id(rs.getString("stoid"));
			reser.setSto_name(rs.getString("stoname"));
			reser.setRes_date(rs.getString("resdate"));
			reser.setCus_count(rs.getInt("cuscount"));
			reser.setCus_phone(rs.getString("cusphone"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return reser;
	}
	
	public Reservation_com CheckResercom(String cus_id, String sto_id) {
		Reservation_com reser_com = new Reservation_com();
		String sql = "select * from reservation_com where cusid_com = ? and stoid_com = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cus_id);
			stmt.setString(2, sto_id);
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			reser_com.setRes_id_com(rs.getString("resid_com"));
			reser_com.setCus_id_com(rs.getString("cusid_com"));
			reser_com.setSto_id_com(rs.getString("stoid_com"));
			reser_com.setSto_name_com(rs.getString("stoname_com"));
			reser_com.setRes_date_com(rs.getString("resdate_com"));
			reser_com.setCus_count_com(rs.getInt("cuscount_com"));
			reser_com.setCus_phone_com(rs.getString("cusphone_com"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		
		return reser_com;
	}
	
	public Reservation_com CopyReser(String cus_id, String sto_id) {
		Reservation_com reser_com = new Reservation_com();
		Reservation reser = CheckReser(cus_id, sto_id);
		
		reser_com.setRes_id_com(reser.getRes_id());
		reser_com.setCus_id_com(reser.getCus_id());
		reser_com.setSto_id_com(reser.getSto_id());
		reser_com.setSto_name_com(reser.getSto_name());
		reser_com.setRes_date_com(reser.getRes_date());
		reser_com.setCus_count_com(reser.getCus_count());
		reser_com.setCus_phone_com(reser.getCus_phone());
		
		return reser_com;
	}
	
	public int GetStoCount() {
		int count = 0;
		String sql = "select * from store";
		SetStoList();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				count++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("Store Count : " + count);
		return count;
	}
	
	public void SetStoList() {
		
		String sql = "select * from store order by stotype";
		try {
			this.storeList.clear();
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Store store = new Store();
				store.setSto_id(rs.getString("stoid"));
				store.setSto_pw(rs.getString("stopw"));
				store.setSto_name(rs.getString("stoname"));
				store.setSto_tel(rs.getString("stotel"));
				store.setSto_phone(rs.getString("stophone"));
				store.setSto_type(rs.getString("stotype"));
				store.setSto_addr(rs.getString("stoaddr"));
				store.setSto_lati(rs.getFloat("stolati"));
				store.setSto_longi(rs.getFloat("stolongi"));
				store.setSto_max_table(rs.getInt("stomaxtable"));
				store.setSto_now_table(rs.getInt("stonowtable")); 
				store.setSto_res_pos(rs.getString("storespos"));
				this.storeList.add(store);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Store GetStoUserName(String sto_name) {
		Store store = new Store();
		String sql = "select * from store where stoname = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sto_name);
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			
			store.setSto_id(rs.getString("stoid"));
			store.setSto_pw(rs.getString("stopw"));
			store.setSto_name(rs.getString("stoname"));
			store.setSto_tel(rs.getString("stotel"));
			store.setSto_phone(rs.getString("stophone"));
			store.setSto_type(rs.getString("stotype"));
			store.setSto_addr(rs.getString("stoaddr"));
			store.setSto_lati(rs.getFloat("stolati"));
			store.setSto_longi(rs.getFloat("stolongi"));
			store.setSto_max_table(rs.getInt("stomaxtable"));
			store.setSto_now_table(rs.getInt("stonowtable")); 
			store.setSto_res_pos(rs.getString("storespos"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return store;
	}
	
	public float GetStoLati(String sto_name) {
		float lati =  0.0f;
		String sql = "select * from store where stoname = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sto_name);
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			
			lati = rs.getFloat("stolati");	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return lati;
	}
	
	public float GetStoLongi(String sto_name) {
		float longi =  0.0f;
		String sql = "select * from store where stoname = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sto_name);
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			longi = rs.getFloat("stolongi");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return longi;
	}
	
	public void SetStoTypeList(String type) {
		
		String sql = "select * from store where stotype = ?";
		try {
			this.storeTypeList.clear();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, type);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Store store = new Store();
				store.setSto_id(rs.getString("stoid"));
				store.setSto_pw(rs.getString("stopw"));
				store.setSto_name(rs.getString("stoname"));
				store.setSto_tel(rs.getString("stotel"));
				store.setSto_phone(rs.getString("stophone"));
				store.setSto_type(rs.getString("stotype"));
				store.setSto_addr(rs.getString("stoaddr"));
				store.setSto_lati(rs.getFloat("stolati"));
				store.setSto_longi(rs.getFloat("stolongi"));
				store.setSto_max_table(rs.getInt("stomaxtable"));
				store.setSto_now_table(rs.getInt("stonowtable")); 
				store.setSto_res_pos(rs.getString("storespos"));
				this.storeTypeList.add(store);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//////////////////////////Getter/Setter/////////////////////////////
	
	public void SetConnection(Connection conn) {
		this.conn = conn;
	}
	public Connection GetConnection() {
		return this.conn;
	}

	public ArrayList<Store> getStoreList() {
		return storeList;
	}

	public void setStoreList(ArrayList<Store> storeList) {
		this.storeList = storeList;
	}
	
	public ArrayList<Store> getStoreTypeList() {
		return storeTypeList;
	}

	public void setStoreTypeList(ArrayList<Store> storeTypeList) {
		this.storeTypeList = storeTypeList;
	}
}
