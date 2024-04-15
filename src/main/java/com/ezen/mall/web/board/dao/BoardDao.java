package com.ezen.mall.web.board.dao;

import com.ezen.mall.web.board.dto.Board;

import java.sql.SQLException;
import java.util.List;

public interface BoardDao {
    /**
     * 게시판 목록 반환
     * @return 게시판 목록
     * @throws SQLException
     */
    public List<Board> findByBoardAll() throws SQLException;
}
