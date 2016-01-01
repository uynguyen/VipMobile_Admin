/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import uynguyen.form.LoginForm;
import uynguyen.model.AccessTokenModel;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping(value = {"/user", "/"})
public class AccountController extends RootController {

    public AccountController() {
        super();
    }

    @RequestMapping(value = {"/login.do", "/"}, method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("loginForm", new LoginForm());
        model.addAttribute("mess", "");
        return "Login";
    }

    @RequestMapping(value = {"/logout.do"}, method = RequestMethod.GET)
    public ModelAndView logout(Model model, HttpSession session) {
        session.setAttribute("User", null);
        ModelAndView modelAndView = new ModelAndView("redirect:/user/login.do");
        return modelAndView;
    }

    @RequestMapping(value = {"/postLogin.do"}, method = RequestMethod.POST)
    public ModelAndView doLogin(LoginForm data, Model model, HttpSession session, HttpServletRequest request) {
        try {

            final String url = baseURL + "/user/login?Role=admin";

            JSONObject outputJsonObj = new JSONObject();
            outputJsonObj.put("username", data.getUsername());
            outputJsonObj.put("password", data.getPassword());
            String user = outputJsonObj.toString();

            String response = postRestAPI(url, user, request);

            AccessTokenModel accessToken = (AccessTokenModel) JsonToModel(response, new AccessTokenModel());

            if (accessToken.getMess().compareTo("Success") == 0) {
                session.setAttribute("User", accessToken);

                return new ModelAndView("redirect:/dashboard/home.do");
            } else {

                ModelAndView modelAndView = new ModelAndView("redirect:/user/login.do");
                modelAndView.addObject("mess", accessToken.getMess());
                return modelAndView;
            }
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView modelAndView = new ModelAndView("redirect:/user/login.do");
            modelAndView.addObject("mess", "Có lỗi xảy ra");
            return modelAndView;
        }

    }

    @RequestMapping(value = {"/requireToken.do"}, method = {RequestMethod.GET})
    public ModelAndView
            requireToken(Model model) {
        System.out.println("requiretoken");

        ModelAndView modelAndView = new ModelAndView("redirect:/user/login.do");
        modelAndView.addObject("mess", "Require token");
        return modelAndView;

    }

}
