using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ELNET01.Models;
using System.Security.Cryptography;
using System.Text;
using System.Linq;

namespace ELNET01.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _db;

        public AccountController(ApplicationDbContext db)
        {
            _db = db;
        }

        // ✅ Show Login Page
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("User") != null)
            {
                return RedirectToAction("Index", "Home"); // Redirect logged-in users
            }
            return View();
        }

        // ✅ Handle Login Request
        [HttpPost]
public IActionResult Login(string username, string password)
{
    if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
    {
        ViewBag.ErrorMessage = "Username and Password are required.";
        return View();
    }

    var user = _db.Users.FirstOrDefault(u => u.Username == username);

    if (user == null || !VerifyPassword(password, user.Password))
    {
        ViewBag.ErrorMessage = "Invalid credentials!";
        return View();
    }

    // ✅ Store session variables
    HttpContext.Session.SetString("User", user.Username);
    HttpContext.Session.SetString("Email", user.Email ?? ""); // Store email for navbar

    return RedirectToAction("Index", "Home"); // ✅ Redirect to homepage
}
        // ✅ Logout (Clears All Session Data)
        public IActionResult Logout()
        {
            HttpContext.Session.Clear(); // ✅ Clears all session data
            return RedirectToAction("Login");
        }

        // ✅ Show Register Page
        public IActionResult Register()
        {
            return View();
        }

        // ✅ Handle Registration
        [HttpPost]
        public IActionResult Register(UserModel user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }

            // ✅ Check if username already exists
            if (_db.Users.Any(u => u.Username == user.Username))
            {
                ModelState.AddModelError("Username", "Username already exists.");
                return View(user);
            }

            // ✅ Hash the password before saving
            user.Password = HashPassword(user.Password);

            _db.Users.Add(user);
            _db.SaveChanges();

            return RedirectToAction("Login");
        }

        // ✅ Hashing Password
        private string HashPassword(string? password)
        {
            if (string.IsNullOrEmpty(password))
            {
                throw new ArgumentNullException(nameof(password), "Password cannot be null or empty.");
            }

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

        // ✅ Password Verification
        private bool VerifyPassword(string inputPassword, string storedPassword)
        {
            return HashPassword(inputPassword) == storedPassword;
        }
    }
}
