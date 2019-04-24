$(document).ready(function () {
    var thisP = 1;
    var lastP;
    var count=6;

    $(function () {
        setPage(1)
    })


    function setPage(page) {
        $.ajax({
            url:"blogServlet?method=getBlogPage&page=" + page + "&count="+count,
            data:{"thispage":thisP},
            dataType:"JSON",
            success:function (data) {
                var s=""
                var choose = "";
                $.each(data,function (i,obj) {
                    if(obj.thispage!=null){
                        console.log(obj.thispage+"----"+i)
                        thisP = obj.thispage;
                        lastP=obj.allpage;
                        for(var i=1;i<=obj.allpage;i++){
                            if(obj.thispage==i){
                                choose+="<li class='active chooseonepage'><span class='number'>"+i+"</span></li>\n"
                            }else{
                                choose+="<li class='chooseonepage'><a class='number' href='javascript:void(0);'>"+i+"</a></li>\n"
                            }
                        }
                    }else{
                        $.each(obj,function (k,ob) {
                            s+="<div class='col-md-4 d-flex ftco-animate fadeInUp ftco-animated'>\n" +
                                "              <div class='blog-entry align-self-stretch'>\n" +
                                "                <a href='blogServlet?method=chooseBlog&blogid="+ob.blogId+"' class='block-20' style='background-image: url("+ob.blogimg+"); width: 250px;height: 250px;' >\n" +
                                "                </a>\n" +
                                "                <div class='text'>\n" +
                                "                  <span class='tag'>"+ob.blogtag+"</span>\n" +
                                "                  <h3 class='heading mt-3'><a href='blogServlet?method=chooseBlog&blogid="+ob.blogId+"'>"+ob.blogtitle+"</a></h3>\n" +
                                "                  <div class='meta mb-3'>\n" +
                                "                    <div><a href='blogServlet?method=chooseBlog&blogid="+ob.blogId+"'>"+ob.blogtime+"</a></div>\n" +
                                "                    <div><a href='blogServlet?method=chooseBlog&blogid="+ob.blogId+"'>"+ob.user.nickname+"</a></div>\n" +
                                "                    <div><a href='blogServlet?method=chooseBlog&blogid="+ob.blogId+"' class='meta-chat'><span class='icon-chat'></span>"+ob.commentnum +"</a></div>\n" +
                                "                  </div>\n" +
                                "                </div>\n" +
                                "              </div>\n" +
                                "            </div>";
                        })
                        $("#show").html(s)
                    }
                    console.log(choose)
                    $("#choosepage").html("<li><a id='frontpage' href='javascript:void(0);'>&lt;</a></li>\n" +
                        choose+
                        "<li><a id='nextpage' href='javascript:void(0);'>&gt;</a></li>")
                })
            }})
    }
    $("#blog").click(function () {
        thisP = 1
        setPage(1)
    })
    
    $("#choosepage").on('click',"#nextpage",function(){
        if(thisP<lastP) {
            thisP += 1;
            setPage(thisP);
        }
    });
    $("#choosepage").on('click',"#frontpage",function(){
        if(thisP>1) {
            thisP -= 1;
            setPage(thisP);
        }

    });
    $("#choosepage").on('click',".chooseonepage",function () {
        setPage($(this).children(".number").text())

    })
})

