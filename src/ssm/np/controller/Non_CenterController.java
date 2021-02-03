package ssm.np.controller;


import java.util.ArrayList;
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

import ssm.np.service.Non_CenterService;
import ssm.np.vo.Non_CenterVO;



@Controller
@RequestMapping(value="/NonCenter")
public class Non_CenterController {
	Logger logger = Logger.getLogger(Non_CenterController.class);
	
	
	@Autowired
	private Non_CenterService non_CenterService;
	
	
	// 리스트, 지도 불러오기
	@RequestMapping(value="/ncList",method={RequestMethod.GET,RequestMethod.POST})
	public String nCenterList(@ModelAttribute Non_CenterVO ncvo, Model model){
		logger.info("nCenterList Controller >>> ");
		String url = "";
		
		List<Non_CenterVO> list =  non_CenterService.nCenterList(ncvo);
		logger.info(list);
				
		model.addAttribute("ncList",list);
		logger.info("nCenterList Controller <<< ");
		
		return "np/nonCenter";
	}

}
