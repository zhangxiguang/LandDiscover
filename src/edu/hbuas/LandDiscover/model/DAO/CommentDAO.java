package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Comment;

import java.util.List;

public interface CommentDAO {
    public boolean addComment(Comment c);
    public List<Comment> getPageComment(int page, int count, int blogid);
    public int getAllComment(int blogId);
    public boolean delComment(int blogUserId, int userId, int cid);
}
