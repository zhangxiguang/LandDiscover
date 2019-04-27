package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.DAO.CarDAO;
import edu.hbuas.LandDiscover.model.DAO.CarDAOImp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Car;
import edu.hbuas.LandDiscover.model.javaBean.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "carServlet",urlPatterns = "/carServlet")

public class carServlet extends HttpServlet {
    private CarDAO carDao;

    public void init() throws ServletException{
        carDao=new CarDAOImp();
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String method=request.getParameter("method");
        switch (method){
            case "listTopCar":{
                listTopCar(request,response);
                break;
            }
            case "search": {
                try {
                    search(request, response);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
            }
            case "getDetailOfCarByName":{
                getDetailOfCarByName(request,response);
                break;
            }
            case "order": {
                order(request, response);
                break;
            }


        }
    }


    private void order(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("id");
        Car placeInfo=carDao.getPlaceInfo(Integer.parseInt(id));
        System.out.println(placeInfo);

        Account user=(Account)request.getSession().getAttribute("user");
        int userId=user.getUserId();
        boolean rs=carDao.addcarorder(placeInfo,userId);
        System.out.println(rs);

        response.setContentType("text/json;charset=utf-8");
        PrintWriter out= null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        out.write(rs+"");
        out.flush();
        out.close();
    }

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        String carname=request.getParameter("carname");
        request.getSession().setAttribute("carname",carname);
        String page=request.getParameter("page");
        String count=request.getParameter("count");

        PageBean p=new PageBean();
        p.setAllCount(carDao.getSearchCount(carname));
        int allPages=p.getAllCount()%Integer.parseInt(count)==0?p.getAllCount()/Integer.parseInt(count):p.getAllCount()/Integer.parseInt(count)+1;
        p.setAllPages(allPages);
        p.setFirstPage(1);
        p.setNowPage(Integer.parseInt(page));
        p.setNextPage(p.getNowPage()==p.getAllPages()?p.getAllPages():p.getNowPage()+1);
        p.setPreviousPage(Integer.parseInt(page)>1?Integer.parseInt(page)-1:1);
        p.setEveryPageCount(Integer.parseInt(count));

        request.setAttribute("SearchPageBean",p);
        List<Car> pl = carDao.search(carname, Integer.parseInt(page), Integer.parseInt(count));

        request.getSession().setAttribute("carb",pl);
        request.getRequestDispatcher("car.jsp").forward(request,response);
    }

    protected void getDetailOfCarByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carName=request.getParameter("carName");
        try {
            Car b=carDao.getCarDetailByName(carName);

            request.getSession().setAttribute("carb",b);
            request.getRequestDispatcher("car-single.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    protected void listTopCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page=request.getParameter("page");
        String count=request.getParameter("count");

        System.out.println("进入listTopCar");

        //这里必须封装一个分页bean，将于分页有关的属性全部封装进去
        PageBean p=new PageBean();
        p.setAllCount(carDao.getAllCountofCar());
        int allPages=p.getAllCount()%Integer.parseInt(count)==0?p.getAllCount()/Integer.parseInt(count):p.getAllCount()/Integer.parseInt(count)+1;
        p.setAllPages(allPages);
        p.setFirstPage(1);
        p.setNowPage(Integer.parseInt(page));
        p.setNextPage(p.getNowPage()==p.getAllPages()?p.getAllPages():p.getNowPage()+1);
        p.setPreviousPage(Integer.parseInt(page)>1?Integer.parseInt(page)-1:1);

        p.setEveryPageCount(Integer.parseInt(count));

        request.getSession().setAttribute("pageBean",p);

        try{

            List<Car> allCar= carDao.listcarByPage(Integer.parseInt(page),Integer.parseInt(count));
            request.getSession().setAttribute("carb",allCar);
            request.getRequestDispatcher("car.jsp").forward(request,response);
        }catch(Exception e){
            e.printStackTrace();
        }



    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }





}
