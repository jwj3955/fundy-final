<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.fundy.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
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
	
	.memberupdate-nav > div > a
	{
		text-decoration: none;
		color: #444;
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
	    margin-top: 7px;
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
	
	.memberupdate-body
	{
	    margin-top: 40px;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	}
	
	.memberupdate-wrapper
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	}
	
	.memberupdate-wrapper input
	{
	    height: 35px;
	    width: 222px;
	    box-sizing: border-box;
	    border-radius: 3px;
	    border: 1px solid #ccc;
	    padding: 0 7px;
	}
		
	.memberupdate-wrapper > div
	{
	    display: flex;
	    margin: 10px 0;
	}
	
	.profile-pic-container
	{
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    position: relative;
	    margin-bottom: 35px !important;
	}
	
	.profile-pic
	{
	    width: 100%;
	    height: 100%;
	    border-radius: 50%;
	    object-fit: cover;
	    border: 1px solid #eee;
	}
	
	.profile-upload
	{
	    position: absolute;
	    top: 0;
	    left: 0;
	    opacity: 0;
	    width: 100% !important;
	    height: 100% !important;
	    padding: 0 !important;
	    z-index: 2;
	    cursor: pointer;
	}

	.memberupdate-wrapper > div > div:first-of-type{width: 80px; font-weight: bold;}
	.memberupdate-wrapper > div > div:last-of-type{width: 320px; display: flex;}
	
	.email{width: 100%;}

	.nick{width: 222px;}
	
	.intro
	{
	    resize: none;
	    min-width: 320px;
	    min-height: 100px;
	    border-radius: 4px;
	    border: 1px solid #ccc;
	}
	
	.btn-set
	{
	    width: 400px;
	    display: flex;
	    justify-content: flex-end;
	}
	
	.btn-mod
	{
	    margin: 0;
	    margin-left: 10px;
	}
</style>
    <section class="section">
        <div class="memberupdate-header">회원정보 수정</div>
        <div class="memberupdate-nav">
            <div><a href="${path}/member/memberUpdateView.do">기본정보수정</a><span class="indicator"></span></div>
            <div><a href="${path}/member/memberPwView.do">비밀번호변경</a></div>
            <div><a href="${path}/member/memberAddressView.do">배송지관리</a></div>
            <div><a href="${path}/member/memberDeleteView.do">회원탈퇴</a></div>
        </div>

        <hr id="divider"/>
        
        <div class="memberupdate-body">
            <form action="${path}/memberUpdate/basicUpdate.do" method="post" class="memberupdate-wrapper" enctype="multipart/form-data">
                <div class="profile-pic-container">
                    <img class="profile-pic" src="${path }/resources/memberProfile/${loggedMember.memberProfile}">
                    <input type="file" id="profile-input" name="profileImage" class="profile-upload" value="${loggedMember.memberProfile }" accept="image/*">
                </div>
                <div class="email-row">
                    <div>이메일</div>
                    <div><input type="text" name="memberEmail" class="email" value="${loggedMember.memberEmail}" readonly></div>
                </div>
                
                <div class="nick-row">
                    <div>닉네임</div>
                    <div>
                        <input type="text" name="memberNick" id="memberNick" class="nick" placeholder="닉네임을 입력해주세요." value="${loggedMember.memberNick}">
                        <button class="basic-btn basic-btn-active btn-mod" id="nickCheck" onclick="return false;">중복확인</button>
                    </div>
                </div>
                <div class="intro-row">
                    <div>한줄소개</div>
                    <div>
                        <textarea name="intro" id="intro" class="intro" placeholder="200자 이내로 입력해주세요." >${loggedMember.intro}</textarea>
                    </div>
                </div>
                <div class="btn-set">
                    <button class="basic-btn btn-mod">취소</button>
                    <button class="basic-btn basic-btn-active btn-mod">수정하기</button>
                </div>
            </form>
        </div>
    </section> 
<script>
	//파일 변경시 파일 미리보기
	$(() => {
		const profileInput = $('#profile-input');
		profileInput.on('input', () => {
			
			const reader = new FileReader();
			reader.readAsDataURL(profileInput[0].files[0]);
			reader.onload = () => {
				$('.profile-pic').attr('src', reader.result);
			}
		
		});
	}); 
</script>

<script>
	var checkNick=0;
	$(function(){
		$('#nickCheck').click(function(){
			var memberNick = $('#memberNick').val();
			$.ajax({
				url:"${path}/member/memberNickCheck.do",
				type:"post",
				data:{"memberNick":memberNick},
				dataType:"json",
				success:function(data){
					console.log();
					if(data>0){
						alert('사용할수 없는 닉네임입니다. 다시 입력해주세요.');
						$('#memberNick').val('');
					} else {
						alert('사용가능한 닉네임입니다.');

					}
				}
			});
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>