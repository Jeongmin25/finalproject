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
	  
	  @GetMapping({"/admin2/adminmain","/admin2/adminlogin"})
		public String main()
		{
			return "/admin2/adminlogin/loginform";
		}
	 
		
		@PostMapping("/admin2/adminloginprocess")
		public String loginCheck(@RequestParam String adminid,
				@RequestParam String adminpass,HttpSession session)
		{
			int n=mapper.loginCheckOfAdmin(adminid, adminpass);
			if(n==1)
			{
				//세션 저장(2개)
				session.setAttribute("loginok","yes");
				session.setAttribute("myid",adminid);
				//메인페이지로 리다이렉트
				return "/admin2/adminnotice/list";
			}else {
				//loginfail.jsp로 포워드
				return "/admin2/adminlogin/loginfail";
				
			}
			
		}
		
		@GetMapping({"/admin2/adminlogout"})
		public String logout(HttpSession session)
		{
			session.removeAttribute("loginok");
			session.removeAttribute("myid");
			return "/admin2/adminlogin/loginform";
			
		}
		
	  
	 
	  @GetMapping("/admin2/adminpayment/list")
		public String payment()
		{
			return "/admin2/adminpayment/list";
		}
	  
	  @GetMapping("/admin2/adminjobnotice/list")
		public String jobnotice()
		{
			return "/admin2/adminjobnotice/list";
		}
	  
	  @GetMapping("/admin2/adminempreview/list")
		public String empreview()
		{
			return "/admin2/adminempreview/list";
		}
	  
	  
	
		
		
	  
	  
	  


}
