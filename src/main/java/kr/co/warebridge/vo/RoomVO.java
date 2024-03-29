package kr.co.warebridge.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "roomCode")
public class RoomVO implements Serializable{
	@NotBlank
	@Size(max=10)
	private String roomCode;
	@NotBlank
	@Size(max=50) 
	private String roomName;
	@NotBlank
	@Size(max=50) 
	private String roomSite;
	@Size(max=100) 
	private String roomDetail;
	@NotBlank
	@Size(max=1) 
	private String roomAble;
	@NotBlank
	@Size(max=30) 
	private String empCmpId;
}
