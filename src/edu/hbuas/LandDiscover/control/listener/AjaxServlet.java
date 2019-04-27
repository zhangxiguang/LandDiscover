package edu.hbuas.LandDiscover.control.listener;

import com.sun.org.apache.xpath.internal.operations.Or;
import edu.hbuas.LandDiscover.model.DAO.OrderconDAO;
import edu.hbuas.LandDiscover.model.DAO.OrderconDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Order;
import edu.hbuas.LandDiscover.model.javaBean.Page;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AjaxServlet" ,urlPatterns = "/AjaxServlet")
public class AjaxServlet extends HttpServlet {
    private OrderconDAO ordercondao;
    private OrderconDAO cxOrder;
    private OrderconDAO wcxOrder;
    private OrderconDAO deorder;

    @Override
    public void init() throws ServletException {

        ordercondao = new OrderconDAOimp();
        cxOrder = new OrderconDAOimp();
        wcxOrder = new OrderconDAOimp();
        deorder = new OrderconDAOimp();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method =request.getParameter("method");
        switch (method){
            case "listOrder":{
                listOrder(request,response);
                break;
            }
//            case "detor":{
//                detor(request,response);
//                break;
//            }
//            case "wcxlist":{
//                wcxlist(request,response);
//                break;
//            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void listOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
        Account user = new Account();
        user.setUserId(1);
        String current = request.getParameter("currentPage");
        int currentPage;

        if (current == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(current);
        }
        List<Order> od = ordercondao.Ordercontent(user.getUserId());
        Page page = new Page(currentPage, 3);
        page.setOrderList(od);
        List<Order> orderList = page.getPageByPageAndCount();
//        request.setAttribute("order", orderList);
//        request.setAttribute("count", page.getCount());
//        for(Order order : orderList){
//            System.out.println(order);
//        }
        List<Order> ods = wcxOrder.WcxOrder(user.getUserId());

        page.setOrderList(ods);
//        request.setAttribute("wcxorder",ods);
        List<Order> orderLists = page.getPageByPageAndCount();
        request.setAttribute("wcxorder", orderLists);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("count",page.getCount());

        List<Order> oda = cxOrder.CxOrder(user.getUserId());
        page.setOrderList(oda);
//        request.setAttribute("cxorder",oda);
        List<Order> orderListc = page.getPageByPageAndCount();
        request.setAttribute("cxorder", orderListc);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("count",page.getCount());

        List<Object> alls = new ArrayList<>();
        alls.add(orderList);
        alls.add(orderLists);
        alls.add(orderListc);


        JSONArray data =  JSONArray.fromObject(alls);

        System.out.println(data.toString());
        response.setCharacterEncoding("utf-8");
        PrintWriter respWritter = response.getWriter();
        respWritter.append(data.toString());

    }
}
