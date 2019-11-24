package Infomation;

public class Store {
	private String sto_name;
	private String sto_id;
	private String sto_pw;
	private String sto_tel;
	private String sto_phone;
	private String sto_type;
	private String sto_addr;
	private float sto_lati;
	private float sto_longi;
	private int sto_max_table;
	private int sto_now_table;
	private String sto_res_pos;
	
	public Store(){
		super();
	}
	
	public Store(String sto_name, String sto_id, String sto_pw, String sto_tel, String sto_phone,
			String sto_type, String sto_addr, float sto_lati, float sto_longi, int sto_max_table, 
			int sto_now_table, String sto_res_pos) {
		super();
		this.sto_name = sto_name;
		this.sto_id = sto_id;
		this.sto_pw = sto_pw;
		this.sto_tel = sto_tel;
		this.sto_phone = sto_phone;
		this.sto_type = sto_type;
		this.sto_addr = sto_addr;
		this.sto_lati = sto_lati;
		this.sto_longi = sto_longi;
		this.sto_max_table = sto_max_table;
		this.sto_now_table = sto_now_table;
		this.sto_res_pos = sto_res_pos;
	}

	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_id() {
		return sto_id;
	}
	public void setSto_id(String sto_id) {
		this.sto_id = sto_id;
	}
	public String getSto_pw() {
		return sto_pw;
	}
	public void setSto_pw(String sto_pw) {
		this.sto_pw = sto_pw;
	}
	public String getSto_tel() {
		return sto_tel;
	}
	public void setSto_tel(String sto_tel) {
		this.sto_tel = sto_tel;
	}
	public String getSto_phone() {
		return sto_phone;
	}
	public void setSto_phone(String sto_phone) {
		this.sto_phone = sto_phone;
	}
	public String getSto_type() {
		return sto_type;
	}
	public void setSto_type(String sto_type) {
		this.sto_type = sto_type;
	}
	public String getSto_addr() {
		return sto_addr;
	}
	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}
	public float getSto_lati() {
		return sto_lati;
	}
	public void setSto_lati(float sto_lati) {
		this.sto_lati = sto_lati;
	}
	public float getSto_longi() {
		return sto_longi;
	}
	public void setSto_longi(float sto_longi) {
		this.sto_longi = sto_longi;
	}
	public int getSto_max_table() {
		return sto_max_table;
	}
	public void setSto_max_table(int sto_max_table) {
		this.sto_max_table = sto_max_table;
	}
	public int getSto_now_table() {
		return sto_now_table;
	}
	public void setSto_now_table(int sto_now_table) {
		this.sto_now_table = sto_now_table;
	}
	public String getSto_res_pos() {
		return sto_res_pos;
	}
	public void setSto_res_pos(String sto_res_pos) {
		this.sto_res_pos = sto_res_pos;
	}
	
	
}