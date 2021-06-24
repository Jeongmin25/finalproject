package job.data.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {

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
		return "login/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "login/joinForm";  //조인폼으로 가면 회원가입할수있는 페이지뜨고
	}
	
	@PostMapping("/join")
	public @ResponseBody String join(@ModelAttribute UserAccountDto user) {
		System.out.println(user);
		return "join"; //조인할때 실제로 회원가입 시킨다
	}

}
