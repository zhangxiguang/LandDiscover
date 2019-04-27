package edu.hbuas.LandDiscover.model.DAO;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Comment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOImp extends BaseDAOimp implements CommentDAO {

    @Override
    public boolean addComment(Comment c) {
        boolean result=false;
        String SQL="insert into comment (CTime,CText,blogid,userid) values (?,?,?,?)";
        try{
            PreparedStatement pre=getPre(SQL);
            pre.setString(1,c.getcTime());
            pre.setString(2 ,c.getcText());
            pre.setInt(3,c.getBlog().getBlogId());
            pre.setInt(4,c.getUser().getUserId());
            result=pre.executeUpdate()>0?true:false;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    public boolean delComment(int blogUserId,int userId,int cid){
        ResultSet rs = null;
        boolean result = false;
        int num=0;
        try {
            rs =getSta().executeQuery("select userId from comment where CId="+cid);
                if(rs.next()){
                    num = rs.getInt(1);
                }
            System.out.println(num);
            if(blogUserId==num||userId==num){
                PreparedStatement pre = getPre("delete from comment where cid=?");
                pre.setInt(1,cid);
                result = pre.executeUpdate()>0?true:false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int getAllComment(int blogId) {
        int result = 0;
        ResultSet rs = null;
        try {
            rs = getSta().executeQuery("select count(Cid)from Comment where blogid="+blogId);
            if(rs.next())
                result = rs.getInt(1);
            else
               result=0;
        }catch (Exception e){
            e.printStackTrace();
        }

        return  result;
    }

    @Override
    public List<Comment> getPageComment(int page, int count ,int blogid) {
        List<Comment> ct = new ArrayList<>();
        Comment c;
        try {
            ResultSet re=getSta().executeQuery("select *  from account   left join comment  on comment.userid = account.userId where blogid="+blogid+" order by  comment.CId  limit "+(page-1)*count+","+count);

            while(re.next()){
                c=new Comment();
                Account user = new Account();
                user.setUserId(re.getInt("userid"));
                user.setNickname(re.getString("nickname"));
                user.setImage(re.getString("image"));
                c.setcId(re.getInt("Cid"));
                c.setcTime(re.getString("Ctime"));
                c.setcText(re.getString("Ctext"));
                c.setUser(user);
                ct.add(c);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  ct;
    }
}
