package edu.hbuas.LandDiscover.control;


import edu.hbuas.LandDiscover.model.DAO.PlaceDAO;
import edu.hbuas.LandDiscover.model.DAO.PlaceDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.PageBean;
import edu.hbuas.LandDiscover.model.javaBean.Place;

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

@WebServlet(name = "placeServlet", urlPatterns = "/placeServlet")
public class placeServlet extends HttpServlet {

    private PlaceDAO placeDAO;
    @Override
    public void init() throws ServletException {
        placeDAO = new PlaceDAOimp();
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
            case "getPlacelist": {
                getPlacelist(request, response);
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
            case "SearchPaging": {
                SearchPaging(request, response);
                break;
            }
            case "Placeinfo": {
                Placeinfo(request, response);
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
        Place placeInfo=placeDAO.getPlaceInfo(Integer.parseInt(id));

        //Account user=(Account)request.getSession().getAttribute("user");
        //int userId=user.getUserId();
        boolean rs=placeDAO.addplaceorder(placeInfo,1);
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

    private void Placeinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        Place placeInfo=placeDAO.getPlaceInfo(Integer.parseInt(id));
        request.setAttribute("placeInfo",placeInfo);
        request.getRequestDispatcher("place-single.jsp").forward(request,response);
    }


    protected void getPlacelist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page=request.getParameter("page");
        String count=request.getParameter("count");
        String orderBy=request.getParameter("orderBy");
        System.out.println(orderBy);


        PageBean p=new PageBean();
        p.setAllCount(placeDAO.getPlaceCount());
        int allPages=p.getAllCount()%Integer.parseInt(count)==0?p.getAllCount()/Integer.parseInt(count):p.getAllCount()/Integer.parseInt(count)+1;
        p.setAllPages(allPages);
        p.setFirstPage(1);
        p.setNowPage(Integer.parseInt(page));
        p.setNextPage(p.getNowPage()==p.getAllPages()?p.getAllPages():p.getNowPage()+1);
        p.setPreviousPage(Integer.parseInt(page)>1?Integer.parseInt(page)-1:1);

        p.setEveryPageCount(Integer.parseInt(count));

        request.setAttribute("pageBean",p);


        List<Place> pl=placeDAO.getPlacelist(Integer.parseInt(page),Integer.parseInt(count));
        if (orderBy!=null){
            placeSort placeSort=new placeSort();
            if(orderBy.equals("price")){
                pl=placeSort.SortByPrice(pl);
                System.out.println(pl);
            }
            if(orderBy.equals("grade")){
                pl=placeSort.SortByGrade(pl);
                System.out.println(pl);
            }
        }

        request.setAttribute("Places",pl);
        request.getRequestDispatcher("places.jsp").forward(request,response);
    }

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        String from=request.getParameter("from");
        String to=request.getParameter("to");
        DateFormat s = new SimpleDateFormat("MM/dd/yyyy");
        String start=request.getParameter("start_time");
        String end=request.getParameter("end_time");
        String time=request.getParameter("time");
        Date start_time=null;
        Date end_time=null;
        if(!start.equals("")){
            start_time=s.parse(start);
        }
        if(!end.equals("")){
            end_time = s.parse(end);
        }

        request.getSession().setAttribute("start_time",start_time);
        request.getSession().setAttribute("end_time",end_time);
        request.getSession().setAttribute("time",time);
        request.getSession().setAttribute("from",from);
        request.getSession().setAttribute("to",to);

        String page=request.getParameter("page");
        String count=request.getParameter("count");
        String orderBy=request.getParameter("orderBy");

        PageBean p=new PageBean();
        p.setAllCount(placeDAO.getSearchCount(from, to, start_time, end_time, time));
        int allPages=p.getAllCount()%Integer.parseInt(count)==0?p.getAllCount()/Integer.parseInt(count):p.getAllCount()/Integer.parseInt(count)+1;
        p.setAllPages(allPages);
        p.setFirstPage(1);
        p.setNowPage(Integer.parseInt(page));
        p.setNextPage(p.getNowPage()==p.getAllPages()?p.getAllPages():p.getNowPage()+1);
        p.setPreviousPage(Integer.parseInt(page)>1?Integer.parseInt(page)-1:1);
        p.setEveryPageCount(Integer.parseInt(count));

        request.setAttribute("SearchPageBean",p);
        List<Place> pl = placeDAO.search(from, to, start_time, end_time, time, Integer.parseInt(page), Integer.parseInt(count));
        if (orderBy!=null){
            placeSort placeSort=new placeSort();
            if(orderBy.equals("price")){
                pl=placeSort.SortByPrice(pl);
                System.out.println(pl);
            }
            if(orderBy.equals("grade")){
                pl=placeSort.SortByGrade(pl);
                System.out.println(pl);
            }
        }
        request.setAttribute("SearchPlaces",pl);
        request.getRequestDispatcher("places.jsp").forward(request,response);
    }

    protected void SearchPaging(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Date start_time = (Date) request.getSession().getAttribute("start_time");
        System.out.println(start_time);
        Date end_time = (Date) request.getSession().getAttribute("end_time");
        String time= (String) request.getSession().getAttribute("time");
        String from= (String) request.getSession().getAttribute("from");
        String to= (String) request.getSession().getAttribute("to");

        String page=request.getParameter("page");
        System.out.println(page);
        String count=request.getParameter("count");
        String orderBy=request.getParameter("orderBy");

        PageBean p=new PageBean();
        p.setAllCount(placeDAO.getSearchCount(from, to, start_time, end_time, time));
        int allPages=p.getAllCount()%Integer.parseInt(count)==0?p.getAllCount()/Integer.parseInt(count):p.getAllCount()/Integer.parseInt(count)+1;
        p.setAllPages(allPages);
        p.setFirstPage(1);
        p.setNowPage(Integer.parseInt(page));
        p.setNextPage(p.getNowPage()==p.getAllPages()?p.getAllPages():p.getNowPage()+1);
        p.setPreviousPage(Integer.parseInt(page)>1?Integer.parseInt(page)-1:1);
        p.setEveryPageCount(Integer.parseInt(count));

        request.setAttribute("SearchPageBean",p);

        List<Place> pl = placeDAO.search(from, to, start_time, end_time, time, Integer.parseInt(page), Integer.parseInt(count));
        if (orderBy!=null){
            placeSort placeSort=new placeSort();
            if(orderBy.equals("price")){
                pl=placeSort.SortByPrice(pl);
                System.out.println(pl);
            }
            if(orderBy.equals("grade")){
                pl=placeSort.SortByGrade(pl);
                System.out.println(pl);
            }
        }
        request.setAttribute("SearchPlaces",pl);
        request.getRequestDispatcher("places.jsp").forward(request,response);
    }


}