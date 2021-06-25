package job.data.login.auth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import job.data.login.UserAccountDto;
import job.data.login.UserAccountMapper;


//@Service 
//public class PrincipalDetailsService implements UserDetailsService{
//	
//	
////	// 시큐리티 session(내부 Authentication(내부 UserDtaile))
////	@Override
////	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
////		System.out.println("username:"+username);
////		
////		mapper.findByUsername(username);
////		
////		if(mapper!= null ) {
////			return new PrincipalDetails(mapper); //PrincipalDetails가 리턴될때 리턴된 값이 authentication에 들어간다
////			
////		}
////		
////		return null;
////	}
//	
//	
//
//}
