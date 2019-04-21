$(document).ready(function() {
    var thisP = 1;
    var count=3;
    $(function () {
        setPage(1);
    })

    function setPage(page) {
        $.ajax({
            url:"commentServlet?method=getAllComment&code=4&page=" + page + "&&count="+count,
            data:{"thispage":thisP},
            dataType:"JSON",
            success:function (data) {

                $.each(data,function (i,obj) {
                    if(obj.thispage!=null){
                            thisP = obj.thispage;
                    }else{
                        $.each(obj,function (k,ob) {
                            $("#comment").append("<li class='comment'>\n" +
                                "                  <div class='vcard bio'>\n" +
                                "                    <img src='"+ob.user.headimage+"' alt='Image placeholder'>\n" +
                                "                  </div>\n" +
                                "                  <div class='comment-body'>\n" +
                                "                    <h3>"+ob.user.nickname+"</h3>\n" +
                                "                    <div class='meta'>发表时间："+ob.cTime+"</div>\n" +
                                "                    <p>发表内容："+ob.cText+"</p>\n" +
                                "                    <p><a href='javascript:void(0)' class='reply'>回复</a></p>\n" +
                                "                  </div>\n" +
                                "                </li>")
                        })
                    }
                })


        }})

    }

        $("#moreComment").click(function(){
            setPage(thisP+1);

        });

})