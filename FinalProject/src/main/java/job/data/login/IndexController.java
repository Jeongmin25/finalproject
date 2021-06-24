package job.data.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	
	@Autowired
	UserAccountMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/user")
	public @ResponseBody String user() {
		return "user";
	}
	
	@GetMapping("/emp")
	public @ResponseBody String emp() {
		return "emp";
	}
	
	@GetMapping("/admin")
	public @ResponseBody String admin() {
		return "admin";
	}
	
	//스프링시큐리티가 해당주소를 낚아채버림. 나중에 수정예정
	//SecurityConfig파일을 추가하고나서 스프링시큐리티가 낚아채지 않음.
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";  //조인폼으로 가면 회원가입할수있는 페이지뜨고
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserAccountDto user) {
		System.out.println(user);
		user.setRole("ROLE_USER");//유저의 롤은 ROLE_USER로 강제 주입 //유저의 아이디는 오토인크리먼트로 자동으로 만들어질거임.
		String rawPassword=user.getPassword();
		String encPassword=bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		mapper.insertUserAccount(user);
		
		return "redirect:/index"; //조인할때 실제로 회원가입 시킨다
	}
	
	
//	@GetMapping("/user/idcheck")
//	public @ResponseBody Map<String, Integer> idCheck(
//			@RequestParam String id)
//	{
//		Map<String,Integer> map=new HashMap<String, Integer>();
//		int count=1;
//		System.out.println(count);
//		map.put("count", count);
//		return map;
//	}

}


