package Infomation;

public class Reservation {
	private String res_id;
	private String cus_id;
	private String sto_id;
	private String sto_name;
	private String res_date;
	private int cus_count;
	private String cus_phone;
	
	public Reservation() {
		super();
	}
	
	public Reservation(String res_id, String cus_id, String sto_id, String sto_name, String res_date, int cus_count, String cus_phone) {
		this.res_id = res_id;
		this.cus_id = cus_id;
		this.sto_id = sto_id;
		this.sto_name = sto_name;
		this.res_date = res_date;
		this.cus_count = cus_count;
		this.cus_phone = cus_phone;
	}
	
	////////////////////////////////////////////////Getter/Setter////////////////////////////////////////////////
	
	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getCus_id() {
		return cus_id;
	}

	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}

	public String getSto_id() {
		return sto_id;
	}

	public void setSto_id(String sto_id) {
		this.sto_id = sto_id;
	}
	
	public String getSto_name() {
		return sto_name;
	}

	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public int getCus_count() {
		return cus_count;
	}

	public void setCus_count(int cus_count) {
		this.cus_count = cus_count;
	}

	public String getCus_phone() {
		return cus_phone;
	}

	public void setCus_phone(String cus_phone) {
		this.cus_phone = cus_phone;
	}
}
