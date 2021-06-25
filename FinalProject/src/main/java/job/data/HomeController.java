package job.data;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/tiles/index")
	public String home()
	{
		return "index";
	}
	
}