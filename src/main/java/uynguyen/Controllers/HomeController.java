/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping("/dashboard")
public class HomeController {
    @RequestMapping(value = {"/home.do"}, method = RequestMethod.GET)
    public String list(Model model) {

        return "Home";
    }

}
