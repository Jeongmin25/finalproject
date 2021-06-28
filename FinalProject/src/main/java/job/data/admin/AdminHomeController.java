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



@Controller
public class AdminHomeController {
	  @Autowired
	   AdminMapper mapper;
	  
	  @GetMapping({"/admin2"})
		public String main()
		{
			return "index";
		}
	  
	 
	  @GetMapping("/login/loginmain")
		public String login()
		{
			return "login/loginform";
		}
	  
	  @GetMapping("/member/list")
		public String member()
		{
			return "member/list";
		}

	  @GetMapping("/payment/list")
		public String payment()
		{
			return "payment/list";
		}
	  
	  @GetMapping("/jobnotice/list")
		public String jobnotice()
		{
			return "jobnotice/list";
		}
	  
	  @GetMapping("/empreview/list")
		public String empreview()
		{
			return "empreview/list";
		}
	  
	  
	
		
		
	  
	  
	  


}
