package com.groupone.aviationsys.api.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Controller
public class ViewController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model){
        return "index";
    }
}
