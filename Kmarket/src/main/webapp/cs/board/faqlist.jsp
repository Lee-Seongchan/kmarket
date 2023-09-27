<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<c:import url="./aside.jsp" />

<script>

$(document).ready(function() {
    // 이벤트 핸들러를 각각의 버튼에 할당
    $(".list_btn").each(function() {
        var isOpen = false;
        var $faqList = $(this).closest(".faq_list");
        
        $(this).click(function(e) {
            e.preventDefault();
            
            isOpen = !isOpen;
            if (isOpen) {
                $faqList.find("li:nth-child(n+4)").show();
                $(this).text("닫기");
            } else {
                $faqList.find("li:nth-child(n+4)").hide();
                $(this).text("더보기");
            }
        });
    });
});

</script>

                        <div>
                         <c:forEach var="list" items="${lists}">
                            <h3>${list.typeName}</h3>
                            <ul class="faq_list">
                            <c:forEach var="article" items="${articles}">
                           
                                <c:if test="${list.type eq article.type}">
                                	${list.type} ${article.type }
                                <li>
                                    <a href="/Kmarket/cs/board/view.do?group=${group}&cate=${cate}&no=${article.no}">
                                    <span>Q.</span>${article.title}
                                    </a>
                                </li>
                                </c:if>
                          </c:forEach>
                          <c:if test="${fn:length(articles)eq 0}">
                                <li class="more">
                                    <a class="list_btn" href="#">게시글이 없습니다.</a>
                                </li>
                          </c:if>
                           <c:if test="${fn:length(articles)ne 0}">
                                <li class="more">
                                    <a class="list_btn" href="#">더보기</a>
                                </li>
                          </c:if>        
                            </ul>
                         </c:forEach>  
                        </div>
                       
                    </article>
                </section>
            </div>
        </section>
<%@ include file="../_footer.jsp" %>