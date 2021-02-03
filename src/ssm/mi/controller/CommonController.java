package ssm.mi.controller;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/jsp")
public class CommonController {
	
	@RequestMapping(value="/cg/{pageName}")
	public String goPage(@PathVariable("pageName")String pageName){
		System.out.println("goPage");
	return "/cg/"+pageName;
	}
	@RequestMapping(value="/cg/visit/{pageName}")
	public String goVisitPage(@PathVariable("pageName")String pageName){
		System.out.println("goVisitPage");
	return "cg/visit/vrStudent/"+pageName;
	}
	
	@RequestMapping(value="sncalendar")
	   public String sncalendar(){
	      System.out.println("");

	      return "/sncalendar";
	   }
}
