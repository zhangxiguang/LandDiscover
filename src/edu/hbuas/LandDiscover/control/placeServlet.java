package edu.hbuas.LandDiscover.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "placeServlet", urlPatterns = "/placeServlet")
public class placeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("utf-8");
//        String method = request.getParameter("method");
//        switch (method) {
//            case "addScenery": {
//                addScenery(request, response);
//                break;
//            }
//            case "addHotel": {
//                addHotel(request, response);
//                break;
//            }
//            case "addCar": {
//                addCar(request, response);
//                break;
//            }
//
//            case "allOrderInfo": {
//                allOrderInfo(request, response);
//                break;
//            }


//        }
    }
}