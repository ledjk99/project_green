package com.ezen.mall.web.board.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.board.dto.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcCommentDao implements CommentDao {
    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    /**
     * 댓글 등록 구현
     * @param comment 댓글
     * @throws SQLException
     */
    @Override
    public void createComment(Comment comment) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO comments(comment_id, content, passwd, article_id, board_id, member_id)")
           .append(" VALUES (comment_id_seq.NEXTVAL, ?, ?, ?, ?, ?)");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, comment.getContent());
            pstmt.setString(2, comment.getPasswd());
            pstmt.setInt(3, comment.getArticleId());
            pstmt.setInt(4, comment.getBoardId());
            pstmt.setString(5, comment.getMemberId());
            pstmt.executeUpdate();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /**
     * 댓글 목록 반환 구현
     * @param boardId   게시판 번호
     * @param articleId 게시글 번호
     * @return 댓글 목록
     * @throws SQLException
     */
    @Override
    public List<Comment> findCommentsAll(int boardId, int articleId) throws SQLException {
        List<Comment> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT c.comment_id, c.member_id, c.board_id, c.article_id, c.content, TO_CHAR(c.regdate, 'YYYY-MM-DD HH24:MI') regdate, c.passwd")
           .append(" FROM comments c")
           .append("        JOIN members m")
           .append("              ON c.member_id = m.member_id")
           .append(" WHERE c.board_id = ? AND c.article_id = ?")
           .append(" ORDER BY comment_id DESC");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardId);
            pstmt.setInt(2, articleId);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setMemberId(rs.getString("member_id"));
                comment.setBoardId(rs.getInt("board_id"));
                comment.setArticleId(rs.getInt("article_id"));
                comment.setContent(rs.getString("content"));
                comment.setRegdate(rs.getString("regdate"));
                list.add(comment);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    /**
     * 댓글 삭제 구현
     * @param boardId   게시판 번호
     * @param articleId 게시글 번호
     * @throws SQLException
     */
    public void removeComment(int boardId, int articleId) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM comments WHERE board_id = ? AND article_id = ?");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardId);
            pstmt.setInt(2, articleId);
            pstmt.executeUpdate();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
