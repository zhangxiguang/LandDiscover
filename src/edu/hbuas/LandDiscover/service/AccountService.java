package edu.hbuas.LandDiscover.service;

import edu.hbuas.LandDiscover.model.javaBean.Account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AccountService {
    public Account processNormalLogin(HttpServletRequest request, HttpServletResponse response);
    public Account processCookieLogin(HttpServletRequest request, HttpServletResponse response);
    public void rememberUserToCookie(HttpServletRequest request, HttpServletResponse response);
}
