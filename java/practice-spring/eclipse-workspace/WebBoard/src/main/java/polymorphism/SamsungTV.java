package polymorphism;

public class SamsungTV implements TV {
	
	private SonySpeaker speaker;

	
	public SamsungTV() {
	System.out.println("saumsungtv ��ü����");
	}
	
	public SamsungTV(SonySpeaker speaker) {
	System.out.println("saumsungtv ��ü����22222222222222");
	this.speaker = speaker;
	}

	
	@Override
	public void powerOn() {
		System.out.println("�ＺƼ������");
	}
	@Override
	public void powerOff() {
		System.out.println("�ＺƼ����");
	}

	@Override
	public void volumeOn() {
		System.out.println("�ＺƼ�� �Ҹ�Ŵ");

	}

	@Override
	public void volumeOff() {
		System.out.println("�ＺƼ�� �Ҹ���");

	}

}
