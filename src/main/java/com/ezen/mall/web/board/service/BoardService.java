package com.ezen.mall.web.board.service;

import com.ezen.mall.web.board.dto.Article;
import com.ezen.mall.web.board.dto.Board;

import java.util.List;

/**
 * 게시판 관련 비즈니스 로직 선언
 */
public interface BoardService {

    /**
     * 게시판 목록 반환
     * @return 게시판 목록
     */
    public List<Board> boardList();

    /**
     * 신규 게시글 쓰기
     * @param article 신규 게시글
     */
    public void writeArticle(Article article);

    /**
     * 게시글 목록 반환
     * @return 게시글 목록
     */
    public List<Article> articleList(int rowCount, int requestPage, String type, String value);

    /**
     * 게시글 개수 반환
     * @return
     */
    public int getArticleCount(String type, String value);

    /**
     * 게시글 상세
     * @param boardId
     * @param articleId
     * @return
     */
    public Article getArticle(int boardId, int articleId);


    /**
     * 게시판 댓글 등록
     * @param article
     */
    public void replyWriteArticle(Article article);

}
