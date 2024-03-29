package kr.co.warebridge.vo.schedule;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "repetitionId")
public class RepetitionVO implements Serializable {
	private String repetitionId;
	private Integer repetitionPeriod;
	private String repetitionRange;
}
