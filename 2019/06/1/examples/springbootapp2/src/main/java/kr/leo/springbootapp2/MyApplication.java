package kr.leo.springbootapp2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import java.io.Console;
import java.util.Arrays;

@SpringBootApplication(scanBasePackages = "kr.leo")
public class MyApplication  {

	private static final Logger LOGGER = LoggerFactory.getLogger(MyApplication.class);

	public static void main(String[] args) {

		Console c = System.console();
		String login = c.readLine("Enter your login: ");
		char [] oldPassword = c.readPassword("Enter your old password: ");

		if (verify(login, oldPassword)) {
			boolean noMatch;
			do {
				char [] newPassword1 = c.readPassword("Enter your new password: ");
				char [] newPassword2 = c.readPassword("Enter new password again: ");
				noMatch = ! Arrays.equals(newPassword1, newPassword2);
				if (noMatch) {
					c.format("Passwords don't match. Try again.%n");
				} else {
					change(login, newPassword1);
					c.format("Password for %s changed.%n", login);
				}
				Arrays.fill(newPassword1, ' ');
				Arrays.fill(newPassword2, ' ');
			} while (noMatch);
		}

		Arrays.fill(oldPassword, ' ');
	}

	// Dummy verify method
	static boolean verify(String login, char[] password) {
		return true;
	}

	// Dummy change method
	static void change(String login, char[] password) {
	}

}
