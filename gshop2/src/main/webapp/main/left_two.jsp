<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/fontawesome5/css/all.css">

<style>
.search {
	    max-width: 24px;
}
	.r_sns{
		color: #353535;
		text-align: right;
		padding: 0;
		margin: 0px;
}
.r_sns li{
		color: #353535;
		margin: 0;
		padding: 0;
		list-style: none;
		display: inline-block;
}
</style>
	<c:if test="${adminDTO != null }"></c:if>
	<c:if test="${adminDTO == null}">
	<div>
		<img class="search" src="/image/036search_100009.png">
	</div>
	<div><br><br>
	<a href="#" id="favorite" title="즐겨찾기 추가">
		<span style="letter-spacing: 2pt;">+BOOKMARK</span>
	</a>
	</div><br><br>
	<div>
	
	<a href="/trading/userCart.do" id="" title="장바구니">
		<span style="letter-spacing: 2pt;">CART</span>
			<c:if test="${cartList==null||cartList.size()==0}">		
			   	<a href="/trading/userCart.do">${cartList.size()}건</a>	  
			</c:if>
			<c:if test="${cartList!=null&&cartList.size()>0}">
				 <a href="/trading/userCart.do">${cartList.size()}건</a>	   		
			</c:if>	
	</a>
	
	
	</div><br><br><br><br>
	<div class="r_sns">
        <ul><li><a href="https://hyn_t.blog.me/220528688268" target="_blank" class="-ms"><i class="fa fa-bold" aria-hidden="true"></i></a></li>
            <li><a href="http://www.instagram.com/hyn_t/" target="_blank" class="-ms"><i class="fab fa-instagram" aria-hidden="true"></i></a></li>
            <li><a href="https://www.facebook.com/ByhynT" target="_blank" class="-ms"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
        </ul></div>
	</c:if>
<script>
  
    
    $(document).ready(function() {
        $('#favorite').on('click', function(e) {
            var bookmarkURL = window.location.href;
            var bookmarkTitle = document.title;
            var triggerDefault = false;
     
            if (window.sidebar && window.sidebar.addPanel) {
                // Firefox version < 23
                window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
            } else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
                // Firefox version >= 23 and Opera Hotlist
                var $this = $(this);
                $this.attr('href', bookmarkURL);
                $this.attr('title', bookmarkTitle);
                $this.attr('rel', 'sidebar');
                $this.off(e);
                triggerDefault = true;
            } else if (window.external && ('AddFavorite' in window.external)) {
                // IE Favorite
                window.external.AddFavorite(bookmarkURL, bookmarkTitle);
            } else {
                // WebKit - Safari/Chrome
                alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
            }
     
            return triggerDefault;
        });
    });

  
</script>



