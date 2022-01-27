package probada;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TestSample {
	
	
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		System.out.println(sdf.format(new Date()));
	}
	
}
