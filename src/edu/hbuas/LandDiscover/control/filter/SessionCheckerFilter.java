package edu.hbuas.LandDiscover.control.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Filter;
import java.util.logging.LogRecord;

public class SessionCheckerFilter implements javax.servlet.Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("这是过滤器的初始化方法，第一次过滤器被实例化 的时候执行一次");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("被过滤器拦截了，开始执行过滤代码");

        //1.将传入的servlet标注你的request和response转成http中的request和response

        HttpServletRequest request=(HttpServletRequest)servletRequest;

        HttpServletResponse response=(HttpServletResponse)servletResponse;


        Object  user=request.getSession().getAttribute("user");
        if(user==null){
            System.out.println("当前的请求需要拦截，判断到没有登陆信息，则跳转到登陆页面");
            response.sendRedirect("/login.jsp");
        }else{
            System.out.println("当前请求不需要拦截，放行");
            filterChain.doFilter(request,response);//放行
        }
    }

    @Override
    public void destroy() {
        System.out.println("这是过滤器的销毁方法，当过滤器被销毁 的时候执行一次");
    }


}
