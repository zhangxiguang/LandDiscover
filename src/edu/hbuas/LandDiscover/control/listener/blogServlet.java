package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.DAO.BlogDAO;
import edu.hbuas.LandDiscover.model.DAO.BlogDAOImp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Blog;
import edu.hbuas.LandDiscover.model.javaBean.commentPage;
import net.sf.json.JSON;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
@MultipartConfig
@WebServlet(name = "blogServlet" , urlPatterns = "/blogServlet")
public class blogServlet extends HttpServlet {
    private BlogDAO blogDAO;
    public void init() throws ServletException {
        blogDAO = new BlogDAOImp();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        switch (method){
            case "addBlog":
                addBlog(request, response);
                break;
            case "getAllComment":
                getBlogPage(request, response);
                break;
            case "getBlogPage":
                getBlogPage(request, response);
                break;

            case "chooseBlog":
                chooseBlog(request, response);
                break;
            case"latestblog":
                getLatestBlog(request, response);
                break;
            case"getBlogTag":
                getBlogTag(request, response);
                break;
            case"getBlogByTag":
                getBlogByTag(request,response);
                break;
            case "getBlogByKeywords":
                getBlogByKeywords(request,response);
                break;
            case"getFirstPage":
                getFirstPage(request,response);
                break;
        }
    }

    protected  void getFirstPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("tag");
        request.getSession().removeAttribute("keywords");
        request.getRequestDispatcher("blog.jsp").forward(request,response);
    }
    protected void getBlogByKeywords(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String keywords = new String(request.getParameter("keywords").getBytes("iso-8859-1"),"utf-8");
        //String keywords = request.getParameter("keywords");
        request.getSession().removeAttribute("tag");
        request.getSession().setAttribute("keywords",keywords);
        request.getRequestDispatcher("blog.jsp").forward(request,response);
    }

    protected void  getBlogByTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tag = request.getParameter("tag");
        request.getSession().removeAttribute("keywords");
        request.getSession().setAttribute("tag",tag);
        request.getRequestDispatcher("blog.jsp").forward(request,response);

    }
    protected void  getBlogTag(HttpServletRequest request, HttpServletResponse response) throws IOException {
            List<String> allTag = blogDAO.getBlogTag();
            JSONArray data = JSONArray.fromObject(allTag);
            response.setCharacterEncoding("utf-8");
            PrintWriter  respWritter = response.getWriter();
            respWritter.append(data.toString());
    }
    protected  void getLatestBlog(HttpServletRequest request, HttpServletResponse response) throws IOException {
       int count = Integer.parseInt( request.getParameter("count"));
        List<Blog> c =  blogDAO.getLatestBlog(count);
        JSONArray data =  JSONArray.fromObject(c);
        response.setCharacterEncoding("utf-8");
        PrintWriter respWritter = response.getWriter();
        respWritter.append(data.toString());
    }

    protected void addBlog(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title =new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
        String tag =new String(request.getParameter("tag").getBytes("iso-8859-1"),"utf-8");
        String text =new String(request.getParameter("container").getBytes("iso-8859-1"),"utf-8");
        System.out.println(title);//文件类型
        Part part = request.getPart("bg");


        String uuidName = UUID.randomUUID().toString();
        StringBuffer childpath = new StringBuffer();
        for (int n = 0; n < uuidName.length(); n++) {
            childpath.append(uuidName.charAt(n) );
        }
        String rootpath = request.getRealPath("upload") + "/" + childpath;
        File path = new File(rootpath);
        path.mkdirs();
        String newFileName = uuidName + "." + part.getContentType().substring(part.getContentType().indexOf("/") + 1, part.getContentType().length());

        String fullPath = newFileName;
        FileOutputStream out = new FileOutputStream(rootpath + newFileName);

        InputStream in = part.getInputStream();
        byte[] bs = new byte[1024];
        int len = -1;
        while ((len = in.read(bs)) != -1) {

            out.write(bs, 0, len);
        }
        out.flush();
        out.close();
        in.close();
        System.out.println(rootpath+"\n"+fullPath);
        Account user = (Account)request.getSession().getAttribute("user");
        Blog b = new Blog();
        b.setBlogtag(tag);
        b.setBlogimg("upload/"+childpath+newFileName);
        b.setBlogtext(text);
        b.setBlogtitle(title);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式;
        b.setBlogtime(df.format(new Date()));
        b.setUser(user);
        boolean result = blogDAO.addBlog(b);
        if(result){
            request.getRequestDispatcher("blog.jsp").forward(request,response);
        }else {
            response.setCharacterEncoding("utf-8");
            request.setAttribute("errorMessage","发表失败");
//            request.getRequestDispatcher("write-blog.jsp").forward(request,response);
        }
        System.out.println(result);
    }

    protected void chooseBlog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Account user = (Account) request.getSession().getAttribute("user");
        String blogid = request.getParameter("blogid");
//        Account user =new Account();
//        user.setUserId(2);

        Blog b = blogDAO.getBlog(Integer.parseInt(blogid));

        request.getSession().setAttribute("blog",b);
//        request.getSession().setAttribute("user",user);
        request.getRequestDispatcher("blog-single.jsp").forward(request,response);
    }


    protected void getBlogPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String  tag = request.getSession().getAttribute("tag")+"";
        String  keywords = request.getSession().getAttribute("keywords")+"";


        String page =request.getParameter("page");
        String count=request.getParameter("count");
        String thispage = request.getParameter("thispage");

        commentPage p = new commentPage();
        p.setAllcount(blogDAO.allBlog(tag,keywords));
        p.setAllpage(p.getAllcount()%Integer.parseInt(count)==0?p.getAllcount()/Integer.parseInt(count):p.getAllcount()/Integer.parseInt(count)+1);
        p.setThispage(Integer.parseInt(page));
        p.setLaterpage(p.getThispage()==p.getAllpage()?p.getAllpage():p.getThispage()+1);
        p.setFrontpage(p.getThispage()==p.getFristpage()?p.getFristpage():p.getThispage()-1);
        p.setEverypagecount(Integer.parseInt(count));
        if(Integer.parseInt(thispage)<=p.getAllpage()){
            try{

                List<Blog> c =  blogDAO.listBlogPage(Integer.parseInt(page),Integer.parseInt(count),tag,keywords);
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
        doPost( request, response);
    }
}
