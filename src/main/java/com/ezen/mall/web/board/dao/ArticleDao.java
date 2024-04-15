package com.ezen.mall.web.board.dao;

import com.ezen.mall.web.board.dto.Article;

import java.sql.SQLException;
import java.util.List;

public interface ArticleDao {
    /**
     * 신규 게시글 등록
     * @param article 게시글
     * @throws SQLException
     */
    public void createArticle(Article article) throws SQLException;

    /**
     * 게시글 개수 반환
     * @param type 검색 조건
     * @param value 검색 값
     * @return 게시글 개수
     * @throws SQLException
     */
    public int findByArticleCount(String type, String value) throws SQLException;

    /**
     * 게시글 목록 반환
     * @param rowCount 페이지에 나타나는 행의 수
     * @param requestPage 요청 페이지
     * @param type 검색 조건
     * @param value 검색 값
     * @param boardId 게시판 번호
     * @return 게시글 목록
     * @throws SQLException
     */
    public List<Article> findByAll(int rowCount, int requestPage, String type, String value, int boardId) throws SQLException;

    /**
     * 게시글 조회수 업데이트
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @throws SQLException
     */
    public void updateArticleHitCount(int boardId, int articleId) throws SQLException;

    /**
     * 게시글 상세 보기
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @return 게시글
     * @throws SQLException
     */
    public Article readArticle(int boardId, int articleId) throws SQLException;

    /**
     * 게시글 삭제
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @throws SQLException
     */
    public void removeArticle(int boardId, int articleId) throws SQLException;
}