/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import uynguyen.model.SaleProduct;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping("/dashboard/product")
public class ProductController extends RootController {

    @RequestMapping(value = {"/getSaleProducts.do"}, method = RequestMethod.GET)
    public String list(Model model) {

        final String url = baseURL + "/product/getSaleProduct/0/5";

        RestTemplate restTemplate = new RestTemplate();

        String response = restTemplate.getForObject(url, String.class);

        model.addAttribute("serverDomain", baseURL);
        model.addAttribute("saleProducts", JsonToArrayModel(response, new SaleProduct()));
        return "SaleProducts";
    }

    @RequestMapping(value = {"/addSaleProduct.do"}, method = RequestMethod.GET)
    public String getAddSaleProduct(Model model) {

//        final String url = baseURL + "/product/getSaleProduct/0/5";
//
//        RestTemplate restTemplate = new RestTemplate();
//
//        String response = restTemplate.getForObject(url, String.class);
//
//        model.addAttribute("serverDomain", baseURL);
//        model.addAttribute("saleProducts", JsonToArrayModel(response, new SaleProduct()));
        return "AddSaleProduct";
    }
}
