package job.data.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.admin.AdminMapper;

@Controller
public class AdminHomeController {
	  @Autowired
	   AdminMapper mapper;
	  
	  @GetMapping({"/adminmain","/adminlogin"})
		public String main()
		{
			return "/adminlogin/loginform";
		}
	 
		
		@PostMapping("/adminloginprocess")
		public String loginCheck(@RequestParam String id,
				@RequestParam String pass,HttpSession session)
		{
			int n=mapper.loginCheck(id, pass);
			if(n==1)
			{
				//세션 저장(2개)
				session.setAttribute("loginok","yes");
				session.setAttribute("myid",id);
				//메인페이지로 리다이렉트
				return "redirect:adminmain";
			}else {
				//loginfail.jsp로 포워드
				return "/adminlogin/loginfail";
				
			}
			
		}
		
		@GetMapping({"/adminlogout"})
		public String logout(HttpSession session)
		{
			session.removeAttribute("loginok");
			session.removeAttribute("myid");
			return "/adminlogin/loginform";
			
		}
		
	  
	  @GetMapping("/adminmember/list")
		public String member()
		{
			return "/adminmember/list";
		}

	  @GetMapping("/adminpayment/list")
		public String payment()
		{
			return "/adminpayment/list";
		}
	  
	  @GetMapping("/adminjobnotice/list")
		public String jobnotice()
		{
			return "/adminjobnotice/list";
		}
	  
	  @GetMapping("/adminempreview/list")
		public String empreview()
		{
			return "/adminempreview/list";
		}
	  
	  
	
		
		
	  
	  
	  


}
