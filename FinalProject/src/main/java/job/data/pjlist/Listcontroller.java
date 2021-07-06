package job.data.pjlist;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import job.data.gonggo.CategoryDto;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;

@Controller
public class Listcontroller {
	
	
	@Autowired
	CompanyMapper mapper;
	
	@GetMapping("/pjlist")
	public String index(){
		
		return "/pjlist/list";	
	}
	
	
	@PostMapping("/pjlist/test")
	   public String pjListTest(
			   @ModelAttribute CompanyDto dto,
			   @ModelAttribute CategoryDto category,
			   HttpServletRequest request)
	   {
		   String path=request.getSession().getServletContext().getRealPath("/gonggophoto"); 
		   System.out.println(path); 
		   
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		   String fileName="photo"+sdf.format(new Date())+"_"+dto.getUpload().getOriginalFilename();
		   //파일명= "photo"+날짜(년월일시분초)+dto에 업로드된 실제 파일이름
		   dto.setEmpimg(fileName);
		   MultipartFile uploadFile=dto.getUpload();
		   try { 
				 uploadFile.transferTo(new File(path+"\\"+fileName));
				} catch(IllegalStateException | IOException e) { 
					e.printStackTrace(); } 
		   
		   //db insert 
			mapper.insertGonggo(dto);
			int num=mapper.getInsertNum();
			category.setNum(num);
			
			String ctg[]=category.getCtg().split(",",-1);
			String tag[]=category.getTag().split(",",-1);
			
			for(int i=0; i<ctg.length; i++) {
				category.setCtg(ctg[i]);
				category.setTag(tag[i]);
				mapper.insertCategory(category);
			}

			return "/pjlist/list"; 
	   }

}
