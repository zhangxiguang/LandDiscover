$(document).ready(function() {
    var thisP = 1;
    var count=3;
    var allcount=0;
    $(function () {
        getBlog(3)
        getBlogTag();
        setPage(1);
    })


    function getBlogTag(counts) {
        $.ajax({
            url:"blogServlet?method=getBlogTag",
            dataType:"JSON",
            success:function (data) {
                $.each(data,function (i,obj) {
                    $("#blogtag").append("<a id='tag' href='blogServlet?method=getBlogByTag&tag="+obj+"' class='tag-cloud-link'>"+obj+"</a>")
                })
            }
        })
    }

    
    function getBlog(counts) {
        $.ajax({
            url:"blogServlet?method=latestblog&count="+counts,
            dataType:"JSON",
            success:function (data) {
                $.each(data,function (i,obj) {
                    $("#lately").append("<div class='block-21 mb-4 d-flex'>\n" +
                        "                <a class='blog-img mr-4' style='background-image: url("+obj.blogimg+");'></a>\n" +
                        "                <div class='text'>\n" +
                        "                  <h3 class='heading'><a href='blogServlet?method=chooseBlog&blogid="+obj.blogId+"'>"+obj.blogtitle+"</a></h3>\n" +
                        "                  <div class='meta'>\n" +
                        "                    <div><a href='blogServlet?method=chooseBlog&blogid="+obj.blogId+"'><span class='icon-calendar'></span>"+obj.blogtime+"</a></div>\n" +
                        "                    <div><a href='blogServlet?method=chooseBlog&blogid="+obj.blogId+"'><span class='icon-person'></span>"+obj.user.nickname+"</a></div>\n" +
                        "                    <div><a href='blogServlet?method=chooseBlog&blogid="+obj.blogId+"'><span class='icon-chat'></span>"+obj.commentnum+"</a></div>\n" +
                        "                  </div>\n" +
                        "                </div>\n" +
                        "              </div>")
                })
            }
        })
    }

    function setPage(page) {
        $.ajax({
            url:"commentServlet?method=getAllComment&code=4&page=" + page + "&&count="+count,
            data:{"thispage":thisP},
            dataType:"JSON",
            success:function (data) {
                $.each(data,function (i,obj) {
                    if(obj.thispage!=null){
                            thisP = obj.thispage;
                            allcount = obj.allcount
                            $("#allcomment").html("<a>共"+obj.allcount+"条评论</a>")
                    }else{
                        $.each(obj,function (k,ob) {
                            $("#comment").append("<li  class='comment "+ob.cId+"'>\n" +
                                "                  <div class='vcard bio'>\n" +
                                "                    <img src='"+ob.user.headimage+"' alt='Image placeholder'>\n" +
                                "                  </div>\n" +
                                "                  <div class='comment-body'>\n" +
                                "                    <h3>"+ob.user.nickname+"</h3>\n" +
                                "                    <div class='meta'>发表时间："+ob.cTime+"</div>\n" +
                                "                    <p>发表内容："+ob.cText+"</p>\n" +
                                "                    <p><a href='javascript:void(0)' class='reply' name='"+ob.cId+"'>回复</a> <a class='delComment' style='visibility:hidden' name='"+ob.cId+"' href='javascript:void(0)'>删除</a></p>\n" +
                                "                  </div>\n" +
                                "                </li>")
                        })
                    }

                })


        }})

    }
    $("body").on("mouseover",".comment-body",function () {
        $(this).children("p").children(".delComment").css("visibility","visible")
    })
    $("body").on("mouseleave",".comment-body",function () {

        $(this).children("p").children(".delComment").css("visibility","hidden")
    })


        $("#moreComment").click(function(){
            setPage(thisP+1);

        });


    $("body").on("click",".delComment",function () {
        var cId =$(this).attr("name")

        $.get("commentServlet?method=delComment&cid="+cId,function(data){
            if(data=='false'){
                alert("您没有权限删除");
            }else {
                if(window.confirm("确认删除评论?")){
                    $("."+cId).remove()
                    allcount -=1;
                    $("#allcomment").html("<a>共"+allcount+"条评论</a>")
                }
            }
        });
    })

})