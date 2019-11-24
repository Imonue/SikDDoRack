package Infomation;

public class Customer {
	
	private String cus_name;
	private String cus_id;
	private String cus_pw;
	private String cus_phone;
	
	public Customer() {
		super();
	}
	
	public Customer(String cus_name, String cus_id, String cus_pw, String cus_phone) {
		super();
		this.cus_name = cus_name;
		this.cus_id = cus_id;
		this.cus_pw = cus_pw;
		this.cus_phone = cus_phone;
	}
	
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_pw() {
		return cus_pw;
	}
	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}
	public String getCus_phone() {
		return cus_phone;
	}
	public void setCus_phone(String cus_phone) {
		this.cus_phone = cus_phone;
	}
}
