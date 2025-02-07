package entity;

public class User5 {
	private String seq;
	private String name;
	private String getnder;
	private int age;
	private String addr;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGetnder() {
		return getnder;
	}
	public void setGetnder(String getnder) {
		this.getnder = getnder;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Override
	public String toString() {
		return "User5 [seq=" + seq + ", name=" + name + ", getnder=" + getnder + ", age=" + age + ", addr=" + addr
				+ "]";
	}
	
	
}
