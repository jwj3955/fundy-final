<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
	.proj-category
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    color: var(--basic-color);
	    font-weight: bold;
	    margin: 30px 0;
	}
	
	.proj-title
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    font-size: 35px;
	    font-weight: bold;
	}
	
	.proj-creator-brief
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    margin: 20px 0;
	}
	
	.creator{font-weight: bold;}
	.divider{margin: 1px 10px 0 10px; font-size: 14px; font-weight: bold;}
	
	.proj-main-info
	{
	    width: 100%;
	    display: flex;   
	}
	
	.proj-main-left
	{
	    flex: 7 1 0;
	}
	
	.proj-main-right
	{
	    flex: 4 1 0;
	}
	
	.proj-thumnail
	{
	    height: 310px;
	    width: 100%;
	}
	
	.progbar-container
	{
	    position: relative;
	    width: 100%;
	    margin: 15px 0;
	}
	
	.progbar-filled
	{
	    position: absolute;
	    top: 0;
	    height: 6px;
	    background-color: var(--basic-color);
	}
	.progbar-empty
	{
	    width: 100%;
	    height: 6px;
	    background-color: rgb(153, 208, 229);
	}
	
	.progbar-info
	{
	    display: flex;
	    justify-content: space-between;
	    font-size: 19px;
	}
	
	.progbar-info > span:first-of-type
	{
	    font-weight: bold;
	    color: var(--basic-color);
	}
	
	.proj-main-right
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	    justify-content: space-between;
	    padding-left: 25px;
	}
	
	.proj-main-right > div
	{
	    width: 100%;
	    display: flex;
	    justify-content: flex-start;
	}
	
	.proj-main-btn-box
	{
	    display: flex;
	    justify-content: space-between;
	    width: 100%;
	    margin-bottom: 65px;
	}
	
	.proj-main-btn-box > button:first-of-type
	{
	    flex: 3 1 0;
	    margin-right: 20px;
	    font-size: 17px;
	}
	.proj-main-btn-box > button:last-of-type
	{
	    flex: 2 1 0;
	    color: var(--basic-color);
	}
	
	.proj-main-btn-box > button > i {transform: translateY(4px);}
	
	.btn-modify
	{
	    margin: 0;
	}
	
	.total-money
	{
	    font-size: 15px;
	    display: flex;
	    align-items: center;
	}
	
	.total-money > span
	{
	    font-size: 30px;
	    margin: 0 20px;
	    font-weight: bold;
	}
	
	.participants
	{
	    margin-bottom: 60px;
	    font-size: 15px;
	    display: flex;
	    align-items: center;
	}
	
	.participants > span
	{
	    font-size: 30px;
	    margin: 0 20px;
	    font-weight: bold;
	}
	
	.proj-period
	{
	    color: var(--basic-color);
	    font-size: 18px;
	    font-weight: bold;
	}
	
	.proj-period span:last-of-type
	{
	    color: #333;
	    font-weight: normal;
	}
	
	.goal-money
	{
	    color: var(--basic-color);
	    font-size: 18px;
	    font-weight: bold;
	}
	
	.goal-money > span:last-of-type
	{
	    color: #333;
	    font-weight: normal;
	}
	
	.divider-2
	{
	    margin: 2px 15px 0px 15px;
	    font-size: 15px;
	}
	
	.proj-detail-nav
	{
	    width: 100%;
	    margin-top: 40px;
	    margin-bottom: 20px;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	
	.proj-detail-nav-wrapper
	{
	    width: 63.6363%;
	    display: flex;
	    justify-content: space-between;
	    position:relative;
	    padding: 15px 5px 7px 5px;
	    margin-bottom: 10px;
	    font-size: 18px;
	}
	
	.proj-detail-nav-wrapper > div{cursor: pointer;}
	.proj-detail-nav-wrapper > div:last-of-type{margin-right: 20px;}
	
	.indicator
	{
	    position: absolute;
	    bottom: -10px;
	    height: 5px;
	    background-color: rgba(18, 97, 149, .8);
	    transition: 250ms ease;
	}
	
	.proj-detail-bottom{width: 100%; display: flex;}
	
	.proj-detail-bottom-left{flex: 7 1 0; margin-right: 25px; display: flex; flex-flow: column; width: 100%;}
	.proj-detail-bottom-right{flex: 4 1 0;}
	
	.creator-info-box
	{
	    width: 100%;
	    border: 1px solid #ccc;
	    padding: 20px;
	    box-sizing: border-box;
	}
	
	.creator-info-box > div:first-of-type{font-weight: bold; color: var(--basic-color);}
	
	.creator-name-profile-pic
	{
	    width: 100%;
	    display: flex;
	    align-items: center;
	    padding: 20px 0;
	    border-bottom: 1px solid #ccc;
	    font-size: 22px;
	    font-weight: bold;
	}
	
	.profile-pic
	{
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    margin-right: 20px;
	    object-fit: contain;
	}
	
	.creator-info-rest
	{
	    display: flex;
	    justify-content: space-between;
	    margin: 15px 0 10px 0;
	}
	
	.creator-info-rest > div > span
	{
	    font-weight: bold;
	    margin: 0 10px;
	}
	
	.contact-btns > i{cursor: pointer; color: var(--basic-color); transform: translateX(-2px);}
	.contact-btns > i:hover{color: rgb(38, 117, 169);}
	.contact-btns > i:first-of-type{font-size: 45px;}
	
	.contact-btns > i:last-of-type
	{
	    font-size: 42px;
	    transform: translateY(1px);
	}
	
	.option-count
	{
	    margin: 30px 0 15px 0;
	    font-size: 19px;
	    font-weight: bold;
	}
	
	.option-container
	{
	    box-sizing: border-box;
	    padding: 15px;
	    background-color: rgb(231, 231, 231);
	}
	
	.option-box
	{
	    box-sizing: border-box;
	    border: 1px solid #ccc;
	    background-color: white;
	    padding: 20px;
	    display: flex;
	    flex-flow: column;
	    margin-bottom: 15px;
	}
	
	.option-box:last-of-type{margin-bottom: 0;}
	
	.buyer-count
	{
	    font-size: 16px;
	    display: flex;
	    align-items: center;
	}
	
	.buyer-count > i
	{
	    font-size: 25px;
	    margin-right: 5px;
	}
	
	.option-price
	{
	    font-size: 26px;
	    font-weight: bold;
	    color: var(--basic-color);
	    margin: 10px 0 15px 0;
	    padding-bottom: 15px;
	    border-bottom: 1px solid #ccc;
	}
	
	.option-detail > span
	{
	    display: block;
	}
	
	.shipping-date
	{
	    margin: 25px 0 10px 0;
	    font-size: 14px;
	    display: flex;
	}
	
	.divider-3
	{
	    margin: 0 10px;
	    font-size: 12px;
	}
	
	.shipping-date > span:last-of-type
	{
	    font-weight: bold;
	}
	
	.option-select-btn
	{
	    height: 40px;
	    cursor: pointer;
	    font-size: 16px;
	            border-radius: 3px;
	}

</style>
    <section class="section">
        <div class="proj-category">${project.midName }${project.minorName != null ? "&nbsp;&nbsp;-&nbsp;&nbsp;" : ""}${project.minorName != null ? project.minorName : "" }</div>
        <div class="proj-title">
            ${project.projectTitle }
        </div>
        <div class="proj-creator-brief">
    <span class="creator">${project.memberNick }</span>
            <span class="divider">|</span>
            <span class="brief">${project.projectSumary }</span>
        </div>
        <div class="proj-main-info">
            <div class="proj-main-left">
            	<c:choose>
            		<c:when test="${project.projectThumnail != null }">
            			<img class="proj-thumnail" src="${path }/resources/projectRepresent/${project.projectThumnail}">
            		</c:when>
            		<c:otherwise>
            			<img class="proj-thumnail" src="${path }/resources/images/previewDummy.png">
            		</c:otherwise>
            	</c:choose>
                <div class="progbar-container">
                    <div class="progbar-empty"></div>
                    <div class="progbar-filled" style="width:${project.reachRate < 100 ? project.reachRate : 100}%"></div>
                    <div class="progbar-info">
                        <span>${project.reachRate }% 달성</span>
                        <span>17일 남음</span>
                    </div>
                </div>
            </div>
            <div class="proj-main-right">
                <div class="total-money">모인금액<span>${project.reach }</span>원</div>
                <div class="participants">후원자수<span>${project.funderNo }</span>명</div>         
                <div class="proj-period">펀딩기간<span class="divider-2">|</span><span><fmt:formatDate value="${project.beginDate }" pattern="yyyy.MM.dd"/> - <fmt:formatDate value="${project.endDate }" pattern="yyyy.MM.dd"/></span></div>
                <div class="goal-money">목표금액<span class="divider-2">|</span><span>${project.goalPrice } 원</span></div>
                <div class="proj-main-btn-box">
                    <button class="basic-btn basic-btn-active btn-modify ripple">후원하기</button>
                    <button class="basic-btn ripple btn-modify"><i class="material-icons">favorite</i></button>
                </div>
            </div>
        </div>
        <div class="proj-detail-nav">
            <div class="proj-detail-nav-wrapper">
                <div data-target-name="_intro" class="proj-detail-tab current-tab">소개</div>
            </div>
        </div>
        <div class="proj-detail-bottom">
            <div class="proj-detail-bottom-left">
    
    		${project.projectContent }
    
            </div>
            <div class="proj-detail-bottom-right">
                <div class="creator-info-box">
                    <div>창작자 정보</div>
                    <div class="creator-name-profile-pic">
                        <img class="profile-pic" src="${path }/resources/memberProfile/${project.memberProfile }">
                        <div class="creator-name">${project.memberNick }</div>
                    </div>
                    <div class="creator-info-rest">
                        <div>진행한 프로젝트<span>3</span></div>
                        <div>마지막 로그인<span>2시간</span>전</div>
                    </div>
                    <div class="contact-btns">
                        <i class="material-icons">email</i>
                        <i class="material-icons">chat</i>
                    </div>
                </div>
                <c:if test="${project.foList.size() > 0 }">
	                <div class="option-count">
	                    ${fn:length(project.foList)}개의 옵션이 있습니다.
	                </div>
	                <div class="option-container">
	                    <c:forEach items="${project.foList }" var="foList" varStatus="vs">
	                    <div class="option-box">
	                        <div class="buyer-count">
	                            <i class="material-icons">people</i>${foList.funderNo }명이 선택
	                        </div>
	                        <div class="option-price">
	                        	${foList.fundPrice }
	                        </div>
	                        <div class="option-detail">
	                        	<c:forEach items="${foList.odList }" var="odList">
	                            <span>· ${odList.packageName } X ${odList.packageAmount }EA</span>
	                            </c:forEach>
	                        </div>
	                        <div class="shipping-date">
	                        	예상 발송일<span class="divider-3">|</span><span><fmt:formatDate value="${foList.deliveryDate }" pattern="yyyy년 MM월 dd일"/></span>
	                        </div>
	                        <button class="basic-btn-active ripple option-select-btn">선택하기</button>
	                    </div>
	                    </c:forEach>
	                </div>
	        	</c:if>
            </div>
        </div>
    </section>