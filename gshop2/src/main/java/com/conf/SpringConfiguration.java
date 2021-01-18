package com.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;
/*
 * Spring Configuration 클래스
 */
@EnableTransactionManagement
@Configuration
public class SpringConfiguration extends WebMvcConfigurationSupport {
	
	/*
	 * CLass로 DB연동 설정
	 * 
	 */
	@Bean(name="dataSource")
	public BasicDataSource getBasicDataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		basicDataSource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
		basicDataSource.setUsername("ora_user");
		basicDataSource.setPassword("1234");
		basicDataSource.setMaxTotal(20);
		basicDataSource.setMaxIdle(3);
		return basicDataSource;
	}
	@Bean(name="sqlSessionFactory")
	public SqlSessionFactory getSqlSessionFactoryBean() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		
		PathMatchingResourcePatternResolver pmrpr = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setDataSource(getBasicDataSource());
		sqlSessionFactoryBean.setConfigLocation(pmrpr.getResource("mybatis-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(pmrpr.getResources("*/dao/*Mapper.xml"));
		
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean(name="sqlSession")
	public SqlSessionTemplate getSqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(getSqlSessionFactoryBean());
	}
	
	@Bean(name="transactionManager")
	public DataSourceTransactionManager getDataSourceTransactionManager() {
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		dataSourceTransactionManager.setDataSource(getBasicDataSource());
		return dataSourceTransactionManager;
	}
	
	/*
	 *  MultipartResolver : 스프링은 Multipart 지원 기능을 제공하고 있기 때문에, 이기능을 이용하면 추가적인 
							처리없이	Multipart 형식으로 전송된 파라미터와 파일 정보를 쉽게 구할 수 있음.					
	 *	Multipart 지원 기능을 이용하려면 먼저 MultipartResolver를 스프링 설정 파일에 등록해 주어야 한다. MultipartResolver는 Multipart 형식으로 데이터가 전송된 경우, 해당 데이터를 스프링 MVC에서 사용할 수 있도록 변환해준다.
		스프링이 기본으로 제공하는 MultipartResolver는 CommmnosMultipartResolver이다. CommmnsMultipartResolver는 Commons FileUpload API를 이용해서 Multipart를 처리해준다.
		CommmonsMultipartResolver를 MultipartResolver로 사용하려면 다음과 같이 빈 이름으로 "multipartResolver"를 등록하면 된다
	 */						
	@Bean(name="multipartResolver")
	public MultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}
	
	/*
	 * Spring Security에서는 비밀번호를 안전하게 저장할 수 있도록 비밀번호의 단방향 암호화를 지원하는 PasswordEncoder 인터페이스와 구현체들을 제공 
	 */
	@Bean(name="passwordEncoder")
	public PasswordEncoder passwordEncoder(){
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}	
	
	/*
	 *  XSS(Cross Site Scripting) 공격에 대한 방어를 하기 위해 네이버에서 개발한 Lucy-Xss-Servlet-Filter 라이브러리를 사용
		사용 x
	 */
    @Bean
    public XssEscapeServletFilter xssFilterBean(){
        return new XssEscapeServletFilter();
    }	
}





