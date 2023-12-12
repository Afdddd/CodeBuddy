package com.kh.coddy.board.free.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Fattachment {
			
    private int fattachmentNo;
    private int fboardNo;
    private String fattachmentOrigin;
    private String fattachmentChange;
    private String fattachmentPath;
    private String fattachmentInsert;
    private int fattachmentLevel;
	
}
