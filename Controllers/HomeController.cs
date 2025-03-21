﻿using System.Diagnostics;
using ELNET01.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http; // Needed for session management

namespace ELNET01.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        // 🔹 Restrict Homepage (Guests are redirected to Login)
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account"); // Redirect guests to Login page
            }
            return View();
        }

        // 🔹 Restrict Privacy Page
        public IActionResult Privacy()
        {
            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        // 🔹 Restrict Contact Page
                public IActionResult Contact()
            {
                return View();
            }


        // 🔹 Restrict About Page
        public IActionResult About()
        {
            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
