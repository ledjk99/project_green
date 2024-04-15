package com.ezen.mall.web.board.service;

import com.ezen.mall.web.board.dto.Article;
import com.ezen.mall.web.board.dto.Board;
import com.ezen.mall.web.board.dto.Comment;

import java.util.List;

public interface BoardService {
    /**
     * 게시판 목록 반환 서비스
     * @return 게시판 목록
     */
    public List<Board> boardList();


    /**
     * 신규 게시글 등록 서비스
     * @param article 신규 게시글
     */
    public void writeArticle(Article article);

    /**
     * 게시글 개수 반환 서비스
     * @param type  검색 조건
     * @param value 검색 값
     * @return 게시글 개수
     */
    public int getArticleCount(String type, String value);

    /**
     * 게시글 목록 반환 서비스
     * @param rowCount    페이지에 나타나는 행의 수
     * @param requestPage 요청 페이지
     * @param type        검색 조건
     * @param value       검색 값
     * @return 게시글 목록
     */
    public List<Article> articleList(int rowCount, int requestPage, String type, String value, int boardId);

    /**
     * 게시글 상세 보기 서비스
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @return 게시글
     */
    public Article getArticle(int boardId, int articleId);

    /**
     * 게시글 삭제 서비스
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     */
    public void deleteArticle(int boardId, int articleId);


    /**
     * 댓글 등록 서비스
     * @param comment 댓글
     */
    public void writeComment(Comment comment);

    /**
     * 댓글 목록 반환 서비스
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @return 댓글 목록
     */
    public List<Comment> commentList(int boardId, int articleId);

    /**
     * 댓글 삭제 서비스
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @param commentId 댓글 번호
     */
    public void deleteComment(int boardId, int articleId, int commentId);
}
