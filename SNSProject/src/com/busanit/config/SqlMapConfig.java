package com.busanit.config;
import java.io.Reader;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
public class SqlMapConfig {
	private static final SqlMapClient sqlMap;
	static {
	try {
		String resource = "com/busanit/config/SqlMapConfig.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
	} catch (Exception e) {
	e.printStackTrace();
	throw new RuntimeException("Error initializ ing class. Cause:" + e);
	}
	}
	public static SqlMapClient getSqlMapInstance() {
		return sqlMap;
	}
}
