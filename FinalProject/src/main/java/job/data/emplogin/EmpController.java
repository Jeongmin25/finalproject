package job.data.emplogin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmpController {
	
	@GetMapping("/emp/login")
	public String memberlist()
	{	
		return "/member/memberlist";//  폴더명/파일명
	}


}
