package setAccount;

public class accountDTO {
	private static String name;
	private static String id;
	private static String pwd;
	private String accPwd;
	private String account;
	private String money;

	public static String getName() {
		return name;
	}

	public void setName(String name) {
		accountDTO.name = name;
	}

	public static String getId() {
		return id;
	}

	public void setId(String id) {
		accountDTO.id = id;
	}

	public static String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		accountDTO.pwd = pwd;
	}

	public String getAccPwd() {
		return accPwd;
	}

	public void setAccPwd(String accPwd) {
		this.accPwd = accPwd;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

}
