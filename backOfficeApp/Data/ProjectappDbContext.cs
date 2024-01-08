using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


public class ProjectappDbContext : IdentityDbContext<AppUser, AppRole, int> {
    //constructor

    public ProjectappDbContext(DbContextOptions opts): base(opts) {}

    //Table Members
    public DbSet<AppUser> AppUser {get;set;}
    public DbSet<CheckInItem> CheckInItem {get;set;}
    public DbSet<Checkin> Checkin {get;set;}
    public DbSet<Customer> Customer {get;set;}
    public DbSet<CustomerAddress> CustomerAddress {get;set;}
    public DbSet<Discount> Discount {get;set;}
    public DbSet<Product> Product {get;set;}
    public DbSet<Productinfor> Productinfor {get;set;}
    public DbSet<Sale> Sale {get;set;}
    public DbSet<SaleItem> SaleItem {get;set;}
    public DbSet<Staff> Staff {get;set;}
    public DbSet<Supplier> Supplier {get;set;}
    public DbSet<SupplierAddress> SupplierAddress {get;set;}
    //end Table Members
    
    protected override void OnModelCreating(ModelBuilder modelBuilder){
        base.OnModelCreating(modelBuilder);
        SnakeCaseIdentityTableNames(modelBuilder);
    }//ef
    private static void SnakeCaseIdentityTableNames(ModelBuilder modelBuilder){
        //#slot4#
    }//ef

}//ec

 
