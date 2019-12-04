package msg.utils;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class Statics {
	int a = 0;
	public static BasicDataSource bds = new BasicDataSource();
	static {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("msg");
		bds.setPassword("msg");
		bds.setInitialSize(30);
	}
}
