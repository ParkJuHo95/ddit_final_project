package kr.co.warebridge.vo.schedule;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = {"scheduleId","empNo","empCmpId"})
public class PartivipantVO implements Serializable {
	private String scheduleId;
	private String empNo;
	private String empCmpId;
}
