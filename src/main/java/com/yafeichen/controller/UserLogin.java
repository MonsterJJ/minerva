package com.yafeichen.controller;

import com.yafeichen.model.LoginRequest;
import com.yafeichen.repository.jpa.entity.UserEntity;
import com.yafeichen.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by colin on 2017/2/10.
 */

@Slf4j
@Controller
public class UserLogin {
    private final String TAG = UserLogin.class.getSimpleName();

    @Resource
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(LoginRequest loginRequest, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        UserEntity userEntity = userService.login(loginRequest.getUserName(), loginRequest.getUserPassword());
        log.info(loginRequest.getUserName() + " ：");
        if (userEntity != null) {
            log.info("登陆成功...");
            modelAndView.setViewName("shopping_list");
        } else {
            log.info("登陆失败");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
