package kr.co.warebridge.fancytree;

import java.util.Map;

import kr.co.warebridge.vo.DepartmentVO;

public class DepartmentFancytreeNode extends AbstractFancytreeNode<DepartmentVO> {
	
	public DepartmentFancytreeNode(DepartmentVO source) {
		super(source);
	}

	@Override
	public String getKey() {
		return getSource().getDptId();
	}

	@Override
	public String getTitle() {
		return getSource().getDptName();
	}
	
	public String getParent() {
		return getSource().getDptParentdptid();
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
