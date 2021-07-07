package job.data.pjlist;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import job.data.emplogin.EmpAccountMapper;
import job.data.gonggo.CategoryDto;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;


@Controller
public class Listcontroller {
	
	
	@Autowired 
	PjlistMapper mapper;
	
	@Autowired
	CompanyMapper cmapper;
	
	@Autowired
	EmpAccountMapper empmapper;

	
	@GetMapping("/pjlist/list")
	public String list(){
		
		return "/pjlist/list";	
	}
	
	
	 @GetMapping("/pjlist")
	   public ModelAndView pjlist() {
	      ModelAndView mview =new ModelAndView();
	      //목록 가져오기
	     List<CompanyDto> gonggolist=cmapper.getAlldatas();
	     Date date=new Date();
        long time= date.getTime();
        
        mview.addObject("date", date);
        mview.addObject("time",time);
	    mview.addObject("gonggolist",gonggolist);
	      
	      for(CompanyDto d:gonggolist)
	      
	      mview.setViewName("/pjlist/list");
	      return mview;
	   }
	 
	 
	 
	 
		/*
		 * //empname에 해당하는 데이터 출력 
		 * HashMap<String, Object> map = new HashMap<String,Object>(); 
		 * map.put("empname", empname); map.put("start", start);
		 * map.put("perpage", perPage);
		 * 
		 * List<reviewDto> empdata=mapper.getReviewDataOfEmp(map);
		 * mview.addObject("empdata",empdata);
		 */
	 
	 
	 @GetMapping({"pjlist/gonggodetail"})
	   public ModelAndView gonggo(String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   	CompanyDto dto=new CompanyDto();
		    dto= cmapper.getData(num);
			mview.addObject("dto",dto);
									
			List<CategoryDto>cdto=dto.getCategory();
			mview.addObject("cdto",cdto);
			mview.addObject("num",dto.getNum());
	
			mview.setViewName("gonggo/gonggodetail");
			return mview;
	   }
	 

}
