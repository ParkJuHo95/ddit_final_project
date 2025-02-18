package kr.co.warebridge.board.exception;

/**
 * 작성자 인증 실패 상황 표현
 *
 */
public class WriterAuthenticationException extends BoardException{

	public WriterAuthenticationException(int cbNo) {
		super(String.format("%d번 게시글 작성자 인증 실패", cbNo));
	}
}
