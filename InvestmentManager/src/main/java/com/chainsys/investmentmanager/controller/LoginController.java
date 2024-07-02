package com.chainsys.investmentmanager.controller;

	
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.investmentmanager.dao.UserImpl;
import com.chainsys.investmentmanager.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserImpl data;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login.jsp";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, Model model) {
        User user = data.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("username", user.getUsername());
            System.out.println("logged in");
            return "home.jsp";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "login.jsp";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
