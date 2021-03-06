<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <style>

        .notice-form-wrapper
        {
            width: 100%;
            font-family: 'Noto Sans KR';
            font-size: 14px;
        }

        .notice-form input
        {
            font-family: 'Noto Sans KR';
            padding: 5px;
            height: 30px;
            box-sizing: border-box;
            border: 1px solid #ccc;
        }

        .notice-form input:focus
        {
            outline: none;
        }

        .notice-form-header
        {
            font-size: 21px;
            margin: 25px 0;
        }

        .notice-form
        {
            display: flex;
            flex-flow: column nowrap;
            border-top: 2px solid rgb(42, 71, 114);
        }

        .notice-form > div
        {
            display: flex;
        }

        .notice-form > div > div:first-of-type
        {
            background-color: rgb(245, 245, 245);
        }

        .notice-form > div > div:first-of-type{flex: 1 1 0; justify-content: center;}
        .notice-form > div > div:nth-of-type(2){flex: 7 1 0; display: flex;}

        .notice-form > div > div 
        {
            display: flex;
            padding: 15px 0 15px 10px;
            align-items: center;
            border-bottom: 1px solid #ccc;
        }

        .notice-form-order-seq input[type="button"]
        {
            width: 100px;
            height: 30px;
            margin-left: 10px;
            color: white;
            border: none;
            border-radius: 2px;
            font-size: 12px;
            background-color: rgb(42, 71, 114);
            cursor: pointer;
        }

        .notice-form-order-seq input[type="button"]:hover
        {
            background-color: rgb(62, 91, 134);
        }

        .notice-form-title input{width: 100%;}

        .notice-form-email input{background-color: #eee;}

        .notice-form-email label{margin: 0 10px;}

        .notice-form-content textarea
        {
            height: 300px;
            width: 100%;
            resize: none;
            border: 1px solid #ccc;
            font-family: 'Noto Sans KR';
            padding: 5px;
        }

        .notice-form-content textarea:focus
        {
            outline: none;
        }


        .added-image-box
        {
            width: 82px;
            height: 82px;
            margin-right: 10px;
        }

        .added-image-box > img
        {
            width: 100%;
            height: 100%;
        }

        .image-upload-container
        {
            width: 80px;
            height: 80px;
            border: 1px dotted gray;
            position: relative;
        }

        .image-upload-container:hover
        {
            background-color: #eee;
        }

        .image-upload-container > input
        {
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .image-upload-container > span
        {
            font-size: 20px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }


        .notice-frm-btn-set
        {
            align-self: flex-end;
        }


        .notice-form input[type="submit"]
        {
            color: white;
            background-color: rgb(18, 97, 149);
            width: 150px;
            height: 45px;
            align-self: flex-end;
            margin: 20px 0;
            border: none;

            border-radius: 2px;
            cursor: pointer;
            margin-left: 10px;
        }

      /*   .notice-form input[type="submit"]:hover
        {
            background-color: rgb(62, 91, 134);
        } */

        .notice-form input[type="button"]
        {
            color: white;
            background-color: rgb(230, 126, 34);
            width: 150px;
            height: 45px;
            align-self: flex-end;
            margin: 20px 0;
            border: none;

            border-radius: 2px;
            cursor: pointer;
        }

        .notice-form-order-seq{position: relative;}

        .order-seq-list
        {
            position: absolute;
            width: 600px;
            height: 367px;
            border: 1px solid black;
            left: 135px;
            top: 60px;
            background-color: white;
            display: flex;
            flex-flow: column nowrap;
            padding: 15px !important;
            border-bottom: 1px solid black !important;
            font-size: 12px;
            z-index: 2;
        }

        #order-seq-list{display: none;}

        .order-seq-list > span
        {
            align-self: flex-start;
        }

        .order-seq-list-header
        {
            width: 100%;
            display: flex;
            margin-top: 20px;
        }

        .order-seq-list-header > div
        {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px;
            background-color: #eee;
        }


        .order-seq-list-header > div:nth-of-type(1){flex: 2 1 0;}
        .order-seq-list-header > div:nth-of-type(2){flex: 2 1 0;}
        .order-seq-list-header > div:nth-of-type(3){flex: 4 1 0;}
        .order-seq-list-header > div:nth-of-type(4){flex: 1 1 0;}
        .order-seq-list-header > div:nth-of-type(5){flex: 2 1 0;}
        .order-seq-list-header > div:nth-of-type(6){flex: 1 1 0;}

        .order-seq-list-cols
        {
            width: 100%;
            display: flex;
        }

        .order-seq-list-cols > div
        {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px;
            border-bottom: 1px solid #ccc;
        }

        .order-seq-list-cols > div:nth-of-type(1){flex: 2 1 0;}        
        .order-seq-list-cols > div:nth-of-type(2){flex: 2 1 0;}        
        .order-seq-list-cols > div:nth-of-type(3){flex: 4 1 0;}        
        .order-seq-list-cols > div:nth-of-type(4){flex: 1 1 0;}        
        .order-seq-list-cols > div:nth-of-type(5){flex: 2 1 0;}        
        .order-seq-list-cols > div:nth-of-type(6){flex: 1 1 0;}    
        
        
          .memberupdate-header
        {
            width: 100%;
            display: flex;
            justify-content: center;
            font-size: 27px;
            font-weight: bold;
            margin: 30px 0;
        }
        
          .memberupdate-nav
        {
            width: 100%;
            display: flex;
            justify-content: center;
        }
          .memberupdate-nav > div
        {
            margin: 0 20px;
            font-size: 17px;
            position: relative;
        }
        
         #divider
        {
            position: absolute;
            display: block;
            height: 1px;
            border: none;
            border-top: 1px solid #ccc;
            left: 0;
            width: 100vw;
        }
         .indicator
        {
            display: block;
            bottom: -8px;
            position: absolute;
            width: 100%;
            height: 5px;
            background-color: rgb(76, 168, 228);
        }
        
        
        a:link { color: black; text-decoration: none;}
	 	a:visited { color: black; text-decoration: none;}
	 	a:hover { color: black; text-decoration: underline;}

    </style>

<section class="section">
<div class="memberupdate-header">공지사항</div>
            <div class="memberupdate-nav">
            <div><a href="${pageContext.request.contextPath}/askBoardMain.do">1대1게시판</a></div>
            <div><a href="${pageContext.request.contextPath}/noticeMain.do">공지사항</a><span class="indicator"></span></div>
          
        </div>
        <hr id="divider"/>
   <div class="notice-form-wrapper">
        <div class="notice-form-header">
            <p></p>
        </div>
        <br/>
        <form name="noticeForm" action="${path }/noticeFormEnd.do" method="post" class="notice-form">
       
            <div class="notice-form-title">
                <div>제목</div>
                <div><input type="text" name="noticeTitle" id="title"  autocomplete="off"></div>
            </div>
            <div class="notice-form-content">
                <div>공지내용</div>
                <div><textarea name="noticeContent" id="content"></textarea></div>
            </div>
            <div class="notice-form-image-upload">
                <div>이미지</div>
                <div>
            
                    <div class="image-upload-container">
                        <span>+</span><input type="file" name="originalFile" id="originalFile">
                    </div>
                </div>
            </div>
            <div class="notice-frm-btn-set">
                <input type="button" value="취소" onclick="history.back(-1);">
                <input type="submit" value="저장" id="saveBtn">
            </div>
        </form>
    </div>
 <script>
$(document).ready(function(){
	$("#saveBtn").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title=="")
			{
				alert("제목을 입력하세요");
				document.noticeForm.title.focus();
				return;
			}
		if(content=="")
			{
				alert("내용을 입력하세요");
				document.noticeForm.content.focus();
				return;
			}
		document.noticeForm.submit();
	});
});

</script>   
    
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>