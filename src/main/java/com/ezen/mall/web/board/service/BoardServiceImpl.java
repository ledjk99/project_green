package com.ezen.mall.web.board.service;

import com.ezen.mall.web.board.dao.ArticleDao;
import com.ezen.mall.web.board.dao.JdbcArticleDao;
import com.ezen.mall.web.board.dto.Article;
import com.ezen.mall.web.board.dto.Board;

import java.sql.SQLException;
import java.util.List;

public class BoardServiceImpl implements BoardService{

    ArticleDao articleDao = new JdbcArticleDao();

    @Override
    public List<Board> boardList() {
        try {
            return articleDao.findByBoardAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void writeArticle(Article article) {
        try {
            articleDao.createArticle(article);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Article> articleList(int rowCount, int requestPage, String type, String value) {
        try {
            return articleDao.findByAll(rowCount, requestPage, type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getArticleCount(String type, String value) {
        int count = 0;
        try {
            count = articleDao.findByArticleCount(type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    @Override
    public Article getArticle(int boardId, int articleId) {
        Article article = null;
        try {
            article = articleDao.findByArticle(boardId, articleId);
            articleDao.updateArticleHitCount(boardId, articleId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return article;
    }


    @Override
    public void replyWriteArticle(Article article) {

    }
}
