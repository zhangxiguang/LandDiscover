package edu.hbuas.LandDiscover.control.listener;

import com.sun.org.apache.xpath.internal.operations.Or;
import edu.hbuas.LandDiscover.model.DAO.OrderconDAO;
import edu.hbuas.LandDiscover.model.DAO.OrderconDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Order;
import edu.hbuas.LandDiscover.model.javaBean.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@MultipartConfig
@WebServlet(name = "orderconServlet" ,urlPatterns = "/orderconServlet")
public class orderconServlet extends HttpServlet {

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
            case "detor":{
                detor(request,response);
                break;
            }
//            case "wcxlist":{
//                wcxlist(request,response);
//                break;
//           }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


    protected void listOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
//        System.out.println("test2019-04-27");
        Account user = new Account();
        user=(Account) request.getSession().getAttribute("user");
        user.setUserId(user.getUserId());

        String current = request.getParameter("currentPage");
        int currentPage;

//        System.out.println("test111111");
        if(current == null){
            currentPage = 1;
        }else{
            currentPage = Integer.parseInt(current);
        }
//        System.out.println("test1111112222222");
        List<Order> od = ordercondao.Ordercontent(user.getUserId());
        Page page = new Page(currentPage,3);
        page.setOrderList(od);
        List<Order> orderList = page.getPageByPageAndCount();
        request.setAttribute("order", orderList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("count",page.getCount());


        List<Order> ods = wcxOrder.WcxOrder(user.getUserId());

        page.setOrderList(ods);
//        request.setAttribute("wcxorder",ods);
        List<Order> orderLists = page.getPageByPageAndCount();
        System.out.println("1.page.getPageByPageAndCount()+"+page.getPageByPageAndCount());
        request.setAttribute("wcxorder", orderLists);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("count",page.getCount());



        List<Order> oda = cxOrder.CxOrder(user.getUserId());
        System.out.println(oda.size());
        if(oda.size() == 0 ){
            System.out.println("为空");
            String err = "当前无出行订单";
            request.getSession().setAttribute("error",err);

            request.getRequestDispatcher("admin/neworder.jsp").forward(request,response);
        }else {
            System.out.println("进入判断");
            System.out.println(oda);
            page.setOrderList(oda);
//        request.setAttribute("cxorder",oda);
            System.out.println("2.page.getPageByPageAndCount()+"+page.getPageByPageAndCount());
            List<Order> orderListc = page.getPageByPageAndCount();
            request.setAttribute("cxorder", orderListc);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("count",page.getCount());

            request.getRequestDispatcher("neworder.jsp").forward(request,response);
        }






    }

//    protected void cxlist(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{
//        List<Order> od = cxOrder.CxOrder();
//        request.setAttribute("cxorder",od);
//        System.out.println(od);
//        request.getRequestDispatcher("订单确认.jsp").forward(request,response);
//    }

//    protected void wcxlist(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
//////        List<Order> od = wcxOrder.WcxOrder();
////        request.setAttribute("wcxorder",od);
////        System.out.println(od);
////        request.getRequestDispatcher("订单确认.jsp").forward(request,response);
//    }

    protected void  detor(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        String ddh = request.getParameter("oid");
        boolean reslut = deorder.deletorder(ddh);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();

        out.write(reslut+"");
        out.flush();
        out.close();
    }





}
