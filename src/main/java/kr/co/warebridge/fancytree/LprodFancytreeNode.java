package kr.co.warebridge.fancytree;

import java.util.Map;

public class LprodFancytreeNode extends AbstractFancytreeNode<Map<String, Object>> {
	
	public LprodFancytreeNode(Map<String, Object> source) {
		super(source);
	}

	@Override
	public String getKey() {
		return getSource().get("lprodGu").toString();
	}

	@Override
	public String getTitle() {
		return getSource().get("lprodNm").toString();
	}

	@Override
	public boolean isExpanded() {
		return false;
	}

	@Override
	public boolean isFolder() {
		return true;
	}

	@Override
	public boolean isLazy() {
		return true;
	}
}
