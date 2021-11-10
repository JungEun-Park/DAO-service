package com.spring.shop.covid;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class covidController {
	
	// covid∆‰¿Ã¡ˆ
	@RequestMapping(value = "/covid", method = RequestMethod.GET)
	public String covid(HttpServletRequest req) {
		req.setAttribute("content", "covid/covidMain.jsp");
		return "home";
	}

}
