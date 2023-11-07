/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Thanhchan
 */
public class CookieUtils {
    // Tạo và gửi cookie về client để lưu 
public static Cookie add(String name, String value, 
    HttpServletResponse resp) { 
    Cookie cookie = new Cookie(name, value); 
    cookie.setMaxAge(60*60*60); 
    cookie.setPath("/"); 
    resp.addCookie(cookie); 
    return cookie; 
} 
// Đọc giá trị cookie gửi từ client 
public static String get(String name, HttpServletRequest req) { 
    Cookie[] cookies = req.getCookies(); 
if(cookies != null) { 
    for(Cookie cookie: cookies) { 
if(cookie.getName().equalsIgnoreCase(name)) { 
    return cookie.getValue(); 
} 
} 
} 
return ""; 
} 
}


