package spring.model.talk;

import org.springframework.web.multipart.MultipartFile;

public class TalkDTO {
	private int tno;
	private String id;
	private String title;
	private String content;
	private int viewcnt;
	private int rcnt;
	private String fname;
	private String hashtag;
	private String category;
	private String rdate;
	private MultipartFile fnameMF;
	private String passwd;
	private String MFname;
	
	public String getMFname(){
		return MFname;
	}
	public void setMFname(String MFname) {
		this.MFname = MFname;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public TalkDTO(int tno, String id, String title, String content, int viewcnt, int rcnt, String fname, String hashtag,
			String category, String rdate, MultipartFile fnameMF, String passwd, String MFname) {
		super();
		this.tno = tno;
		this.id = id;
		this.title = title;
		this.content = content;
		this.viewcnt = viewcnt;
		this.rcnt = rcnt;
		this.fname = fname;
		this.hashtag = hashtag;
		this.category = category;
		this.rdate = rdate;
		this.fnameMF = fnameMF;
		this.passwd = passwd;
		this.MFname = MFname;
	}
	public TalkDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	@Override
	public String toString() {
		return "TalkDTO [tno=" + tno + ", id=" + id + ", title=" + title + ", content=" + content + ", viewcnt="
				+ viewcnt + ", rcnt=" + rcnt + ", fname=" + fname + ", hashtag=" + hashtag + ", category=" + category
				+ ", rdate=" + rdate + ", fnameMF=" + fnameMF + ", passwd=" + passwd +", MFname=" + MFname + "]";
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}
	public MultipartFile getFnameMF() {
		return this.fnameMF;
	}
	public String getPasswd() {
		// TODO Auto-generated method stub
		return passwd;
	}
	public void setPasswd(String passwd) {
		
		this.passwd = passwd;
	}
}
