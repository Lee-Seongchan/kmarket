<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="./css/common.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="./js/index.js"></script>
    <script src="./js/timeout.js"></script>
    <script>
	//상단 이동 버튼
	$(document).ready(function(){
	    $("#top").click(function(){
	        $("html, body").animate({scrollTop: 0}, "fast");
	    });
	});
	</script>
    <style>
      #bannerTop {
        display: none;
        width: 100%;
        height: 80px;
        border-bottom: 1px solid #e9e9e9;        
        box-sizing: border-box;
      }

      #bannerTop.on {
        display: block;
      }

      #bannerTop > article {
        position: relative;
        width: 1200px;
        height: 100%;        
        margin: 0 auto;
        overflow: hidden;
      }

      #bannerTop > article > .btnClose {
        position: absolute;
        right: 0px;
        top: 0px;
        width: 40px;
        height: 40px;
        background-image: url('./images/ico_sprite.png');
        background-position: -122px -142px;
        background-color: transparent;
        font-size: 0;
        border: none;
        cursor: pointer;
      }

    </style>
    <script>


    </script>
  </head>
  <body>
    <div id="bannerTop" class="on" style="background: #e4dfdf;">
      <article>
        <a href="#"><img src="./images/topBanner1.png"/></a>
        <button class="btnClose">close</button>
      </article>
    </div>
    <div id="container">      
      <header>
        <div class="top">
          <div>
          <c:if test="${sessUser eq null }">
            <a href="./member/login.do">로그인</a>
            <a href="./member/join.do">회원가입</a>
          </c:if>
          <c:if test="${sessUser ne null }">
          	<c:if test="${sessUser.name ne null}">
          		<a href="#">${sessUser.name }</a>
          	</c:if>
          	<c:if test="${sessUser.type == 2 }">
          		<a href="#">${sessUser.company}</a>
          		<a href="/Kmarket/admin/index.do">관리자</a>
          	</c:if>
            	<a href="#">마이페이지</a>
            	<a href="/Kmarket/member/logout.do">로그아웃</a>
            	<a href="/Kmarket/product/cart.do?uid=${sessUser.uid}"
              	><i class="fa fa-shopping-cart" aria-hidden="true"></i
              	>&nbsp;장바구니</a
            	>
          </c:if>  
          </div>
        </div>
        <div class="logo">
          <div>
            <a href="/Kmarket"><img src="./images/header_logo.png" alt="로고" /></a>
            <form action="#">
              <input type="text" name="search" />
              <button><i class="fa fa-search"></i></button>
            </form>
          </div>
        </div>
        <div class="menu">
          <div>
            <ul>
              <li><a href="#">히트상품</a></li>
              <li><a href="#">추천상품</a></li>
              <li><a href="#">최신상품</a></li>
              <li><a href="#">인기상품</a></li>
              <li><a href="#">할인상품</a></li>
            </ul>
            <ul>
              <li><a href="/Kmarket/cs/board/notice/list.do?group=notice&cate=0">공지사항</a></li>
              <li><a href="/Kmarket/cs/board/faq/list.do?group=faq&cate=member">자주묻는질문</a></li>
              <li><a href="/Kmarket/cs/board/qna/list.do?group=qna&cate=member">문의하기</a></li>
              <li><a href="/Kmarket/cs/index.do">고객센터</a></li>
            </ul>
          </div>
        </div>
      </header>
      <main>
        <!-- 카테고리/베스트 상품 영역 -->
        <aside>
          <!-- 카테고리 -->
        <ul class="category">
            <li><i class="fa fa-bars" aria-hidden="true"></i>카테고리</li>
            <li>
                <a href="#"><i class="fas fa-tshirt" aria-hidden="true"></i>패션·의류·뷰티</a>
                <ol>
					<li><a href="/Kmarket/product/list.do?prodCate1=11&prodCate2=11">남성의류</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=11&prodCate2=10">여성의류</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=11&prodCate2=14">잡화</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=11&prodCate2=16">뷰티</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-laptop" aria-hidden="true"></i>가전·디지털</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?prodCate1=15&prodCate2=10">노트북</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=15&prodCate2=16">가전</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=15&prodCate2=13">휴대폰</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=15&prodCate2=12">기타</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-utensils" aria-hidden="true"></i>식품·생필품</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?prodCate1=13&prodCate2=10">신선식품</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=13&prodCate2=11">가공식품</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=13&prodCate2=12">건강식품</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=13&prodCate2=14">생필품</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-home" aria-hidden="true"></i>홈·문구·취미</a>
                <ol>
                    <li><a href="/Kmarket/product/list.do?prodCate1=14&prodCate2=10">가구/DIY</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=14&prodCate2=11">침구·커튼</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=14&prodCate2=13">생활용품</a></li>
                    <li><a href="/Kmarket/product/list.do?prodCate1=14&prodCate2=15">사무용품</a></li>
                </ol>
            </li>
        </ul>
          <!-- 베스트상품 배너 -->
          <article class="best">
            <h1><i class="fas fa-crown"></i>베스트상품</h1>
            <ol>
            
            <c:forEach var="product5" items="${requestScope.products5 }">

              <li>
                <a href="/Kmarket/product/view.do?prodNo=${product5.prodNo}">
                  <div class="thumb">
                    <i>1</i>
                    <img class="thumb3" src="/Kmarket/thumb/${product5.prodCate1}/${product5.prodCate2}/${product5.thumb2}" alt="item1" />
                  </div>
                  <h2>${product5.prodName }</h2>
                  <div class="org_price">
	                <c:if test="${product5.discount == 0}">
	                  <div class="none">${product5.getPriceWithComma()}</div>
	                </c:if>  
	                <c:if test="${product5.discount > 0}">
	                  <del>${product5.getPriceWithComma()}</del>
	                  <span>${product5.discount }%</span>
	                 </c:if>
                  </div>
                  <div class="dis_price">
                    <ins>${product5.getDiscount(product5.price,product5.discount) }</ins>
                  </div>
                </a>
              </li>
             </c:forEach>
            </ol>
          </article>
        </aside>
        <section>
          <!-- 슬라이더 영역 -->
          <section class="slider">
            <ul>
              <li>
                <a href="#"
                  ><img src="/Kmarket/images/mainBanner11.jpg" alt="item1"
                /></a>
              </li>
              <li>
                <a href="#"
                  ><img src="/Kmarket/images/mainBanner2.jpg" alt="item2"
                /></a>
              </li>
              <li>
                <a href="#"
                  ><img src="/Kmarket/images/mainBanner3.jpg" alt="item3"
                /></a>
              </li>
              <li>
                <a href="#"
                  ><img src="/Kmarket/images/mainBanner4 .jpg" alt="item4"
                /></a>
              </li>
              <li>
                <a href="#"
                  ><img src="/Kmarket/images/mainBanner5 .jpg" alt="item5"
                /></a>
              </li>
            </ul>
          </section>
          <!-- 히트상품 영역 -->
          <section class="hit">
            <h3><span>히트상품</span></h3>
            <c:forEach var ="product1" items="${requestScope.products1 }">
            <article>
              <a href="/Kmarket/product/view.do?prodNo=${product1.prodNo}">
                <div class="thumb">
                  <img class="thumb2" src="/Kmarket/thumb/${product1.prodCate1}/${product1.prodCate2}/${product1.thumb2}"  alt="t1" />
                </div>
                <h2>${product1.prodName }</h2>
                <p>${product1.descript }</p>
                <div class="org_price">
	                <c:if test="${product1.discount == 0}">
	                  <div class="none">${product1.getPriceWithComma()}</div>
	                </c:if>  
	                <c:if test="${product1.discount > 0}">
	                  <del>${product1.getPriceWithComma()}</del>
	                  <span>${product1.discount }%</span>
	                 </c:if>
                </div>
                <div class="dis_price">
                  <ins>${product1.getDiscount(product1.price,product1.discount) }</ins>
                  <c:if test="${product1.delivery eq 0}">
                  <span class="free">무료배송</span>
                  </c:if>
                  <c:if test="${product1.delivery != '0'}">
                  	<span> 배송비 : ${product1.delivery}</span>
                  </c:if>
                </div>
              </a>
            </article>
            </c:forEach>
           
          </section>
          <!-- 추천상품 영역 -->
          <section class="recommend">
            <h3><span>추천상품</span></h3>
            <c:forEach var ="product2" items="${requestScope.products2 }">
            <article>
              <a href="/Kmarket/product/view.do?prodNo=${product2.prodNo}">
                <div class="thumb">
                  <img class="thumb2" src="/Kmarket/thumb/${product2.prodCate1}/${product2.prodCate2}/${product2.thumb2}" alt="t1" />
                </div>
                <h2>${product2.prodName }</h2>
                <p>${product2.descript }</p>
                <div class="org_price">
                <c:if test="${product2.discount == 0}">
                  <div class="none">${product2.getPriceWithComma()}</div>
                </c:if>  
                <c:if test="${product2.discount > 0}">
                  <del>${product2.getPriceWithComma()}</del>
                  <span>${product2.discount }%</span>
                 </c:if>
                </div>
                <div class="dis_price">
                  <ins>${product2.getDiscount(product2.price,product2.discount) }</ins>
                  <c:if test="${product2.delivery eq 0}">
                  		<span class="free">무료배송</span>
                  </c:if>
                  <c:if test="${product2.delivery ne 0}">
                  	<span> 배송비 : ${product2.getDeliveryWithComma()}</span>
                  </c:if>
                </div>
              </a>
            </article>
            </c:forEach>
          </section>
          <!-- 최신상품 영역 -->
          <section class="new">
            <h3><span>최신상품</span></h3>
            <c:forEach var ="product3" items="${requestScope.products3 }">
            <article>
              <a href="/Kmarket/product/view.do?prodNo=${product3.prodNo}">
                <div class="thumb">
                  <img class="thumb2" src="/Kmarket/thumb/${product3.prodCate1}/${product3.prodCate2}/${product3.thumb2}" alt="t1" />
                </div>
                <h2>${product3.prodName }</h2>
                <p>${product3.descript }</p>
                <div class="org_price">
                <c:if test="${product3.discount == 0}">
                  <div class="none">${product3.getPriceWithComma()}</div>
                </c:if>  
                <c:if test="${product3.discount > 0}">
                  <del>${product3.getPriceWithComma()}</del>
                  <span>${product3.discount }%</span>
                </c:if>
                  
                </div>
                <div class="dis_price">
                  <ins>${product3.getDiscount(product3.price,product3.discount) }</ins>
                 <c:if test="${product3.delivery eq 0}">
                  	<span class="free">무료배송</span>
                  </c:if>
                  <c:if test="${product3.delivery ne 0}">
                  	<span> 배송비 : ${product3.getDeliveryWithComma()}</span>
                  </c:if>
                </div>
              </a>
            </article>
            </c:forEach>
 			</section>
          <!-- 할인상품 영역 -->
          <section class="discount">
            <h3><span>할인상품</span></h3>
           <c:forEach var ="product4" items="${requestScope.products4 }">
            <article>
              <a href="/Kmarket/product/view.do?prodNo=${product4.prodNo}">
                <div class="thumb">
                  <img class="thumb2" src="/Kmarket/thumb/${product4.prodCate1}/${product4.prodCate2}/${product4.thumb2}" alt="t1" />
                </div>
                <h2>${product4.prodName }</h2>
                <p>${product4.descript }</p>
                <div class="org_price">
                 <c:if test="${product4.discount == 0}">
	                  <div class="none">${product4.getPriceWithComma()}</div>
	                </c:if>  
	                <c:if test="${product4.discount > 0}">
	                  <del>${product4.getPriceWithComma()}</del>
	                  <span>${product4.discount }%</span>
	                 </c:if>
                </div>
                <div class="dis_price">
                  <ins>${product4.getDiscount(product4.price,product4.discount) }</ins>
                 <c:if test="${product4.delivery eq '0'}">
                  <span class="free">무료배송</span>
                  </c:if>
                  <c:if test="${product4.delivery ne 0}">
                  	<span > 배송비 : ${product4.getDeliveryWithComma()}</span>
                  </c:if>
                </div>
              </a>
            </article>
            </c:forEach>
           
          </section>
        </section>
      </main>
      <footer>
        <ul>
          <li><a href="./company/">회사소개</a></li>
          <li><a href="#">서비스이용약관</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">전자금융거래약관</a></li>
        </ul>
        <div>
          <p><img src="./images/footer_logo.png" alt="로고" /></p>
          <p>
            <strong>(주)KMARKET</strong><br />
            부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)<br />
            대표이사 : 홍길동<br />
            사업자등록번호 : 220-81-83676 사업자정보확인<br />
            통신판매업신고 : 강남 10630호 Fax : 02-589-8842
          </p>
          <p>
            <strong>고객센터</strong><br />
            Tel : 1234-5678 (평일 09:00~18:00)<br />
            스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)<br />
            경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층<br />
            Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr<br />
          </p>
        </div>
      </footer>
      <button type="button" id="top">상단이동</button>
    </div>
  </body>
</html>
