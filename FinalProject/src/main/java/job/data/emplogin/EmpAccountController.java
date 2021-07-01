package job.data.emplogin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmpAccountController {
	
	@Autowired
	EmpAccountMapper mapper;
	
	@GetMapping("/emplist")
	public ModelAndView emplist()
	{	
		ModelAndView mv=new ModelAndView();
		//총갯수
		int totalCount=mapper.getTotalCountOfEmp();
		mv.addObject("totalCount", totalCount);
		mv.setViewName("/emp/emplist");
		return mv;//  폴더명/파일명
	}
	
	@GetMapping("/empLogin")
	public String loginform()
	{
		return "/emp/empLoginForm";
	}
	
	@GetMapping("/empJoin")
	public String empJoin()
	{
		return "/emp/empJoinForm";
	}
	
	//왜 이메일 카운트 안될까?
	@ GetMapping("/emp/emailcheck")
	public ModelAndView emailCheck(@RequestParam 
			(value="email", required = false, defaultValue = "0") String email)
	{
		ModelAndView mv=new ModelAndView();
		int count=mapper.emailCheckOfEmp(email);
		mv.addObject("emailCheck", count);
		mv.setViewName("/emp/emplist");
		return mv;
	}
	
	@PostMapping("/empinsert") 
	 public String insert(@ModelAttribute EmpAccountDto dto) 
	 {
		 mapper.insertEmpAccount(dto);
		 return "redirect:/"; 
	 }


}
