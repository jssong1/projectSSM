package ssm.mainPg.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.cg.vo.Edu_ScheduleVO;
import ssm.mainPg.service.PagePortalService;
import ssm.mainPg.vo.PagePortalVO;

@Controller
@RequestMapping(value="/link")
public class PagePortalController {
	
	Logger logger = Logger.getLogger(PagePortalController.class);
	
	@Autowired
	private PagePortalService pagePortalService;
	
	@ResponseBody
	@RequestMapping(value="/npPortal")
	public List<PagePortalVO> npPortal(){
		logger.info("(log)Controller start >>>");
		
		PagePortalVO ppvo = new PagePortalVO();
		List<PagePortalVO> npList = pagePortalService.npPortal(ppvo);
		
		logger.info("(log)Controller end <<<");
		
		return npList;
	}
	
	@ResponseBody
	@RequestMapping(value="/nbPortal")
	public List<PagePortalVO> nbPortal(){
		logger.info("(log)Controller start >>>");
		
		PagePortalVO ppvo = new PagePortalVO();
		List<PagePortalVO> nbList = pagePortalService.nbPortal(ppvo);
		
		logger.info("(log)Controller end >>>");
		
		return nbList;
	}
	

}
