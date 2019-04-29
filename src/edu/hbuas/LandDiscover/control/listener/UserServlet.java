package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.DAO.AccountDAO;
import edu.hbuas.LandDiscover.model.DAO.AccountDAOimp;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.service.AccountServiceimp;
import edu.hbuas.LandDiscover.service.AccountService;
//import edu.hbuas.LandDiscover.util.MD5;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.UUID;
import javax.servlet.ServletException;

/**
 * 自定义的servlet我们把doget和dopost请求合二为一，然后自己通过请求的方法参数来对不同的业务请求分流到不同的自定义方法中
 */
@MultipartConfig
@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet implements Serializable{

    private AccountDAO userDAO;
    private AccountService service;

    @Override
    public void init() throws ServletException {
        userDAO = new AccountDAOimp();
        service = new AccountServiceimp();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //为了让一个servlet能应对前端的多个业务方法请求，我们不得不对serlvet做方法复用.
        //前端我们通过每次请求过来的时候传入一个名字为method参数，通过判断参数的值来知道用户点击了哪个请求，然后调用对应的自定义的方法

        String method = request.getParameter("method");
        switch (method) {
            case "login": {
                login(request, response);
                break;
            }
            case "logoff": {
                logoff(request, response);
                break;
            }
            case "checkUser": {
                checkUser(request, response);
                break;
            }
            case "checkCode": {
                checkCode(request, response);
                break;
            }
            case "register": {
                register(request, response);
                break;
            }
            case "changeInformation": {
                changeInformation(request, response);
                break;
            }
            case "changePassword": {
                changePassword(request, response);
                break;
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void checkCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String yourinput = request.getParameter("code");

        String systemCode = request.getSession().getAttribute("code").toString();

        System.out.println(yourinput + "---" + systemCode);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        out.write(yourinput.equalsIgnoreCase(systemCode) + "");

        out.flush();
        out.close();

    }

    protected void checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("请求到后台了");
        String username = request.getParameter("username");
        System.out.println("传过来到用户名" + username);
        boolean result = userDAO.checkUser(username);
        System.out.println(result);


        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        out.write(result + "");
        out.flush();
        out.close();

    }

    /**
     * 这是用户注册的方法
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */

    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part part = request.getPart("image");
//        System.out.println(part);
        System.out.println(part.getContentType());//文件类型

        String uuidName = UUID.randomUUID().toString();
        StringBuffer childpath = new StringBuffer();
        for (int n = 0; n < uuidName.length(); n++) {
            childpath.append(uuidName.charAt(n));
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


        String username = request.getParameter("userName");
        String password = request.getParameter("pwd");
        String nickname =request.getParameter("nickName");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        System.out.println(image);
        System.out.println(part);
        System.out.println(phone);
        // System.out.println(username + "\t" + password + "\t" + nickname + "\t" + phone + "\t" +  sex+ "\t" + address + "\t" + image);
        //2.链接数据库，将用户填写的资料插入到用户信息表，生成一条新的用户u 记录信息

        Account u = new Account();
        u.setUsername(username);
        u.setPassword(password);
        u.setNickname(nickname);
        u.setPhone(phone);
        u.setAddress(address);
        u.setSex(String.valueOf(sex));
        u.setImage("upload/" + childpath + newFileName);


        try {
            boolean result = userDAO.checkUser(username);
            if (result) {
                if(userDAO.register(u)){
                    response.sendRedirect(response.encodeURL("login.jsp"));
                }

            } else {
                response.sendRedirect(response.encodeURL("register.jsp"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }

    /**
     * 自定义的处理退出登陆的方法
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void logoff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();//销毁session中所有的数据
        System.out.println("退出登陆的方法");
        response.sendRedirect("index.jsp");

    }

    /**
     * 自定义的处理登陆业务的方法
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //当前这个login方法对应的前端请求分两种
        //一种是用户正常登陆，需要填写用户名和密码以及验证码
        String username = request.getParameter("username");

        String password = request.getParameter("password");
        String inputCode = request.getParameter("inputCode");
        if (username != null && password != null && inputCode != null) {

//            Account u = service.processNormalLogin(request, response);
            Account u = userDAO.login(username,password);
            if (u != null) {
//                service.rememberUserToCookie(request, response);

                request.getSession().setAttribute("user", u);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            //第二种自动登陆（三天免登陆），此时用户没有填写任何用户名和密码以及验证码
            Account u = service.processCookieLogin(request, response);
            request.getSession().setAttribute("user", u);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }




    }

    /**
     * 修改个人信息
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void changeInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("nickName");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String address =request.getParameter("address");
        String image = request.getParameter("image");
        Account user = (Account) request.getSession().getAttribute("user");

        //上传头像
        Part part = request.getPart("image");
//        System.out.println(part);
        System.out.println(part.getContentType());//文件类型

        String uuidName = UUID.randomUUID().toString();
        StringBuffer childpath = new StringBuffer();
        for (int n = 0; n < uuidName.length(); n++) {
            childpath.append(uuidName.charAt(n));
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


        user.setNickname(nickname);
        user.setPhone(phone);
        user.setSex(sex);
        user.setAddress(address);
        user.setImage("upload/" + childpath + newFileName);

        boolean result = userDAO.changeInformation(user);
        if (result) {
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

    /**
     * 修改密码
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldpwd = request.getParameter("oldpwd");
        String password1 = request.getParameter("password1");
        Account user = (Account) request.getSession().getAttribute("user");
        user.setPassword(password1);
        boolean result = false;

        result = userDAO.changePassword(user, oldpwd);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(result + "");
        out.flush();
        out.close();
    }
}









