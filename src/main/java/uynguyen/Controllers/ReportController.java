/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author LeeSan
 */
@Controller
@RequestMapping("/dashboard/report")
public class ReportController extends RootController {

    public ReportController() {
        super();
    }

    @RequestMapping(value = {"/customer.do"}, method = RequestMethod.GET)
    public String getCustomerReport(Model model, HttpServletRequest request,
            HttpServletResponse response) {
        String url = baseURL + "/report/customer/all";
        String responseString = getRestAPI(url, request);
        try {

            JSONObject data = new JSONObject(responseString);
            model.addAttribute("linkPdf", data.getString("linkPdf"));
            model.addAttribute("linkHtml", data.getString("linkHtml"));
            model.addAttribute("linkXls", data.getString("linkXls"));
        } catch (Exception ex) {

        }

        return "report.customer";
    }

    @RequestMapping(value = {"/income.do/{typeReport}"}, method = RequestMethod.GET)
    public String getIncomeReport(@PathVariable("typeReport") String type, Model model, HttpServletRequest request) {
        String url = baseURL + "/report/income/" + type;
        String response = getRestAPI(url, request);
        try {
            JSONObject data = new JSONObject(response);
            model.addAttribute("linkPdf", data.getString("linkPdf"));
            model.addAttribute("linkHtml", data.getString("linkHtml"));
            model.addAttribute("linkXls", data.getString("linkXls"));
        } catch (Exception ex) {

        }

        String[] pagetype = {"", "", "", ""};
        switch (type) {
            case "week":
                pagetype[0] = "active";
                break;
            case "month":
                pagetype[1] = "active";
                break;
            case "quarter":
                pagetype[2] = "active";
                break;
            case "year":
                pagetype[3] = "active";
                break;
            default:
                pagetype[0] = "active";
                break;
        }
        model.addAttribute("page_type", pagetype);
        return "report.income";
    }
}
