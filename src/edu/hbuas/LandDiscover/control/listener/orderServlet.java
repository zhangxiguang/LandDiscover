package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.DAO.OrderDAO;
import edu.hbuas.LandDiscover.model.DAO.OrderDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "orderServlet", urlPatterns = "/orderServlet")
public class orderServlet extends HttpServlet {
    private OrderDAO orderDAO;


    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAOimp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        switch (method) {

            case "allOrderInfo": {
                allOrderInfo(request, response);
                break;
            }
            case "orderOwner": {
                orderOwner(request, response);
                break;
            }


        }
    }


    //所有订单信息
    public void allOrderInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");


        //假设用户登录账户为：
//        request.getSession().setAttribute("userId", "222");


        // 获取当前用户id
//        HttpSession session = request.getSession();
//        String userId = (String) session.getAttribute("userId");
        Account a=new Account();
        a=(Account)request.getSession().getAttribute("user");
        System.out.println("用户id为：" + a.getUserId());


        //查询数据库
        Account account = new Account();
        account.setUserId(a.getUserId());

        Order order = new Order();
        order = orderDAO.allOrderInfo(account);
        if (order != null) {
            request.getSession().setAttribute("allOrderInfo",order);
            response.sendRedirect(response.encodeURL("orderWrite.jsp"));

        }else {
            //用户尚未添加信息
            request.getSession().setAttribute("orderNothing","当前尚未添加信息，快去逛逛吧～");
            response.sendRedirect(response.encodeURL("orderWrite.jsp"));
        }
    }

    //每个订单所属联系人
    public void orderOwner(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进行添加联系人操作");

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");


        String orderId=request.getParameter("orderID_ord");
        String username=request.getParameter("username_ord");
        String usertelephone=request.getParameter("usertelephone");
        int number=Integer.valueOf(request.getParameter("number")).intValue();
        String moneys=request.getParameter("moneyS");
        float allmoney=Float.valueOf(moneys);


        System.out.println("添加联系人:"+orderId);
        System.out.println("添加联系人:"+username);
        System.out.println("添加联系人:"+usertelephone);
        System.out.println("money:"+allmoney);

        Boolean result=orderDAO.addHuman(orderId,username,usertelephone,number,allmoney);
        if (result){
            System.out.println("添加成功，跳转到所有订单页");

        }



    }


}
