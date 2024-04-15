package com.ezen.mall.web.board.dto;

public class Article {
    private int articleId;
    private String title;
    private String content;
    private String regdate;
    private int hitCount;
    private String passwd;
    private int boardId;
    private String memberId;
    private int commentCount;

    public Article() {}

    public Article(int articleId, String title, String content, String regdate, int hitCount, String passwd, int boardId, String memberId, int commentCount) {
        this.articleId = articleId;
        this.title = title;
        this.content = content;
        this.regdate = regdate;
        this.hitCount = hitCount;
        this.passwd = passwd;
        this.boardId = boardId;
        this.memberId = memberId;
        this.commentCount = commentCount;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
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

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getHitCount() {
        return hitCount;
    }

    public void setHitCount(int hitCount) {
        this.hitCount = hitCount;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", regdate='" + regdate + '\'' +
                ", hitCount=" + hitCount +
                ", passwd='" + passwd + '\'' +
                ", boardId=" + boardId +
                ", memberId='" + memberId + '\'' +
                ", commentCount=" + commentCount +
                '}';
    }
}
