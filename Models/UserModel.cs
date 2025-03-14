using System.ComponentModel.DataAnnotations;

namespace ELNET01.Models
{
    public class UserModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public required string Username { get; set; } // ✅ Fix: Add 'required' modifier

        [Required]
        public required string Email { get; set; } // ✅ Fix: Add 'required' modifier

        [Required]
        public required string Password { get; set; } // ✅ Fix: Add 'required' modifier

        public string? FullName { get; set; }  // Optional (Nullable)
        public string? PhoneNumber { get; set; }  // Optional (Nullable)
        public string? Country { get; set; }  // Optional (Nullable)
        public string? ProfilePicture { get; set; }  // Optional (Nullable)
    }
}
