/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uynguyen.interceptor;

import java.util.Enumeration;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import uynguyen.model.AccessTokenModel;

/**
 *
 * @author LeeSan
 */
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    //TODO : Check exprise date
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler)
            throws Exception {

        System.out.println("preHandle");

        AccessTokenModel object = (AccessTokenModel) request.getSession().getAttribute("User");
        if (object == null) {
            System.out.println("REQUIRE");
            response.sendRedirect(request.getContextPath() + "/user/requireToken.do");
            return false;

        }
        System.out.println("TOKEN" + object.getToken());
        request.setAttribute("token", object.getToken());
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView)
            throws Exception {
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
            Object handler, Exception ex)
            throws Exception {
        System.out.println("afterCompletion");
    }

}
