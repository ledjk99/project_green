package com.ezen.mall.web.board.dao;

import com.ezen.mall.web.board.dto.Comment;

import java.sql.SQLException;
import java.util.List;

public interface CommentDao {
    /**
     * 댓글 등록
     * @param comment 댓글
     * @throws SQLException
     */
    public void createComment(Comment comment) throws SQLException;

    /**
     * 댓글 목록 반환
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @return 댓글 목록
     * @throws SQLException
     */
    public List<Comment> findCommentsAll(int boardId, int articleId) throws SQLException;

    /**
     * 댓글 개수 반환
     * @return 댓글 개수
     * @throws SQLException
     */
    public int findByCommentCount(int boardId, int articleId) throws SQLException;
}
