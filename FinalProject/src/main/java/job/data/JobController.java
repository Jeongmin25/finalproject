package job.data;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobController {
	@GetMapping("/")
	public String home()
	{
		return "layout";
	}
		
}