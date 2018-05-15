package com.hhi.wiart.introItem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IntroItemController {
	
	private static final Logger log = LoggerFactory.getLogger(IntroItemController.class);
	
//	@Autowired
//	private IntroItemService introItemService;
	
	@RequestMapping(value = "/introItem/list")
	public String introList(@RequestParam String type, Model model)throws Exception{
		log.debug(">>>>>>>>>>> introItem list : {}", type );
		
		model.addAttribute("type", type);
		
		return "/introItem/list";
	}
	
	@RequestMapping(value = "/introItem/list2")
	public String introList2(@RequestParam String type, Model model)throws Exception{
		log.debug(">>>>>>>>>>> introItem list : {}", type );
		
		model.addAttribute("type", type);
		
		return "/introItem/list2";
	}
	
}
