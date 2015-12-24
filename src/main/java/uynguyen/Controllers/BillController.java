/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import java.util.ArrayList;

import java.util.List;
import javax.json.JsonObject;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import uynguyen.model.UserBillModel;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping("/userbill")
public class BillController extends RootController {

    public BillController() {
        super();
    }

    @RequestMapping(value = {"/getAll.do"}, method = RequestMethod.GET)
    public String getAll(Model model) {

        final String url = baseURL + "/bill/getUserBills/0/10";
        System.out.println(url);
        RestTemplate restTemplate = new RestTemplate();

        String response = restTemplate.getForObject(url, String.class);
        System.out.println(response);
        // JSONArray ob = new JSONArray(response);
        ArrayList<UserBillModel> result = JsonToUserBillModel(response);
        System.out.println(result.size());
        model.addAttribute("bills", result);
        return "UserBill";
    }

    private ArrayList<UserBillModel> JsonToUserBillModel(String array) {

        ArrayList<UserBillModel> result = new ArrayList<>();
        try {
            ObjectMapper mapper = new ObjectMapper();
            result = mapper.readValue(array,
                    TypeFactory.defaultInstance().constructCollectionType(List.class,
                            UserBillModel.class));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }

        return result;
    }
}
