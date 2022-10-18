<c:if test="${pageInfo.getPages() >1}">
    <ul class="pagination p-center">
        <c:choose>
            <c:when test="${pageInfo.getPages() <=3}">
                <c:set var="begin" value="1"/>
                <c:set var="end" value="${pageInfo.getPages()}"/>
            </c:when>
            <c:otherwise>
                <c:set var="begin" value="${pageInfo.current-1}"/>
                <c:set var="end" value="${pageInfo.current+2}"/>
                <c:if test="${begin < 2 }">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="3"/>
                </c:if>
            </c:otherwise>
        </c:choose>
            <%-- Last Pages --%>
        <c:choose>
            <c:when test="${pageInfo.current eq 1 }">

            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pagePrefix}&page=${pageInfo.current-1}" aria-lavel="Previous">
                        <span class="ti-arrow-left"></span>
                        <span class="sr-only">Lastpage</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
            <%--Show the first page --%>
        <c:if test="${begin>=2 }">
            <li class="page-item"><a class="page-link" href="${pagePrefix}&page=1">1</a></li>
        </c:if>

        <c:if test="${begin > 2 }">
            <li class="page-item"><a class="page-link" href="#"> ... </a></li>
        </c:if>

        <c:forEach begin="${begin }" end="${end  }" var="i">
            <c:choose>
                <c:when test="${i eq pageInfo.current }">
                    <li class="page-item active">
                        <a class="page-link" href="${pagePrefix}&page=${i}">${i}</a></li>

                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link"
                           href="${pagePrefix}&page=${i}">${i}
                        </a></li>

                </c:otherwise>
            </c:choose>
        </c:forEach>


        <c:if test="${end < pageInfo.getPages()-1}">
            <li class="page-item"><a class="page-link" href="#"> ...</a></li>
        </c:if>

        <c:if test="${end < pageInfo.getPages()}">
            <li class="page-item"><a class="page-link"
                                     href="${pagePrefix}&page=${pageInfo.getPages()}">${pageInfo.getPages()}</a>
            </li>
        </c:if>
        <c:choose>
            <c:when test="${pageInfo.current eq pageInfo.getPages()}">
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pagePrefix}&page=${pageInfo.current+1}" aroa-label="Next">
                        <span class="ti-arrow-right"></span>
                        <span class="sr-only">Next</span>

                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</c:if>
