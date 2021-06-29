package job.data.gonggo;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import job.data.CompanyDto;


@Controller
public class GonggoContoroller {
	  @Autowired
	  	CompanyMapper mapper;
		String uploadName;//photo 폴더에 업로드 되는 실제 사진 파일명
		
	   @GetMapping("/gonggolist")
	   public ModelAndView index() {
	      ModelAndView mview =new ModelAndView();
	      //총 개수
	      int totalCount=mapper.getTotalCount();
	      mview.addObject("totalCount",totalCount);
	      
	      
	      //목록 가져오기
	      List<CompanyDto> gonggolist=mapper.getAlldatas();
	      mview.addObject("gonggolist",gonggolist);
	      for(CompanyDto d:gonggolist)
	    	  System.out.println(d.getDeadline());
	      mview.setViewName("/gonggo/gonggolist");
	      return mview;
	   }
	   @GetMapping({"/gonggodetail"})
	   public ModelAndView gonggo(@RequestParam String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   CompanyDto dto=mapper.getData(num);
			mview.addObject("dto",dto);
			mview.setViewName("/gonggo/gonggodetail");
			return mview;
	   }
	   
	   @PostMapping("/detail")
	   public CompanyDto getData(String num)
	   {
		   return mapper.getData(num);
	   }
	   
	   @PostMapping("/insert")
		public String insert(@ModelAttribute CompanyDto dto,HttpServletRequest request)
		{
			String path=request.getSession().getServletContext().getRealPath("/gonggophoto");
			System.out.println(path);
			//파일명 앞에 붙일 날짜 구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName="photo"+sdf.format(new Date())+"_"+dto.getUpload().getOriginalFilename();
			//파일명= "photo"+ 날짜(년월일시분초)+dto에 업로드된 실제 파일이름
			//dto에 업로드될 파일명 저장
			dto.setEmpimg(fileName);
			
			//업로드 transferTo : 업로드한 파일 데이터를 지정한 파일에 저장
			MultipartFile uploadFile=dto.getUpload();
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//db insert
			mapper.insertGonggo(dto);
			return "redirect:gonggolist";
		}
	   
	   @GetMapping({"/writeform"})
	   public String from()
	   {
		   return "/gonggo/writegonggo";
	   }
	   
	   
	   @GetMapping("/delete")
	   public String delete(@RequestParam String num)
	   {
		   mapper.deleteGonggo(num);
		   return "redirect:gonggolist";
	   }

}
