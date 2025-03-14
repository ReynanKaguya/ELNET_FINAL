using Microsoft.EntityFrameworkCore;

namespace ELNET01.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) { }

        public DbSet<UserModel> Users { get; set; }
        public DbSet<Contact> Contacts { get; set; } // ✅ Add this line
    }
}
