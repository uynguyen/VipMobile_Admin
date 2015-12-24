/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;


import javax.json.Json;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import uynguyen.form.LoginForm;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping("/user")
public class AccountController extends RootController {

    public AccountController() {
        super();
    }

    @RequestMapping(value = {"/login.do", "/"}, method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("loginForm", new LoginForm());
        return "Login";
    }

    @RequestMapping(value = {"/postLogin.do"}, method = RequestMethod.POST)
    public String doLogin(LoginForm data, Model model, HttpSession session) {
        try {
            System.out.println(data.getUsername() + data.getPassword());
            final String url = baseURL + "/user/login";
            System.out.println(url);
            JSONObject outputJsonObj = new JSONObject();
            outputJsonObj.put("username", data.getUsername());
            outputJsonObj.put("password", data.getPassword());
            String user = outputJsonObj.toString();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            RestTemplate restTemplate = new RestTemplate();
            HttpEntity<String> entity = new HttpEntity<String>(user, headers);

            String response = restTemplate.postForObject(url, entity, String.class);

            JSONObject ob = new JSONObject(response);
            System.out.println(ob.get("token"));
            return "redirect:/dashboard/home.do";
        } catch (Exception e) {

            return "redirect:/login.do";
        }

    }

}
