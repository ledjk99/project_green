package com.ezen.mall.web.board.dao;

import com.ezen.mall.web.board.dto.Article;
import com.ezen.mall.web.board.dto.Board;

import java.sql.SQLException;
import java.util.List;

public interface ArticleDao {

    // BoardDao에 만들어야 되는 메소드
    public List<Board> findByBoardAll() throws SQLException;

    public void createArticle(Article article) throws SQLException;

    public List<Article> findByAll(int rowCount, int requestPage, String type, String value) throws SQLException;

    public int findByArticleCount(String type, String value) throws SQLException;

    public Article findByArticle(int boardId, int articleId) throws SQLException;

    public void updateArticleHitCount(int boardId, int articleId) throws  SQLException;

    public void replyArticle(Article article) throws SQLException;
}
