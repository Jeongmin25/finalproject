package job.data.pjlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import job.data.gonggo.CompanyMapper;

@Controller
public class Listcontroller {
	
	
	@Autowired
	CompanyMapper mapper;
	
	@GetMapping("/pjlist/test")
	public String index(){
		
		return "/pjlist/list";	
	}
	

}
