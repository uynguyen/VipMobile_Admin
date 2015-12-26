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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import uynguyen.model.BillDetailModel;
import uynguyen.model.BillStateModel;
import uynguyen.model.UpdateUserBillModel;
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

    @RequestMapping(value = {"/getDetail.do/{id}"}, method = RequestMethod.GET)
    public String getDetail(@PathVariable("id") int id, Model model) {

        final String url = baseURL + "/bill/getBillDetail/" + id;
        System.out.println(url);
        RestTemplate restTemplate = new RestTemplate();

        String response = restTemplate.getForObject(url, String.class);
        System.out.println(response);

        ArrayList<Object> result = JsonToArrayModel(response, new BillDetailModel());
        System.out.println(result.size());
        model.addAttribute("BillDetail", result);

        return "BillDetail";
    }

    private ArrayList<Object> JsonToArrayModel(String array, Object template) {

        ArrayList<Object> result = new ArrayList<>();
        try {
            ObjectMapper mapper = new ObjectMapper();
            result = mapper.readValue(array,
                    TypeFactory.defaultInstance().constructCollectionType(List.class,
                            template.getClass()));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }

        return result;
    }

    @RequestMapping(value = {"/getAll.do"}, method = RequestMethod.GET)
    public String getAll(Model model) {

        String url = baseURL + "/bill/getUserBills/0/10";
        System.out.println(url);
        RestTemplate restTemplate = new RestTemplate();

        String response = restTemplate.getForObject(url, String.class);
        System.out.println(response);
        // JSONArray ob = new JSONArray(response);
        ArrayList<Object> result = JsonToArrayModel(response, new UserBillModel());
        System.out.println(result.size());
        model.addAttribute("bills", result);

        url = baseURL + "/bill/getBillState";
        response = restTemplate.getForObject(url, String.class);

        result = JsonToArrayModel(response, new BillStateModel());
        System.out.println(result.size());
        model.addAttribute("billState", result);
        return "UserBill";
    }

    @RequestMapping(value = {"/updateBills.do"}, method = RequestMethod.POST, consumes = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody String updateBills(Model model, @RequestBody UpdateUserBillModel listBills) {
        System.out.println("Call update bills");
        System.out.println(listBills.getId_bills().size());

        String url = baseURL + "/bill/updateBillState";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        JSONObject outputJsonObj = new JSONObject();
        outputJsonObj.put("id_bills", listBills.getId_bills());
        outputJsonObj.put("id_state", listBills.getId_state());
        String jsonstr = outputJsonObj.toString();
        System.out.println(jsonstr);
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> entity = new HttpEntity<String>(jsonstr, headers);

        String response = restTemplate.postForObject(url, entity, String.class);
        System.out.println(response);
      
        
        return response;

    }

}
