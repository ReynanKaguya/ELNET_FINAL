using Microsoft.AspNetCore.Mvc;
using ELNET01.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Linq;

namespace ELNET01.Controllers
{
    public class ProfileController : Controller
    {
        private readonly ApplicationDbContext _db;

        public ProfileController(ApplicationDbContext db)
        {
            _db = db;
        }

        // ✅ Show Profile Page
        public IActionResult Index()
        {
            string? username = HttpContext.Session.GetString("User");

            if (string.IsNullOrEmpty(username))
                return RedirectToAction("Login", "Account"); 

            var user = _db.Users.FirstOrDefault(u => u.Username == username);

            if (user == null)
            {
                ViewBag.ErrorMessage = "User not found!";
                return RedirectToAction("Login", "Account");
            }

            return View(user);
        }

        // ✅ Update Profile (POST)
        [HttpPost]
public IActionResult UploadProfilePicture(IFormFile ProfilePictureFile)
{
    string? username = HttpContext.Session.GetString("User");
    if (string.IsNullOrEmpty(username))
        return RedirectToAction("Login", "Account");

    var user = _db.Users.FirstOrDefault(u => u.Username == username);

    if (user == null)
    {
        ViewBag.ErrorMessage = "User not found!";
        return RedirectToAction("Index");
    }

    if (ProfilePictureFile != null && ProfilePictureFile.Length > 0)
    {
        // Save file to wwwroot/images/profile folder
        string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images/profile");
        Directory.CreateDirectory(uploadsFolder); 

        string fileName = $"{Guid.NewGuid()}_{ProfilePictureFile.FileName}";
        string filePath = Path.Combine(uploadsFolder, fileName);

        using (var fileStream = new FileStream(filePath, FileMode.Create))
        {
            ProfilePictureFile.CopyTo(fileStream);
        }

        // Save URL to database
        user.ProfilePicture = $"/images/profile/{fileName}";
        _db.Users.Update(user);
        _db.SaveChanges();

        ViewBag.Message = "Profile picture updated successfully!";
    }
    else
    {
        ViewBag.ErrorMessage = "Please select a valid image file.";
    }

    return RedirectToAction("Index");
}
    }
}