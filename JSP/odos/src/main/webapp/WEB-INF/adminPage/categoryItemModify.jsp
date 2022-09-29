<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.cateModifyTitle{
   font-weight: 500;
   font-size: 30px;
}
.cateListWrapper{
   /* box-sizing: content-box; */
   width: 600px;
   height: 600px;
   overflow: auto;
}
.pagingWrapper{
   padding-left: 155px;
}
table{
border-collapse: collapse;
   
}
td{
   padding:5px;
   align-items: center;
}
</style>
<body>
   <div>
      <p class="cateModifyTitle">${c_name } 상품추가</p>
   </div>
   
   <div class="cateListWrapper">
      <form action="CateItemModifyReg" method="post">
      <input type="hidden" name="c_name" value="${c_name }" />
      <input type="hidden" name="page" value="${param.page }" />
      <table border="">
         <tbody>
                     <tr>
               <td align="center" colspan="3">
                  <input type="submit" value="수정"/>
                  <a href="<c:url value='/admin/CateList'/>">목록으로</a>
                  <%-- "<c:url value='/admin/CateList'/>" --%>
               </td>
            </tr>
            <tr>
               <th width="150px" align="center">상품명</th>
               <th width="120px">상품가격</th>
               <th width="100px">포함</th>      
            </tr>
            <c:forEach items="${p_list}" var="prod">
               <tr>
                  <td align="center">${prod.s_name}</td>
                  <td align="center">${prod.s_price}</td>
                  <td align="center"><input type="checkbox" name="s_index" value="${prod.s_index }" <c:if test="${c_item.contains(prod.s_index) }">checked</c:if>></td>
               </tr>
            </c:forEach>
            <tr>
               <td align="center" colspan="3">
                  <input type="submit" value="수정"/>
                  <a href="<c:url value='/admin/CateList'/>">목록으로</a>
                  <%-- "<c:url value='/admin/CateList'/>" --%>
               </td>
            </tr>
            
         </tbody>
         
      </table>
      </form>
   </div>

</body>