package com.ezen.mall.web.board.service;

import com.ezen.mall.web.board.dao.*;
import com.ezen.mall.web.board.dto.Article;
import com.ezen.mall.web.board.dto.Board;
import com.ezen.mall.web.board.dto.Comment;

import java.sql.SQLException;
import java.util.List;

public class BoardServiceImpl implements BoardService {
    BoardDao boardDao = new JdbcBoardDao();
    ArticleDao articleDao = new JdbcArticleDao();
    CommentDao commentDao = new JdbcCommentDao();

    /**
     * 게시판 목록 반환 서비스 구현
     * @return 게시판 목록
     */
    @Override
    public List<Board> boardList() {
        try {
            return boardDao.findByBoardAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * 신규 게시글 생성 서비스 구현
     * @param article 신규 게시글
     */
    @Override
    public void writeArticle(Article article) {
        try {
            articleDao.createArticle(article);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 게시글 개수 반환 서비스
     * @param type  검색 조건
     * @param value 검색 값
     * @return 게시글 개수
     */
    @Override
    public int getArticleCount(String type, String value) {
        try {
            return articleDao.findByArticleCount(type, value);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 게시글 목록 반환 서비스 구현
     * @param rowCount    페이지에 나타나는 행의 수
     * @param requestPage 요청 페이지
     * @param type        검색 조건
     * @param value       검색 값
     * @return 게시글 목록
     */
    @Override
    public List<Article> articleList(int rowCount, int requestPage, String type, String value, int boardId) {
        try {
            return articleDao.findByAll(rowCount, requestPage, type, value, boardId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 게시글 상세 보기 서비스 구현
     * @param boardId   게시판 번호
     * @param articleId 게시글 번호
     * @return 게시글
     */
    @Override
    public Article getArticle(int boardId, int articleId) {
        Article article = null;
        try {
            article = articleDao.readArticle(boardId, articleId);
            articleDao.updateArticleHitCount(boardId, articleId);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return article;
    }

    /**
     * 게시판 삭제 서비스 구현
     * @param boardId   게시판 번호
     * @param articleId 게시글 번호
     */
    public void deleteArticle(int boardId, int articleId) {
        try {
            articleDao.removeArticle(boardId, articleId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * 댓글 등록 서비스 구현
     * @param comment 댓글
     */
    @Override
    public void writeComment(Comment comment) {
        try {
            commentDao.createComment(comment);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 댓글 목록 반환 구현
     * @param boardId   게시판 번호
     * @param articleId 게시글 번호
     * @return
     */
    @Override
    public List<Comment> commentList(int boardId, int articleId) {
        try {
            return commentDao.findCommentsAll(boardId, articleId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 댓글 삭제 서비스 구현
     * @param boardId   게시판 번호
     * @param articleId 게시글 번호
     * @param commentId 댓글 번호
     */
    @Override
    public void deleteComment(int boardId, int articleId, int commentId) {
        try {
            commentDao.removeComment(boardId, articleId, commentId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
