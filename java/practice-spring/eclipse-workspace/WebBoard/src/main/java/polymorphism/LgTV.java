package polymorphism;

public class LgTV implements TV{
	
	public LgTV() {
	System.out.println("lgtv start");
	}
	
	public void initMethod() {
		System.out.println("servlet의 init method와 같은 역할");
	}
	
	public void destoryMethod() {
		System.out.println("destroy될떄");
	}

	@Override
	public void powerOn() {
		System.out.println("LGTV 킴");
		
	}

	@Override
	public void powerOff() {
		System.out.println("LGTV 끔");
		
	}

	@Override
	public void volumeOn() {
		System.out.println("LGTV 소기킴");
		
	}
	@Override
	public void volumeOff() {
		System.out.println("LGTV 소기끔");
		
	}

}
