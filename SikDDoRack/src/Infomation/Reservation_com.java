package Infomation;

public class Reservation_com {
	
	private String res_id_com;
	private String cus_id_com;
	private String sto_id_com;
	private String sto_name_com;
	private String res_date_com;
	private int cus_count_com;
	
	public Reservation_com() {
		super();
	}
	
	public Reservation_com(String res_id_com, String cus_id_com, String sto_id_com, String sto_name_com, String res_date_com, int cus_count_com) {
		this.res_id_com = res_id_com;
		this.cus_id_com = cus_id_com;
		this.sto_id_com = sto_id_com;
		this.sto_name_com = sto_name_com;
		this.res_date_com = res_date_com;
		this.cus_count_com = cus_count_com;
	}

	public String getRes_id_com() {
		return res_id_com;
	}

	public void setRes_id_com(String res_id_com) {
		this.res_id_com = res_id_com;
	}

	public String getCus_id_com() {
		return cus_id_com;
	}

	public void setCus_id_com(String cus_id_com) {
		this.cus_id_com = cus_id_com;
	}

	public String getSto_id_com() {
		return sto_id_com;
	}

	public void setSto_id_com(String sto_id_com) {
		this.sto_id_com = sto_id_com;
	}

	public String getSto_name_com() {
		return sto_name_com;
	}

	public void setSto_name_com(String sto_name_com) {
		this.sto_name_com = sto_name_com;
	}
	
	public String getRes_date_com() {
		return res_date_com;
	}

	public void setRes_date_com(String res_date_com) {
		this.res_date_com = res_date_com;
	}

	public int getCus_count_com() {
		return cus_count_com;
	}

	public void setCus_count_com(int cus_count_com) {
		this.cus_count_com = cus_count_com;
	}
}
