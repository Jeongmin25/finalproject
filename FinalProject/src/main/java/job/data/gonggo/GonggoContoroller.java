package job.data.gonggo;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import job.data.CompanyDto;



@Controller
public class GonggoContoroller {
	  @Autowired
	  	CompanyMapper mapper;
	   @GetMapping("/gonggolist")
	   public ModelAndView index() {
	      ModelAndView mview =new ModelAndView();
	      //총 개수
	      int totalCount=mapper.getTotalCount();
	      mview.addObject("totalCount",totalCount);
	      
	      
	      //목록 가져오기
	      List<CompanyDto> gonggolist=mapper.getAlldatas();
	      mview.addObject("gonggolist",gonggolist);
	      mview.setViewName("index.jsp?go=gonggo/gonggolist");
	      return mview;
	   }

}
