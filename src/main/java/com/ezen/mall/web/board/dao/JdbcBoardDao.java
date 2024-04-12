package com.ezen.mall.web.board.dao;


import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.board.dto.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcBoardDao implements BoardDao {
    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    /**
     * 게시판 목록 반환 구현
     * @return 게시판 목록
     * @throws SQLException
     */
    @Override
    public List<Board> findByBoardAll() throws SQLException {
        List<Board> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT board_id, title, description")
           .append(" FROM boards")
           .append(" ORDER BY board_id");

        Connection conn = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Board board = new Board();
                board.setBoardId(rs.getInt("board_id"));
                board.setTitle(rs.getString("title"));
                board.setDescription(rs.getString("description"));
                list.add(board);
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

    public static void main(String[] args) throws SQLException {
        BoardDao boardDao = new JdbcBoardDao();
        List<Board> boardList = boardDao.findByBoardAll();
        System.out.println(boardList);
    }
}
