$(document).ready(function () {
    var thisP = 1;
    var lastP;
    var count=6;

    $(function () {
        setPage(1)
    })
    $("#readBlog").click(function () {
        $("#writeBlog").html("<b  href='javascript:void(0)'>写文章</b>")
        $("#readBlog").html("<a  href='javascript:void(0)'>读文章</a>")
        setPage(thisP);
    })
    
    $("#writeBlog").click(function () {
        $("#writeBlog").html("<a  href='javascript:void(0)'>写文章</a>")
        $("#readBlog").html("<b  href='javascript:void(0)'>读文章</b>")
        $("#show").html("<form action='blogServlet?method=addBlog'  method='post' enctype='multipart/form-data'  class='p-5 bg-light' style='position: relative; left: 400px;'>\n" +
            "                            <h3 class='mb-5'>发表文章</h3>\n" +
            "                            <div class='form-group'>\n" +
            "                                <img id='showImg' src=''><br>\n" +
            "                                <label for='fileinp'>\n" +
            "                                    <input type='button' id='btn' value='上传首页图'><span id='text'></span>\n" +
            "                                    <input type='file'  name='bg' value='' id='fileinp'style='display: inline' >\n" +
            "                                </label>\n" +
            "                                <br>\n" +
            "                                <label for='name'>标题</label>\n" +
            "                                <input type='text' class='form-control' id='name' name='title'>\n" +
            "                            </div>\n" +
            "                            <div class='form-group'>\n" +
            "                                <label for='name'>类型</label>\n" +
            "                                <input type='text' class='form-control' id='tag' name='tag'>\n" +
            "                            </div>\n" +
            "                            <div class='form-group'>\n" +
            "                                <label for='message'>正文</label>\n" +
            "                                <textarea name='text' id='message' cols='30' rows='10' class='form-control'></textarea>\n" +
            "                            </div>\n" +
            "                            <div class='form-group'>\n" +
            "                                <input type='submit' value='提交' class='btn py-3 px-4 btn-primary'>\n" +
            "                            </div>\n" +
            "                        </form>")
        $("#choosepage").html("");
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

    $("body").on('change',"#fileinp",function () {
        var $file = $(this)
        var objUrl = $file[0].files[0];
        var windowURL = window.URL||window.webkitURL
        var dataURL
        dataURL = windowURL.createObjectURL(objUrl)
        $("#showImg").attr("src",dataURL)
        $("#showImg").css({"width":100,"height":100})
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

