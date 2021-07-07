package job.data.pjlist;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import job.data.gonggo.CategoryDto;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;


@Controller
public class Listcontroller {
	
	
	@Autowired
	CompanyMapper mapper;
	
	@GetMapping("/pjlist/test")
	public String index(){
		
		return "/pjlist/list";	
	}
	
	
	 @GetMapping("/pjlist")
	   public ModelAndView pjlist() {
	      ModelAndView mview =new ModelAndView();
	      //목록 가져오기
	      List<CompanyDto> gonggolist=mapper.getAlldatas();
	      Date date=new Date();
        long time= date.getTime();
        
        mview.addObject("date", date);
        mview.addObject("time",time);
	    mview.addObject("gonggolist",gonggolist);
	      
	      for(CompanyDto d:gonggolist)
	      
	      mview.setViewName("/pjlist/list");
	      return mview;
	   }
	 
	 
	 @GetMapping({"pjlist/gonggodetail"})
	   public ModelAndView gonggo(String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   	CompanyDto dto=new CompanyDto();
		    dto= mapper.getData(num);
			mview.addObject("dto",dto);
									
			List<CategoryDto>cdto=dto.getCategory();
			mview.addObject("cdto",cdto);
			mview.addObject("num",dto.getNum());
	
			mview.setViewName("gonggo/gonggodetail");
			return mview;
	   }

}
