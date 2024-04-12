package com.ezen.mall.web.board.dto;

public class Comment {
    private int commentId;
    private String content;
    private String regdate;
    private String passwd;
    private int articleId;
    private int boardId;
    private String memberId;

    public Comment() {}

    public Comment(int commentId, String content, String regdate, String passwd, int articleId, int boardId, String memberId) {
        this.commentId = commentId;
        this.content = content;
        this.regdate = regdate;
        this.passwd = passwd;
        this.articleId = articleId;
        this.boardId = boardId;
        this.memberId = memberId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
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

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", content='" + content + '\'' +
                ", regdate='" + regdate + '\'' +
                ", passwd='" + passwd + '\'' +
                ", articleId=" + articleId +
                ", boardId=" + boardId +
                ", memberId='" + memberId + '\'' +
                '}';
    }
}
