package org.dhappy.mimis.http;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccessPoint extends HttpServlet {
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws IOException {
        response.setContentType("text/plain");
        
    }
}

