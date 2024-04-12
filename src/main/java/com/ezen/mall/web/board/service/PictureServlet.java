package com.ezen.mall.web.board.service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/board/picture")
public class PictureServlet extends HttpServlet {
    private static final String path = "c:/ezen-fullstack/library/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pictureName = request.getParameter("picture");
        String contentType = null;
        String ext = pictureName.substring(pictureName.lastIndexOf(".") + 1);

        switch (ext) {
            case "jpg" : contentType = "image/jpeg"; break;
            case "gif" : contentType = "image/gif"; break;
            case "png" : contentType = "image/png"; break;
        }

        response.setContentType(contentType);
        File file = new File(path, pictureName);

        FileInputStream fis = new FileInputStream(file);
        OutputStream out = response.getOutputStream();

        try {
            byte[] buffer = new byte[1024];
            int count = 0;
            while ((count = fis.read(buffer)) != -1) {
                out.write(buffer, 0, count);
            }
        } finally {
            out.close();
            fis.close();
        }
    }
}
