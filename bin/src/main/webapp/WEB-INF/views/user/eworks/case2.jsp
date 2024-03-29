<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

   
<script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/lib/fontawesome-free-6.5.1-web/css/all.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/lib/fancytree/skin-awesome/ui.fancytree.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/lib/fancytree/jquery.fancytree-all-deps.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/lib/fancytree/modules/jquery.fancytree.glyph.js"></script>

<style type="text/css">
.fancytree-container {
  font-size: large !important;
}
.fancytree-icon {
  margin-right: 5px !important;
}
</style>
<!-- Initialize the tree when page is loaded -->
<script type="text/javascript">
  $(function(){  // on page load
    $("#tree").fancytree({
    	source : $.getJSON({
    		url : "case2/json"
    	}),
		lazyLoad: function(event, data){
		    var node = data.node;
		    // Load child nodes via Ajax GET /fancytree/case2/lprod/P101/P10101
		    data.result = {
		      url: "case2/json"+node.getKeyPath(),
		      cache: false
		    };
		},
    	extensions: ["glyph"],
    	glyph:{
   	      preset: "awesome5",
   	      map: {
   	    	folder: "fa-solid fa-folder",
   	      	folderOpen: "fa-solid fa-folder-open",
   	      	doc: "fa-solid fa-file"
   	      }
   	    }, 
   	 	selectMode:1,
   	 	dblclick:function(event, data){
   	    	if(!data.node.folder){
   	    		location.href="${pageContext.request.contextPath }/prod/prodView.do?what="+data.node.key;
   	    	}
   	    	return data.node.folder;
   	    }
    });
  
  	var tree = $.ui.fancytree.getTree("#tree");
  });
</script>
<h4>json data lazy loading</h4>
<pre>
	ajax data load : https://github.com/mar10/fancytree/wiki/TutorialLoadData#use-a-deferred-promise
	lazy loading : https://github.com/mar10/fancytree/wiki/TutorialLoadData#lazy-loading
	 
</pre>
<div id="tree"></div>
