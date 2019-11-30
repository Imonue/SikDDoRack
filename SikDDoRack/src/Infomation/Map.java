package Infomation;


public class Map {
	
	public static Map instance = new Map(); // Map ΩÃ±€≈Ê ∞¥√º
	
	private float init_lati = 37.451809f;
	private float init_longi = 126.657327f;
	
	Map(){
		super();
	}

	///////////////////////////////////Getter / Setter///////////////////////////////////
	
	public float getInit_lati() {
		return init_lati;
	}

	public void setInit_lati(float init_lati) {
		this.init_lati = init_lati;
	}

	public float getInit_longi() {
		return init_longi;
	}

	public void setInit_longi(float init_longi) {
		this.init_longi = init_longi;
	}
	
}
