

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages={"com.cba.bean","com.cba.dao","com.cba.service","com.cba.controller"})
public class CBAControllerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CBAControllerApplication.class, args);
	}
}
