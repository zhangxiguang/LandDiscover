package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Blog;

import java.util.List;

public interface BlogDAO {
    public int allBlog(String tag, String keywords);
    public List<Blog> listBlogPage(int page, int count, String tag, String keywords);
    public boolean addBlog(Blog b);
    public Blog getBlog(int blogid);
    public List<Blog> getLatestBlog(int count);
    public List<String> getBlogTag();
}
