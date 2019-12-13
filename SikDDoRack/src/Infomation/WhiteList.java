package Infomation;

public class WhiteList {
	public static WhiteList instance = new WhiteList();
	
	private String[] whitelistFrame = {
			"../Frame/Main_Frame.jsp",
			"../Frame/Customer_Frame.jsp",
			"../Frame/Store_Frame.jsp",
			"../Frame/Login_Frame.jsp",
			"../Frame/Sign_Up_Cus_Frame.jsp",
			"../Frame/Sign_Up_Sto_Frame.jsp",
			"../Frame/Modify_User_Frame.jsp"
	};
	
	private String[] whitelistJsp = {
			"../Jsp/Top.jsp",
			"../Jsp/Map.jsp",
			"../Jsp/MapMenu.jsp",
			"../Jsp/Cus_Status.jsp",
			"../Jsp/Cus_Status2.jsp",
			"../Jsp/Menu.jsp",
			"../Jsp/Store_Status.jsp",
			"../Jsp/Store_Status2.jsp",
			"../Jsp/Login.jsp",
			"../Jsp/Sign_Up_Cus.jsp",
			"../Jsp/Sign_Up_Sto.jsp",
			"../Jsp/Modify_User.jsp"
	};
	
	private String[] whitelistScript = {
			"../Scriptlet/Login_Check.jsp",
			"../Scriptlet/Sign_Up_Check.jsp",
			"../Scriptlet/Logout.jsp"
	};
	
	WhiteList() {
		
	}

	public String getWhitelistFrame(int i) {
		return whitelistFrame[i];
	}

	public String getWhitelistJsp(int i) {
		return whitelistJsp[i];
	}

	public String getWhitelistScript(int i) {
		return whitelistScript[i];
	}
	
	
}
