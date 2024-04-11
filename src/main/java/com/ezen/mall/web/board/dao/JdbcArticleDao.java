package com.ezen.mall.web.board.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.board.dto.Article;
import com.ezen.mall.web.board.dto.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcArticleDao implements ArticleDao{

    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();


    /**
     * 게시판 검색
     * @return
     * @throws SQLException
     */
    @Override
    public List<Board> findByBoardAll() throws SQLException {
        List<Board> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT board_id, category, title, description")
           .append(" FROM   board")
           .append(" ORDER BY board_id");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while(rs.next()){
                Board board = new Board();
                board.setBoardId(rs.getInt("board_id"));
                board.setCategory(rs.getInt("category"));
                board.setTitle(rs.getString("title"));
                board.setDescription(rs.getString("description"));
                list.add(board);
            }
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return  list;
    }

    /**
     * 게시판 글쓰기
     * @param article
     * @throws SQLException
     */
    @Override
    public void createArticle(Article article) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO article (article_id, board_id, writer, title, content, passwd, group_no, level_no, order_no)")
           .append(" VALUES (article_id_seq.NEXTVAL, ?, ?, ?, ?, ?, article_id_seq.CURRVAL, 0, 0)");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, article.getBoardId());
            pstmt.setString(2, article.getWriter());
            pstmt.setString(3, article.getTitle());
            pstmt.setString(4, article.getContent());
            pstmt.setString(5, article.getPasswd());
            pstmt.executeUpdate();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(con !=  null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


    
    
    /**
     * 게시글 전체 목록 및 검색유형에 따른 게시글 목록 반환
     * @param rowCount      테이블당 보여지는 행의 갯수
     * @param requestPage   사용자 요청 페이지
     * @param type          검색 유형
     * @param value         검색 값
     * @return              검색 목록
     * @throws SQLException
     */
    @Override
    public List<Article> findByAll(int rowCount, int requestPage, String type, String value) throws SQLException {
        List<Article> list = new ArrayList<>();

        if(type != null && type.equals("")) {
            type = null;
        }

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT title, writer, regdate, hitcount, board_id, article_id, group_no, level_no, order_no")
           .append(" FROM ( SELECT CEIL(rownum / ?) request_page, title, writer, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate, hitcount, board_id, article_id, group_no, level_no, order_no")
           .append("        FROM ( SELECT title, writer, regdate, hitcount, board_id, article_id, group_no, level_no, order_no")
           .append("               FROM   article ")
           .append("               WHERE  board_id = 10");

        // 검색 타입 및 값에 따른 동적 SQL 처리
        if(type != null) {
            switch (type){
                case "t" : // 제목 검색
                    value =  "%"+ value + "%";
                    sql.append("               AND title LIKE ?");
                    break;
                case "c" : // 내용 검색
                    value =  "%"+ value + "%";
                    sql.append("               AND content LIKE ?");
                    break;
                case "w" : // 작성자 검색
                    sql.append("               AND writer = ?");
                    break;
                case "tc" : // 제목 + 내용 검색
                    value =  "%"+ value + "%";
                    sql.append("               AND title LIKE ? OR content LIKE ?");
                    break;
                case "tcw" : // 제목 + 내용 + 작성자 검색
                    value =  "%"+ value + "%";
                    sql.append("               AND title LIKE ? OR content LIKE ? OR writer LIKE ?");
                    break;
            }
        }

        sql.append("               ORDER  BY group_no DESC, order_no ASC")
           .append("        ) )")
           .append(" WHERE  request_page = ?");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, rowCount);
            // 전체 검색인 경우
            if(type == null) {
                pstmt.setInt(2, requestPage);
            }else{ // 조건 검색인 경우
                switch (type){
                    case "t" : // 제목 검색
                    case "c" : // 내용 검색
                    case "w" : // 작성자 검색
                        pstmt.setString(2, value);
                        pstmt.setInt(3, requestPage);
                        break;
                    case "tc" : // 제목+내용
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        pstmt.setInt(4, requestPage);
                        break;
                    case "tcw" : // 제목+내용+작성자
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        pstmt.setString(4, value);
                        pstmt.setInt(5, requestPage);
                        break;
                }
            }

            rs = pstmt.executeQuery();
            while(rs.next()){
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setWriter(rs.getString("writer"));
                article.setRegdate(rs.getString("regdate"));
                article.setHitCount(rs.getInt("hitcount"));
                article.setBoardId(rs.getInt("board_id"));
                article.setArticleId(rs.getInt("article_id"));
                article.setGroupNo(rs.getInt("group_no"));
                article.setLevelNo(rs.getInt("level_no"));
                article.setOrderNo(rs.getInt("order_no"));
                list.add(article);
            }
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return  list;
    }


    /**
     * 게시판 검색
     * @param type
     * @param value
     * @return
     * @throws SQLException
     */
    @Override
    public int findByArticleCount(String type, String value) throws SQLException {
        int count = 0;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT count(*) count")
           .append(" FROM  article");

        // 검색 타입 및 값에 따른 동적 SQL 처리
        if(type != null) {
            switch (type){
                case "t" : // 제목 검색
                    value =  "%"+ value + "%";
                    sql.append(" WHERE title LIKE ?");
                    break;
                case "c" : // 내용 검색
                    value =  "%"+ value + "%";
                    sql.append(" WHERE content LIKE ?");
                    break;
                case "w" : // 작성자 검색
                    sql.append(" WHERE writer = ?");
                    break;
                case "tc" : // 제목 + 내용 검색
                    value =  "%"+ value + "%";
                    sql.append(" WHERE title LIKE ? OR content LIKE ?");
                    break;
                case "tcw" : // 제목 + 내용 + 작성자 검색
                    value =  "%"+ value + "%";
                    sql.append(" WHERE title LIKE ? OR content LIKE ? OR writer LIKE ?");
                    break;
            }
        }

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());

            // 조건 검색인 경우
            if(type != null) {
                switch (type){
                    case "t" : // 제목 검색
                    case "c" : // 내용 검색
                    case "w" : // 작성자 검색
                        pstmt.setString(1, value);
                        break;
                    case "tc" : // 제목+내용
                        pstmt.setString(1, value);
                        pstmt.setString(2, value);
                        break;
                    case "tcw" : // 제목+내용+작성자
                        pstmt.setString(1, value);
                        pstmt.setString(2, value);
                        pstmt.setString(3, value);
                        break;
                }
            }
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt("count");
            }
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return count;
    }

    /**
     * 상세 글보기
     * @param boardId
     * @param articleId
     * @return
     * @throws SQLException
     */
    @Override
    public Article findByArticle(int boardId, int articleId) throws SQLException {
        Article article = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT article_id, board_id, writer, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') regdate, hitcount, passwd, group_no, level_no, order_no")
           .append(" FROM article")
           .append(" WHERE board_id = ? AND article_id = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, boardId);
            pstmt.setInt(2, articleId);
            rs = pstmt.executeQuery();
            if(rs.next()){
                article = new Article();
                article.setArticleId(rs.getInt("article_id"));
                article.setBoardId(rs.getInt("board_id"));
                article.setWriter(rs.getString("writer"));
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setRegdate(rs.getString("regdate"));
                article.setHitCount(rs.getInt("hitcount"));
                article.setPasswd(rs.getString("passwd"));
                article.setGroupNo(rs.getInt("group_no"));
                article.setLevelNo(rs.getInt("level_no"));
                article.setOrderNo(rs.getInt("order_no"));
            }
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return  article;
    }


    /**
     * 클릭시 조회수 업데이트
     * @param boardId
     * @param articleId
     * @throws SQLException
     */
    @Override
    public void updateArticleHitCount(int boardId, int articleId) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE article")
           .append(" SET hitcount = hitcount + 1")
           .append(" WHERE board_id = ? AND article_id = ?");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, boardId);
            pstmt.setInt(2, articleId);
            pstmt.executeUpdate();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(con !=  null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }






    /**
     * 게시판 댓글쓰기
     * @param article
     * @throws SQLException
     */
    @Override
    public void replyArticle(Article article) throws SQLException {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO article (article_id, board_id, writer, title, content, passwd, group_no, level_no, order_no)")
                .append(" VALUES      (article_id_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, 0 + 1,( SELECT MAX(?) + 1")
                .append("               FROM   article")
                .append("               WHERE  board_id = ? AND group_no = ?))");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, article.getBoardId());
            pstmt.setString(2, article.getWriter());
            pstmt.setString(3, article.getTitle());
            pstmt.setString(4, article.getContent());
            pstmt.setString(5, article.getPasswd());
            pstmt.setInt(6, article.getGroupNo());
            pstmt.setInt(7, article.getLevelNo());
            pstmt.setInt(8, article.getOrderNo());
            pstmt.setInt(9, article.getBoardId());
            pstmt.setInt(10, article.getGroupNo());
            pstmt.executeUpdate();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(con !=  null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }












    public static void main(String[] args) throws SQLException {
        ArticleDao articleDao = new JdbcArticleDao();






//        Article article = new Article();
//        article.setBoardId(10);
//        article.setWriter("bangry");
//        article.setTitle("연습을 위한 게시글 제목입니다.");
//        article.setContent("연습을 위한 게시글 내요입니다.");
//        article.setPasswd("1111");
//
//        articleDao.createArticle(article);
//        System.out.println("신규글 등록 완료...");

//        System.out.println(articleDao.findByBoardAll());

        // 페이지별 목록조회
//        int rowCount = 20;
//        int requestPage = 2;
//        String type = null;
//        String value = null;
//        List<Article> list = articleDao.findByAll(rowCount, requestPage, type, value);
//        System.out.println("게시글 목록 갯수: " + list.size());
//        for (Article article : list) {
//            System.out.println(article);
//        }
//        전체검색
//        System.out.println(articleDao.findByArticleCount(null, null));
//        System.out.println(articleDao.findByArticleCount("tcw", "bangry"));

//        Article article = articleDao.findByArticle(10, 500);
//        if(article == null){
//            System.out.println("없음");
//        }else{
//            System.out.println(article);
//        }

//        articleDao.updateArticleHitCount(10, 100);

//        댓글 등록을 위한 연습



    }
}
