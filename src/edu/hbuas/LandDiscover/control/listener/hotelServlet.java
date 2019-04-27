package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.DAO.HotelDAO;
import edu.hbuas.LandDiscover.model.DAO.HotelDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Hotel;
import edu.hbuas.LandDiscover.model.javaBean.PageBeanHotel;
import edu.hbuas.LandDiscover.model.javaBean.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "hotelServlet",urlPatterns = "/hotelServlet")

public class hotelServlet extends HttpServlet {
    private HotelDAO hotelDao;

    public void init() throws ServletException{
        hotelDao=new HotelDAOimp();
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String method=request.getParameter("method");
        switch (method){
            case "listTopHotel":{
                listTopHotel(request,response);
                break;
            }
           case "detail":{
               detail(request,response);
                break;
            }
           case "search":{
               search(request,response);
               break;
            }case "order": {
                order(request, response);
                break;
            }

        }
    }

    private void order(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("id");
        Hotel placeInfo=hotelDao.searchByHotelId(id);

        Account user=(Account)request.getSession().getAttribute("user");
        int userId=user.getUserId();
        boolean rs=hotelDao.addhotelorder(placeInfo,userId);
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

    protected void listTopHotel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page=request.getParameter("page");
        String count=request.getParameter("count");

        //这里必须封装一个分页bean，将于分页有关的属性全部封装进去
        PageBeanHotel p=new PageBeanHotel();
        p.setAllCount(hotelDao.getAllCountofHotel());
        int allPages=p.getAllCount()%Integer.parseInt(count)==0?p.getAllCount()/Integer.parseInt(count):p.getAllCount()/Integer.parseInt(count)+1;
        p.setAllPages(allPages);
        p.setFirstPage(1);
        p.setNowPage(Integer.parseInt(page));

        p.setOnePage(p.getNowPage());
        p.setTwoPage( p.getNowPage()==p.getAllPages()?0:p.getNowPage()+1);
        p.setThreePage(p.getNowPage()==p.getAllPages()||p.getTwoPage()==p.getAllPages()?0:p.getNowPage()+2);
        p.setFourPage(p.getNowPage()==p.getAllPages()||p.getTwoPage()==p.getAllPages()||p.getThreePage()==p.getAllPages()?0:p.getNowPage()+3);
        p.setFivePage(p.getNowPage()==p.getAllPages()||p.getTwoPage()==p.getAllPages()||p.getThreePage()==p.getAllPages()||p.getFourPage()==p.getAllPages()?0:p.getNowPage()+4);

        p.setNextPage(p.getNowPage()==p.getAllPages()?p.getAllPages():p.getNowPage()+1);
        p.setPreviousPage(Integer.parseInt(page)>1?Integer.parseInt(page)-1:1);

        p.setEveryPageCount(Integer.parseInt(count));

        request.setAttribute("pageBean",p);



            List<Hotel> allHotel= hotelDao.listhotelByPage(Integer.parseInt(page),Integer.parseInt(count));
            request.getSession().setAttribute("hotelb",allHotel);
            request.getRequestDispatcher("hotel.jsp").forward(request,response);

    }

    protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("这里开始了了酒店详情detail");
        //这里获取index界面中，点击超链接时，超链接传参的方法读取到当前所点击的具体商品id;
        //这里是将数据库按照id查询出来的结果封装为一个Hotel对象
        Hotel hotelInfo=hotelDao.searchByHotelId(request.getParameter("hotelid"));
        int price=Integer.parseInt(hotelInfo.getHotelprice());
        List<Hotel> hotelbyprice=hotelDao.relatedHotel(price);
        System.out.println(hotelbyprice);

        //将获取到的hotelInfo对象存到request,jsp界面通过“hotelInfo”获取
        request.setAttribute("hotelInfo",hotelInfo);
        request.setAttribute("hotelbyprice",hotelbyprice);
        //将存储在request的对象，转发到hotel-single详情页面，前台该jsp页面可以通过jstl获取该对象，以及其对象中的所有属性值

        System.out.println("详情调用结束detail"+hotelInfo);
        request.getRequestDispatcher("hotel-single.jsp").forward(request,response);
    }



    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hotelname=request.getParameter("hotelname");
        String hotelsite=request.getParameter("hotelsite");
        String hoteldatefrom=request.getParameter("hoteldatefrom");
        String hoteldateto=request.getParameter("hoteldateto");
        System.out.println("您输入的:"+hotelname+","+hotelsite+","+hoteldatefrom+","+hoteldateto);

        List<Hotel> hotel= hotelDao.searchByKeywords(hotelname,hotelsite,hoteldatefrom,hoteldateto);
        request.getSession().setAttribute("hotelb",hotel);
        request.getRequestDispatcher("hotel.jsp").forward(request,response);

         System.out.println("找到了一下酒店："+hotel.toString());

    }





    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
