/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.Controllers;

import java.io.IOException;
import java.security.AuthProvider;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

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
            baseURL = props.getProperty("server.host") +":"+ props.getProperty("server.port") + "/" +
                props.getProperty("server.baseURL");
            
        } catch (IOException ex) {
            Logger.getLogger(RootController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
