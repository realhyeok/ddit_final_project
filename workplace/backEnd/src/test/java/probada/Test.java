package probada;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.Base64Utils;

public class Test {

	public static void main(String[] args) {

		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

		String pw = pwdEncoder.encode("12345");

		System.out.println(pw);

		// $2a$10$Tuw5/C5J7N5CMJDMJEcWve7jO9gy4cdXiL6wptQS0hh7bt0BoQN4a
		// $2a$10$ZAPiLEAdTDA6xe1zVUlQ5uDlGUGC1zzaEp914JPuoBsMGmel//ER6
		
		String ddd = Base64Utils.encodeToString("$2a$10$ZAPiLEAdTDA6xe1zVUlQ5uDlGUGC1zzaEp914JPuoBsMGmel//ER6".getBytes());

		System.out.println(ddd);
		// 이값을 DB에 저장...
		
		
		byte[] en = Base64Utils.decodeFromString(ddd);

//		boolean s = pwdEncoder.matches("12345", new String(en));
		boolean s = pwdEncoder.matches("Wlsgur@4852", new String("$2a$10$CwDyt/.grkegFcthcO8IvuO5XfdaWMpejD2kdoTYBTSJ8fwTiLLTu"));
		System.out.println(s);

	}

}
