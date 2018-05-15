package com.hhi.wiart.company.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class companyController {
	
	private String thisUrl = "/company";
	
	@RequestMapping(value = "/greet", method = {RequestMethod.GET, RequestMethod.POST})
	public String greet( Model model) {
		
		System.out.println("▶▶▶▶▶▶▶▶▶▶▶▶ 회사소개>인사말");
		
		return "/company/greet";
	}
	
	@RequestMapping(value = "intro", method = {RequestMethod.GET, RequestMethod.POST})
	public String intro(Model model){
		System.out.println("▶▶▶▶▶▶▶▶▶▶▶▶ 회사소개>회사소개");

		
		return "/company/intro";
	}

	
	@RequestMapping(value = "road", method = {RequestMethod.GET, RequestMethod.POST})
	public String road(Model model){
		System.out.println("▶▶▶▶▶▶▶▶▶▶▶▶ 회사소개>오시는길");

		String apiKey = "43b605999b1d71249f35dc6bfa278be4";
		
		model.addAttribute("apiKey", apiKey);
		
		System.out.println("▶▶▶▶▶▶▶▶▶▶▶▶ apiKey : " +apiKey );
		return "/company/road";
	}

}
