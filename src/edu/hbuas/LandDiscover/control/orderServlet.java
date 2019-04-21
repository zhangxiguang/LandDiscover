package edu.hbuas.LandDiscover.control;

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
            case "addScenery": {
                addScenery(request, response);
                break;
            }
            case "addHotel": {
                addHotel(request, response);
                break;
            }
            case "addCar": {
                addCar(request, response);
                break;
            }

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

    protected void addScenery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");

        //假设用户登录账户为：
        request.getSession().setAttribute("userId", "222");

        //1。获取传输过来的数据
        String name = request.getParameter("Scenery");
        System.out.println("要添加的对象为:" + name);

        //2。添加数据到数据库
        Order order = new Order();
        order.setScenery(name);

        HttpSession session = request.getSession();
        if (session != null) {
            //当前用户已登陆
            if (session.getAttribute("userId") != null) {
                String userId = (String) session.getAttribute("userId");
                System.out.println("用户id为：" + userId);

                Account account = new Account();
                account.setUserId(Long.parseLong(userId));

                Boolean result = orderDAO.addScenery(account, order);
                System.out.println(result);

                if (result) {

                    request.getSession().setAttribute("addScenerySuccess", "恭喜您，添加景点信息成功");
                    System.out.println("添加成功，跳转会car.jsp");
                    System.out.println(request.getSession().getAttribute("addScenerySuccess"));
                    response.sendRedirect(response.encodeURL("places.jsp"));

                } else {
                    request.getSession().setAttribute("addSceneryFail", "很遗憾，添加景点信息失败");
                    System.out.println("添加失败，跳转会car.jsp");
                    response.sendRedirect(response.encodeURL("places.jsp"));

                }

            } else {
                //用户没有登陆，返回提示
                request.getSession().setAttribute("addSceneryFail_noLogin", "添加失败，请登录后再试");
                System.out.println("用户未登录，跳转回car.jsp");
                response.sendRedirect(response.encodeURL("places.jsp"));
            }
        }

    }

    protected void addHotel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");

        //假设用户登录账户为：
        request.getSession().setAttribute("userId", "222");

        //1。获取传输过来的数据
        String name = request.getParameter("Scenery");
        System.out.println("要添加的对象为:" + name);

        //2。添加数据到数据库
        Order order = new Order();
        order.setHotel(name);

        HttpSession session = request.getSession();
        if (session != null) {
            //当前用户已登陆
            if (session.getAttribute("userId") != null) {
                String userId = (String) session.getAttribute("userId");
                System.out.println("用户id为：" + userId);

                Account account = new Account();
                account.setUserId(Long.parseLong(userId));

                Boolean result = orderDAO.addHotel(account, order);
                System.out.println(result);

                if (result) {

                    request.getSession().setAttribute("addScenerySuccess", "恭喜您，添加宾馆信息成功");
                    System.out.println("添加成功，跳转会car.jsp");
                    response.sendRedirect(response.encodeURL("hotel.jsp"));

                } else {
                    request.getSession().setAttribute("addSceneryFail", "很遗憾，添加宾馆信息失败");
                    System.out.println("添加失败，跳转会car.jsp");
                    response.sendRedirect(response.encodeURL("hotel.jsp"));

                }

            } else {
                //用户没有登陆，返回提示
                request.getSession().setAttribute("addSceneryFail_noLogin", "添加失败，请登录后再试");
                System.out.println("用户未登录，跳转回car.jsp");
                response.sendRedirect(response.encodeURL("hotel.jsp"));
            }
        }

    }

    protected void addCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");

        //假设用户登录账户为：
        request.getSession().setAttribute("userId", "222");

        //1。获取传输过来的数据
        String name = request.getParameter("Car");
        System.out.println("要添加的对象为:" + name);

        //2。添加数据到数据库
        Order order = new Order();
        order.setCar(name);

        HttpSession session = request.getSession();
        if (session != null) {
            //当前用户已登陆
            if (session.getAttribute("userId") != null) {
                String userId = (String) session.getAttribute("userId");
                System.out.println("用户id为：" + userId);

                Account account = new Account();
                account.setUserId(Long.parseLong(userId));

                Boolean result = orderDAO.addCar(account, order);
                System.out.println(result);

                if (result) {

                    request.getSession().setAttribute("addScenerySuccess", "恭喜您，添加汽车信息成功");
                    System.out.println("添加成功，跳转会car.jsp");
                    response.sendRedirect(response.encodeURL("car.jsp"));

                } else {
                    request.getSession().setAttribute("addSceneryFail", "很遗憾，添加汽车信息失败");
                    System.out.println("添加失败，跳转会car.jsp");
                    response.sendRedirect(response.encodeURL("car.jsp"));

                }

            } else {
                //用户没有登陆，返回提示
                request.getSession().setAttribute("addSceneryFail_noLogin", "添加失败，请登录后再试");
                System.out.println("用户未登录，跳转回car.jsp");
                response.sendRedirect(response.encodeURL("car.jsp"));
            }
        }

    }

    //所有订单信息
    public void allOrderInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");


        //假设用户登录账户为：
        request.getSession().setAttribute("userId", "222");


        // 获取当前用户id
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        System.out.println("用户id为：" + userId);

        //查询数据库
        Account account = new Account();
        account.setUserId(Long.parseLong(userId));

        Order order = new Order();
        order = orderDAO.allOrderInfo(account);
        if (order != null) {
            request.getSession().setAttribute("allOrderInfo",order);
            //计算所有消费
            //假设景点、宾馆、汽车消费
            request.getSession().setAttribute("sceneryPrice",400);
            request.getSession().setAttribute("hotelPrice",300);
            request.getSession().setAttribute("carPrice",200);

            int Money=0;
            Order order1=new Order();
            order1=(Order)request.getSession().getAttribute("allOrderInfo");
            int humna=(int)order1.getHumans();

            int sceneryPrice= (int)request.getSession().getAttribute("sceneryPrice");
            int hotelPrice= (int)request.getSession().getAttribute("hotelPrice");
            int carPrice= (int)request.getSession().getAttribute("carPrice");

            Money=sceneryPrice*humna+hotelPrice+carPrice;
            request.getSession().setAttribute("allMoney",Money);

            response.sendRedirect(response.encodeURL("orderWrite.jsp"));

        }else {
            //用户尚未添加信息
            request.getSession().setAttribute("orderNothing","当前尚未添加信息，快去逛逛吧～");
            response.sendRedirect(response.encodeURL("orderWrite.jsp"));
        }
    }

    //每个订单所属联系人
    public void orderOwner(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");


        String orderId=request.getParameter("orderID_ord");
        String username=request.getParameter("username_ord");
        String usertelephone=request.getParameter("usertelephone");

        System.out.println("添加联系人:"+orderId);
        System.out.println("添加联系人:"+username);
        System.out.println("添加联系人:"+usertelephone);

        Boolean result=orderDAO.addHuman(orderId,username,usertelephone);
        if (result){
            System.out.println("添加成功，跳转到所有订单页");

        }



    }


}
