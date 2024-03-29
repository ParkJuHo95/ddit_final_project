package kr.co.warebridge.fancytree;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.util.Collections;

import lombok.Getter;

/**
 * https://wwwendt.de/tech/fancytree/doc/jsdoc/FancytreeNode.html 참고
 *
 * @param <T> Fancytree node 로 출력하고 싶은 데이터 타입
 */
@Getter
@JsonInclude(value = Include.NON_EMPTY)
public abstract class AbstractFancytreeNode<T> {
	private T source;
	protected AbstractFancytreeNode(T source) {
		super();
		this.source = source;
	}
	
	public abstract String getKey();
	public abstract String getTitle();
	public List<AbstractFancytreeNode<?>> getChildren(){
		return Collections.emptyList();
	}
	public abstract boolean isExpanded();
	public String getExtraClasses() {
		return null;
	}
	public abstract boolean isFolder();
	public String getStatusNodeType() {
		return null;
	}
	public boolean isLazy() {
		return isFolder() && getChildren().isEmpty();
	}
	public boolean isSelected() {
		return false;
	}
	public String getTooltip() {
		return null;
	}
}
