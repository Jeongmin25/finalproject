package job.data.login;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터체인에 등록이된다.
public class SecurityConfig extends WebSecurityConfigurerAdapter {
// 위와같이 설정해주면, 이제 사이트 전체가 잠겨서, 비밀번호를 쳐야 접근할 수 있게 된다. 
//원활한 프로젝트 진행을 위해 일단 페이지의 인증을 해제하자.
	
	
	//해당 메서드의 리턴되는 오브젝트를 IOC로 등록해준다.
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception{
		http.csrf().disable();
		http.authorizeRequests()
		.antMatchers("/user/**").authenticated() //user로 매핑된 주소로 들어오면 인증이 필요
		.antMatchers("/emp/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMP')") //로그인해도 어드민이나 기업권한이 있어야 들어갈수있음
		.antMatchers("/admin/**").access("hasRole('ROLE_EMP')") //어드민권한이 있어야 들어갈 수 있음
		.anyRequest().permitAll() //위주소에 해당하지 않는 나머지 주소들을 요청시 다 허가
		.and()
		.formLogin()
		.loginPage("/loginForm")
		.loginProcessingUrl("/login") // "/login"이라는 주소가 호출이 되면 시큐리티가 낚아채서 대신 로그인을 진행해준다. -> 때문에 컨트롤러에 /login을 따로 추가해주지 않아도됨
		.defaultSuccessUrl("/");
	
	}
}
