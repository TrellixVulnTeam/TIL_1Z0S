package polymorphism;

import org.springframework.stereotype.Component;

@Component("sony")
public class SonySpeaker implements Speaker {

	public SonySpeaker() {
		System.out.println("sony��ü����");

	}

	@Override
	public void volumeUp() {
		System.out.println("sonyspeaker volume up");

	}

	@Override
	public void volumeDown() {
		System.out.println("sonyspeaker volume down");

	}

}
