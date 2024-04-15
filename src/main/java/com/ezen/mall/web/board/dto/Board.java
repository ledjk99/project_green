package com.ezen.mall.web.board.dto;

public class Board {
    private int boardId;
    private String title;
    private String description;

    public Board() {}

    public Board(int boardId, String title, String description) {
        this.boardId = boardId;
        this.title = title;
        this.description = description;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Board{" +
                "boardId=" + boardId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
