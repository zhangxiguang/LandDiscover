package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Blog;
import sun.security.krb5.internal.crypto.RsaMd5CksumType;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TransferQueue;

public class BlogDAOImp extends BaseDAOimp implements BlogDAO {
    public  List<String> getBlogTag(){
        List<String> allTag = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = getSta().executeQuery("select distinct blogtag from blog");
            while (rs.next()){
                allTag.add(rs.getString("blogtag"));
            }
        }catch (Exception e){

        }
        return allTag;
    }
    @Override
    public int allBlog(String tag,String keywords) {
        int result = 0;
        String SQL="";
        if(tag.equals("null")&&keywords.equals("null")){
            SQL = "select count(blogid) from blog";

        }else if(!tag.equals("null")&&keywords.equals("null")) {
            SQL = "select count(blogid) from blog where blog.blogtag='"+tag+"'";

        }else if(tag.equals("null")&&!keywords.equals("null")){
            SQL = "select count(blogid) from blog where blog.blogtitle like '%"+keywords+"%'";;
        }
        ResultSet rs = null;
        try {
            rs = getSta().executeQuery(SQL);
            rs.next();
            result = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
        }

        return  result;
    }

    public List<Blog> getLatestBlog(int count){
        List<Blog>  allBlog = new ArrayList<>();
        ResultSet rs = null;
        ResultSet re = null;
        int num;
        Blog b;
        try {
            rs = getSta().executeQuery("select * from blog   left join account on blog.userid = account.userid order by Blog.BlogId desc   limit  "+count);
            while (rs.next()){
                b = new Blog();
                Account user = new Account();
                user.setUserId(rs.getInt("userid"));
                user.setNickname(rs.getString("nickname"));
                num = rs.getInt("blogid");
                b.setBlogId(num);
                b.setBlogimg(rs.getString("blogimg"));
                b.setBlogtag(rs.getString("blogtag"));
                b.setBlogtext(rs.getString("blogtext"));
                b.setBlogtitle(rs.getString("blogtitle"));
                b.setBlogtime(rs.getString("blogtime"));
                re = getSta().executeQuery("select count(CId) from comment,blog where comment.blogid=blog.BlogId  and blog.BlogId="+num);
                re.next();
                b.setCommentnum(re.getInt(1));
                b.setUser(user);
                allBlog.add(b);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return allBlog;
    }

    @Override
    public List<Blog> listBlogPage(int page, int count,String tag,String keywords) {

        List<Blog>  allBlog = new ArrayList<>();
        ResultSet rs = null;
        ResultSet re = null;
        int num;
        Blog b;
        try {
            if(!tag.equals("null")){
                rs = getSta().executeQuery("select * from blog   left join account on blog.userid = account.userid where blog.blogtag='"+tag+"'  order by Blog.BlogId desc   limit  "+(page-1)*count+","+count);

            }else if(!keywords.equals("null")){
                rs = getSta().executeQuery("select * from blog   left join account on blog.userid = account.userid where blog.blogtitle LIKE '%"+keywords+"%'order by Blog.BlogId desc   limit  "+(page-1)*count+","+count);
            }else {
                rs = getSta().executeQuery("select * from blog   left join account on blog.userid = account.userid order by Blog.BlogId desc   limit  "+(page-1)*count+","+count);
            }
            while (rs.next()){
                 b = new Blog();
                Account user = new Account();
                user.setUserId(rs.getInt("userid"));
                user.setNickname(rs.getString("nickname"));
                num = rs.getInt("blogid");
                b.setBlogId(num);
                b.setBlogimg(rs.getString("blogimg"));
                b.setBlogtag(rs.getString("blogtag"));
                b.setBlogtext(rs.getString("blogtext"));
                b.setBlogtitle(rs.getString("blogtitle"));
                b.setBlogtime(rs.getString("blogtime"));
                re = getSta().executeQuery("select count(CId) from comment,blog where comment.blogid=blog.BlogId  and blog.BlogId="+num);
                re.next();
                b.setCommentnum(re.getInt(1));
                b.setUser(user);
                allBlog.add(b);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return  allBlog;

    }

    @Override
    public boolean addBlog(Blog b) {
        boolean result =false;
        try {
            PreparedStatement pre = getPre("insert into blog (blogtime,blogtext,userid,blogtitle,blogtag,blogimg) values (?,?,?,?,?,?)");
            pre.setString(1,b.getBlogtime());
            pre.setString(2,b.getBlogtext());
            pre.setInt(3,b.getUser().getUserId());
            pre.setString(4,b.getBlogtitle());
            pre.setString(5,b.getBlogtag());
            pre.setString(6,b.getBlogimg());
            result = pre.executeUpdate()>0?true:false;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Blog getBlog(int blogid) {
        Blog b = new Blog();
        Account user = new Account();
        ResultSet rs = null;

        try {
            rs = getSta().executeQuery("select * from blog,account where blog.userid=account.userId and blog.BlogId="+blogid);
            while (rs.next()){
                user.setUserId(rs.getInt("userid"));
                b.setBlogId(rs.getInt("blogid"));
                b.setBlogtitle(rs.getString("blogtitle"));
                b.setBlogtime(rs.getString("blogtime"));
                b.setBlogtext(rs.getString("blogtext"));
                b.setBlogimg(rs.getString("blogimg"));
                b.setBlogtag(rs.getString("blogtag"));
                b.setUser(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return b;
    }
}
