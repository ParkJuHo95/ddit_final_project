package kr.co.warebridge.common.paging;

public class BootstrapFormBasePaginationRenderer extends AbstractFormBasePaginationRenderer {

	public BootstrapFormBasePaginationRenderer() {
		this("#pagingForm");
	}
	
	public BootstrapFormBasePaginationRenderer(String targetForm) {
		super(targetForm);
	}

	@Override
	public String renderPagination(PaginationInfo paging) {
		
		String aTagPtrn = "<li class='page-item %s'><a class='page-link' href='javascript;' data-pg-role='pageLink' data-pg-page='%d' data-pg-target='"+getTargetForm()+"'>%s</a></li>";
		String cPagePtrn = "<li class='page-item active'><span class='page-link'>%d</span></li>";
		StringBuffer html = new StringBuffer();
		int startPage = paging.getStartPage();
		int endPage = paging.getEndPage();
		int totalPage = paging.getTotalPage();
		int blockSize = paging.getBlockSize();
		int currentPage = paging.getCurrentPage();
		
		html.append("<nav aria-label='Page navigation'>");
		html.append("<ul class='pagination justify-content-center'>");
		
		if(startPage > blockSize) {
			html.append(String.format(aTagPtrn,"prev", startPage-blockSize,"<"));
		};
		for(int page=startPage; page<=endPage;page++) {
			if(currentPage == page) {
				html.append(String.format(cPagePtrn,page));
			} else {
				html.append(String.format(aTagPtrn,"", page, page));
			}
		}
		if(endPage < totalPage) {
			html.append(String.format(aTagPtrn,"next", endPage+1,">"));
		};
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}

}
