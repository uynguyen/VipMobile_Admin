/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import java.io.IOException;
import java.security.AuthProvider;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author LeeSan
 */
public abstract class RootController {

    protected Properties props = new Properties();
    protected String baseURL;

    public RootController() {

        Resource resource = new ClassPathResource("/META-INF/server.properties");
        try {
            this.props = PropertiesLoaderUtils.loadProperties(resource);
            baseURL = props.getProperty("server.host") + ":" + props.getProperty("server.port") + "/"
                    + props.getProperty("server.baseURL");

        } catch (IOException ex) {
            Logger.getLogger(RootController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected ArrayList<Object> JsonToArrayModel(String array, Object template) {

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

    //Convert json string to jsonobject

    protected Object JsonToModel(String jsonInString, Object clazz) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            Object result = mapper.readValue(jsonInString, clazz.getClass());
            return result;
        } catch (IOException ex) {
            Logger.getLogger(RootController.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    protected String postRestAPI(String url, String postedObject) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> entity = new HttpEntity<String>(postedObject, headers);

        String response = restTemplate.postForObject(url, entity, String.class);
        return response;
    }

    protected String getRestAPI(String url) {
        RestTemplate restTemplate = new RestTemplate();

        String response = restTemplate.getForObject(url, String.class);
        return response;
        
    }
}
