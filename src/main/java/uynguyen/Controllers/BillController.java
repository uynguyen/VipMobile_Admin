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
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.support.PagedListHolder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import uynguyen.form.LoginForm;

import uynguyen.model.ArrayObjectModel;
import uynguyen.model.BillDetailModel;
import uynguyen.model.BillStateModel;
import uynguyen.model.UpdateUserBillModel;
import uynguyen.model.UserBillModel;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping("/dashboard/userbill")
public class BillController extends RootController {

    public BillController() {
        super();
    }

    @RequestMapping(value = {"/getDetail.do/{id}"}, method = RequestMethod.GET)
    public String getDetail(@PathVariable("id") int id, Model model, HttpServletRequest request) {

        final String url = baseURL + "/bill/getBillDetail/" + id;
        String response = getRestAPI(url, request);
        ArrayList<Object> result = JsonToArrayModel(response, new BillDetailModel());
        model.addAttribute("BillDetail", result);

        return "BillDetail";
    }

    @RequestMapping(value = {"/searchBills.do"}, method = RequestMethod.GET)
    public String searchBills(Model model, @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "query_str", required = false) String query_str,
            @RequestParam(value = "date_time", required = false) String date_time,
            HttpServletRequest request) {

        System.out.println("PAGE-------------" + page);

        String url = baseURL + "/bill/searchBills/" + (page - 1) + "/5";

        JSONObject outputJsonObj = new JSONObject();
        outputJsonObj.put("query_str", query_str);
        outputJsonObj.put("date_time", date_time);
        String query = outputJsonObj.toString();
        System.out.println(query);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> entity = new HttpEntity<String>(query, headers);

        String response = restTemplate.postForObject(url, entity, String.class);

        ArrayObjectModel result = (ArrayObjectModel) JsonToModel(response, new ArrayObjectModel());

        model.addAttribute("bills", result);

        repareData(page, model, request);
        model.addAttribute("endPoint", "searchBills.do");
        model.addAttribute("ext", "&query_str=" + query_str + "&date_time=" + date_time);
        return "UserBill";
    }

    private void repareData(int page, Model model, HttpServletRequest request) {
        //Pageline
        ArrayList<Integer> pageLine = new ArrayList<Integer>();
        System.out.println("PAGING: " + page);
        int _maxPageNumber = 5;
        for (int i = (page / _maxPageNumber) * _maxPageNumber + 1; i <= (page / _maxPageNumber) * _maxPageNumber + _maxPageNumber; i++) {
            pageLine.add(i);
            System.out.println("PAGING i: " + i);
        }
        model.addAttribute("pageLine", pageLine);

        ////
        ArrayList<Object> billStates = getBillState(request);
        model.addAttribute("billState", billStates);

    }

    private ArrayList<Object> getBillState(HttpServletRequest request) {
        ArrayList<Object> result = new ArrayList<>();
        String url = baseURL + "/bill/getBillState";

        String response = getRestAPI(url, request);

        result = JsonToArrayModel(response, new BillStateModel());

        return result;
    }

    @RequestMapping(value = {"/getAll.do"}, method = RequestMethod.GET)
    public String getAll(Model model, @RequestParam(value = "page", required = false) Integer page,
            HttpServletRequest request) {

        String url = baseURL + "/bill/getUserBills/" + (page - 1) + "/5";
        //Call API
        String response = getRestAPI(url, request);
        //Convert to jsonObject
        ArrayObjectModel result = (ArrayObjectModel) JsonToModel(response, new ArrayObjectModel());
        model.addAttribute("bills", result);

        repareData(page, model, request);
        model.addAttribute("endPoint", "getAll.do");
        return "UserBill";
    }

    @RequestMapping(value = {"/updateBills.do"}, method = RequestMethod.POST, consumes = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody
    String updateBills(Model model, @RequestBody UpdateUserBillModel listBills, HttpServletRequest request) {
        System.out.println("Call update bills");
        System.out.println(listBills.getId_bills().size());

        String url = baseURL + "/bill/updateBillState";

        JSONObject outputJsonObj = new JSONObject();
        outputJsonObj.put("id_bills", listBills.getId_bills());
        outputJsonObj.put("id_state", listBills.getId_state());
        String jsonstr = outputJsonObj.toString();
        System.out.println(jsonstr);

        String response = postRestAPI(url, jsonstr, request);
        System.out.println(response);

        return response;

    }

}
