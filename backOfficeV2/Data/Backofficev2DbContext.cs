using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


public class Backofficev2DbContext : IdentityDbContext<AppUser, AppRole, int> {
    //constructor

    public Backofficev2DbContext(DbContextOptions opts): base(opts) {}

    //Table Members
    public DbSet<AppUser> AppUser {get;set;}
    public DbSet<Bill> Bill {get;set;}    public DbSet<BillItem> BillItem {get;set;}    public DbSet<Brand> Brand {get;set;}    public DbSet<Permission> Permission {get;set;}    public DbSet<Product> Product {get;set;}    public DbSet<ProductName> ProductName {get;set;}    public DbSet<ShoeSize> ShoeSize {get;set;}    public DbSet<Staff> Staff {get;set;}
    //end Table Members
    
    protected override void OnModelCreating(ModelBuilder modelBuilder){
        base.OnModelCreating(modelBuilder);
        SnakeCaseIdentityTableNames(modelBuilder);
    }//ef
    private static void SnakeCaseIdentityTableNames(ModelBuilder modelBuilder){
        //#slot4#
    }//ef

}//ec

 
