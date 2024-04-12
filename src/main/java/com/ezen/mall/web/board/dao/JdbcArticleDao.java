package com.ezen.mall.web.board.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.board.dto.Article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcArticleDao implements ArticleDao {
    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    /**
     * 신규 게시글 등록 구현
     * @param article 신규 게시글
     * @throws SQLException
     */
    @Override
    public void createArticle(Article article) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO articles (article_id, title, content, passwd, board_id, member_id)")
           .append(" VALUES (article_id_seq.NEXTVAL, ?, ?, ?, ?, ?)");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, article.getTitle());
            pstmt.setString(2, article.getContent());
            pstmt.setString(3, article.getPasswd());
            pstmt.setInt(4, article.getBoardId());
            pstmt.setString(5, article.getMemberId());
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
     * 게시글 목록 반환 구현
     * @param rowCount 페이지에 나타나는 행의 수
     * @param requestPage 요청 페이지
     * @param type 검색 조건
     * @param value 검색 값
     * @return 게시글 목록
     * @throws SQLException
     */
    public List<Article> findByAll(int rowCount, int requestPage, String type, String value, int boardId) throws SQLException {
        List<Article> list = new ArrayList<>();
        if (type != null && type.equals("")) {
            type = null;
        }

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT a.title, a.member_id, TO_CHAR(a.regdate, 'YYYY-MM-DD HH24:MI') regdate, a.hitcount, a.article_id, a.board_id, c.count count")
           .append(" FROM (SELECT CEIL(rownum / ?) request_page, title, member_id, regdate, hitcount, article_id, board_id")
           .append("         FROM (SELECT title, member_id, regdate, hitcount, article_id, board_id")
           .append("                 FROM articles")
           .append("                WHERE board_id = ?");


        // 검색 타입 및 값에 따른 동적 SQL 처리
        if (type != null) {
            switch (type) {
                case "t": // 제목 검색
                    value = "%" + value + "%";
                    sql.append("               AND title LIKE ?");
                    break;
                case "c": // 내용 검색
                    value = "%" + value + "%";
                    sql.append("               AND content LIKE ?");
                    break;
                case "w": // 작성자 검색
                    sql.append("               AND member_id = ?");
                    break;
                case "tc": // 제목 + 내용 검색
                    value = "%" + value + "%";
                    sql.append("               AND title LIKE ? OR content LIKE ?");
                    break;
                case "tcw": // 제목 + 내용 + 작성자 검색
                    value = "%" + value + "%";
                    sql.append("               AND title LIKE ? OR content LIKE ? OR member_id LIKE ?");
                    break;
            }
        }

        sql.append("                ORDER BY article_id DESC)) a")
           .append(" LEFT JOIN (SELECT article_id, COUNT(*) count FROM comments WHERE board_id = ? GROUP BY article_id) c")
           .append("        ON a.article_id = c.article_id")
           .append(" WHERE  a.request_page = ?")
           .append(" ORDER BY article_id DESC");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, rowCount);
            pstmt.setInt(2, boardId);
            // 전체 검색인 경우
            if (type == null) {
                pstmt.setInt(3, boardId);
                pstmt.setInt(4, requestPage);
            } else { // 조건 검색인 경우
                switch (type) {
                    case "t": // 제목 검색
                    case "c": // 내용 검색
                    case "w": // 작성자 검색
                        pstmt.setString(3, value);
                        pstmt.setInt(4, boardId);
                        pstmt.setInt(5, requestPage);
                        break;
                    case "tc": // 제목 + 내용 검색
                        pstmt.setString(3, value);
                        pstmt.setString(4, value);
                        pstmt.setInt(5, boardId);
                        pstmt.setInt(6, requestPage);
                        break;
                    case "tcw": // 제목 + 내용 + 작성자 검색
                        pstmt.setString(3, value);
                        pstmt.setString(4, value);
                        pstmt.setString(5, value);
                        pstmt.setInt(6, boardId);
                        pstmt.setInt(7, requestPage);
                        break;
                }
            }

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setMemberId(rs.getString("member_id"));
                article.setRegdate(rs.getString("regdate"));
                article.setHitCount(rs.getInt("hitcount"));
                article.setArticleId(rs.getInt("article_id"));
                article.setBoardId(rs.getInt("board_id"));
                article.setCommentCount(rs.getInt("count"));
                list.add(article);
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
     * 게시글 개수 반환 구현
     * @param type 검색 조건
     * @param value 검색 값
     * @return 게시글 개수
     * @throws SQLException
     */
    @Override
    public int findByArticleCount(String type, String value) throws SQLException {
        int count = 0;

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT count(*) count")
           .append(" FROM articles");

        // 검색 타입 및 값에 따른 동적 SQL 처리
        if (type != null) {
            switch (type) {
                case "t" : // 제목 검색
                    value = "%" + value + "%";
                    sql.append(" WHERE title LIKE ?");
                    break;
                case "c" : // 내용 검색
                    value = "%" + value + "%";
                    sql.append(" WHERE content LIKE ?");
                    break;
                case "w" : // 작성자 검색
                    sql.append(" WHERE member_id = ?");
                    break;
                case "tc" : // 제목 + 내용 검색
                    value = "%" + value + "%";
                    sql.append(" WHERE title LIKE ? OR content LIKE ?");
                    break;
                case "tcw" : // 제목 + 내용 + 작성자 검색
                    value = "%" + value + "%";
                    sql.append(" WHERE title LIKE ? OR content LIKE ? OR member_id LIKE ?");
                    break;
            }
        }

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            // 조건 검색인 경우
            if (type != null) {
                switch (type) {
                    case "t" : // 제목 검색
                    case "c" : // 내용 검색
                    case "w" : // 작성자 검색
                        pstmt.setString(1, value);
                        break;
                    case "tc" : // 제목 + 내용 검색
                        pstmt.setString(1, value);
                        pstmt.setString(2, value);
                        break;
                    case "tcw" : // 제목 + 내용 + 작성자 검색
                        pstmt.setString(1, value);
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        break;
                }
            }

            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
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
        return count;
    }

    /**
     * 게시글 상세 보기 구현
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @return 게시글
     * @throws SQLException
     */
    @Override
    public Article readArticle(int boardId, int articleId) throws SQLException {
        Article article = new Article();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT title, content, member_id, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate")
           .append(" FROM articles")
           .append(" WHERE board_id = ? AND article_id = ?");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardId);
            pstmt.setInt(2, articleId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setMemberId(rs.getString("member_id"));
                article.setRegdate(rs.getString("regdate"));
            }
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return article;
    }

    /**
     * 게시글 조회수 반환 구현
     * @param boardId 게시판 번호
     * @param articleId 게시글 번호
     * @throws SQLException
     */
    public void updateArticleHitCount(int boardId, int articleId) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE articles")
           .append(" SET hitcount = NVL(hitcount, 0) + 1")
           .append(" WHERE board_id = ? AND article_id = ?");

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

    public void removeArticle(int boardId, int articleId, String passwd) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM articles WHERE board_id = ? AND article_id = ? AND passwd = ?");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, boardId);
            pstmt.setInt(2, articleId);
            pstmt.setString(3, passwd);
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


    public static void main(String[] args) throws SQLException {
        Article article = new Article();
        article.setBoardId(2);
        article.setTitle("연습을 위한 게시글 제목입니다.");
        article.setContent("연습을 위한 게시글 내용입니다.");
        article.setPasswd("1111");
        article.setMemberId("practice");

        ArticleDao articleDao = new JdbcArticleDao();
//        articleDao.createArticle(article);
//        System.out.println("신규글 등록 완료!");
//
//        int rowCount = 1;
//        int requestPage = 1;
//        String type = "w";
//        String value = "1";
//        int boardId = 2;
////
//        List<Article> articleList = articleDao.findByAll(rowCount, requestPage, type, value, boardId);
//        System.out.println(articleList);

//        System.out.println(articleDao.findByArticleCount(type, value));

//        Article readArticle = articleDao.readArticle(2, 13);
//        System.out.println(readArticle);

//        articleDao.updateArticleHitCount(2, 11);
//        System.out.println("조회수 업데이트 완료!");

        articleDao.removeArticle(2, 19,"1111");
        System.out.println("게시글 삭제 완료!");
    }
}
