package job.data.login.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import job.data.login.UserAccountDto;

//시큐리티가 /login 주소 요청이 오면 낚아채서 로그인을 진행시킨다.
// 로그인을, 진행이 완료가 되면 시큐리티 session을 만들어준다. (Security ContextHolder)
// 오브젝ㅌ => Authentication 타입 객체
//

//security session => authentication => userdetatils(PrincipalDetails)

public class PrincipalDetails implements UserDetails {

	private UserAccountDto user; //콤포지션
	
	
	//PrincipalDetails 생성자에 user를 받아서 this에 넣어줌
	public PrincipalDetails(UserAccountDto user) {
		this.user=user;
	}
	
	
	//해당 유저의 권한을 리턴하는 곳!!
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//user.getRole() -> 리턴타입이 스트링 이라 얘를 리턴할 수 없음
		Collection<GrantedAuthority> collect = new ArrayList<>(); //arraylist는 collection의 자식
		collect.add(new GrantedAuthority() {
	
			@Override
			//스트링으로 바뀌었으니 이제 여기서 리턴
			public String getAuthority() {
				// TODO Auto-generated method stub
				return user.getRole();
			}
		});
		return collect;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getUsername();
	}

	//계정이 만료된건아닌지
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	//계정이 잠긴건 아닌지
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	//계정이 만료된건 아닌지
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	
	//계정이 활성화되어있니
	@Override
	public boolean isEnabled() {
		
		return true;
	}
		
}
