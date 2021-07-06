package kr.or.freeBoard.model.vo;

import lombok.Data;

@Data
public class FreeBoard {
	private int fbNo;
	private String fbWriter;
	private String fbContent;
	private String filename;
	private String filepath;
	private int fbViews;
	private int fbGood;
	private int type;
	private String fbDate;
	private String typeString;
	private int flag;		//좋아요 눌렀는지 안눌렀는지 판단하기위한 변수
	
	
	public void setType(int type) {
		this.type = type;
		if(type == 4) {
			this.typeString =  "스포츠";
		}else if(type == 5) {
			this.typeString =   "음악";
		}else if(type == 6) {
			this.typeString =   "여행";
		}else if(type == 7) {
			this.typeString =   "자연";
		}else if(type == 8) {
			this.typeString =   "게임";
		}else if(type == 9) {
			this.typeString =   "영화";
		}else if(type == 10) {
			this.typeString =  "술";
		}else if(type == 11) {
			this.typeString =   "음식";
		}else {
			this.typeString =   "카테고리지정없음";
		}
	}
}
