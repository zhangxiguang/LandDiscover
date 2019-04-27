package edu.hbuas.LandDiscover.service;

import edu.hbuas.LandDiscover.model.DAO.AccountDAO;
import edu.hbuas.LandDiscover.model.DAO.AccountDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AccountServiceimp implements  AccountService {
    private AccountDAO  dao;
    public AccountServiceimp(){
        dao=new AccountDAOimp();
    }



    @Override
    public Account processNormalLogin(HttpServletRequest request, HttpServletResponse response) {
        //1.先获取上一个页面用户输入的账号信息
//        String inputCode= request.getParameter("inputCode");

//            if(inputCode.equalsIgnoreCase(request.getSession().getAttribute("code").toString())){
        String username= request.getParameter("username");
        String password= request.getParameter("password");
        System.out.println(username+"\t"+password);
        System.out.println(request.getContextPath());
        //2.查询数据库中有没有这个账户密码对应的用户信息

        Account u=dao.login(username,password);
        System.out.println("查询出来的用use"+u);
        //3.判断查询结果，如果查到该用户则跳转到首页，没有则跳到登陆页面，提示错误消息
        return u;
    }

    @Override
    public Account processCookieLogin(HttpServletRequest request, HttpServletResponse response) {
        String username=null;
        Cookie[]  cs=request.getCookies();
        for(Cookie c:cs){
            if(c.getName().equals("username")){
                username=c.getValue();
                break;
            }
        }
        Account  u=dao.login(username);
        return u;
    }

    @Override
    public void rememberUserToCookie(HttpServletRequest request, HttpServletResponse response) {
        if(request.getParameter("rememberMe")!=null){
            Cookie  c=new Cookie("username",request.getParameter("username"));
            c.setMaxAge(60*60*24*3);
            response.addCookie(c);
        }
    }
}
