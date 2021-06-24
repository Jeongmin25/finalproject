package job.data.gonggo;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	   @GetMapping({"/gonggodetail"})
	   public ModelAndView gonggo(@RequestParam String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   CompanyDto dto=mapper.getData(num);
			mview.addObject("dto",dto);
			mview.setViewName("index.jsp?go=gonggo/gonggodetail");
			return mview;
	   }
	   
	   @PostMapping("/detail")
	   public CompanyDto getData(String num)
	   {
		   return mapper.getData(num);
	   }
	   
	   @GetMapping({"/writeform"})
	   public String from()
	   {
		   return "index.jsp?go=gonggo/writegonggo";
	   }

}
