package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.DAO.CommentDAO;
import edu.hbuas.LandDiscover.model.DAO.CommentDAOImp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Blog;
import edu.hbuas.LandDiscover.model.javaBean.Comment;
import edu.hbuas.LandDiscover.model.javaBean.commentPage;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "commentServlet", urlPatterns = "/commentServlet")
public class commentServlet extends HttpServlet {
    private CommentDAO commentDAO;


    @Override
    public void init() throws ServletException {
        commentDAO = new CommentDAOImp();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        switch (method){
            case "addComment":
                addComment(request, response);
                break;
            case "getAllComment":
                getPageComment(request, response);
                 break;
            case "delComment":
                delComment(request, response);
                break;
        }
    }

    protected void delComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int blogUserId = ((Blog)request.getSession().getAttribute("blog")).getUser().getUserId();
        int userId = ((Account)request.getSession().getAttribute("user")).getUserId();
        int cid = Integer.parseInt(request.getParameter("cid"));
        boolean result = false;
             result = commentDAO.delComment(blogUserId,userId,cid);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter  out=response.getWriter();
            out.write(result+"");
            out.flush();
            out.close();

    }


    protected void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String text = new String(request.getParameter("text").getBytes("iso-8859-1"),"utf-8");
        System.out.println(text);
        Blog b = (Blog)request.getSession().getAttribute("blog");
        Account acc =(Account) request.getSession().getAttribute("user");
        Comment c = new Comment();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        c.setcTime(df.format(new Date()));
        c.setBlog(b);
        c.setcText(text);
        c.setUser(acc);
        boolean result = commentDAO.addComment(c);
        request.getRequestDispatcher("blog-single.jsp").forward(request, response);
    }
    protected void getPageComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page =request.getParameter("page");
        String count=request.getParameter("count");
        String thispage = request.getParameter("thispage");
        Blog b = (Blog)request.getSession().getAttribute("blog") ;
        //Account acc =(Account) request.getSession().getAttribute("user");
        Account acc = new Account();
        acc.setUserId(1);
        acc.setNickname("123");
        acc.setImage("images/+.png");

        commentPage p = new commentPage();
        p.setAllcount(commentDAO.getAllComment(b.getBlogId()));
        p.setAllpage(p.getAllcount()%Integer.parseInt(count)==0?p.getAllcount()/Integer.parseInt(count):p.getAllcount()/Integer.parseInt(count)+1);
        p.setThispage(Integer.parseInt(page));
        p.setLaterpage(p.getThispage()==p.getAllpage()?p.getAllpage():p.getThispage()+1);
        p.setFrontpage(p.getThispage()==p.getFristpage()?p.getFristpage():p.getThispage()-1);
        p.setEverypagecount(Integer.parseInt(count));
        if(Integer.parseInt(thispage)<=p.getAllpage()){
            try{
                List<Comment> c =  commentDAO.getPageComment(Integer.parseInt(page),Integer.parseInt(count),b.getBlogId());
                List all = new ArrayList();
                all.add(c);
                all.add(p);
                JSONArray data =  JSONArray.fromObject(all);
                response.setCharacterEncoding("utf-8");
                PrintWriter respWritter = response.getWriter();
                respWritter.append(data.toString());
            }catch (Exception e){
                e.printStackTrace();
            }
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
