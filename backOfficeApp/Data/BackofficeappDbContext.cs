using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


public class BackofficeappDbContext : IdentityDbContext<AppUser, AppRole, int> {
    //constructor

    public BackofficeappDbContext(DbContextOptions opts): base(opts) {}

    //Table Members
    public DbSet<AppUser> AppUser {get;set;}
    public DbSet<Bill> Bill {get;set;}
    public DbSet<BillItem> BillItem {get;set;}
    public DbSet<Branch> Branch {get;set;}
    public DbSet<BranchTelNumber> BranchTelNumber {get;set;}
    public DbSet<Brand> Brand {get;set;}
    public DbSet<BrandWithCollection> BrandWithCollection {get;set;}
    public DbSet<Collection> Collection {get;set;}
    public DbSet<Customer> Customer {get;set;}
    public DbSet<DeliveryBranch> DeliveryBranch {get;set;}
    public DbSet<DeliveryService> DeliveryService {get;set;}
    public DbSet<Discount> Discount {get;set;}
    public DbSet<OrderStatus> OrderStatus {get;set;}
    public DbSet<Permission> Permission {get;set;}
    public DbSet<Product> Product {get;set;}
    public DbSet<ProductCondition> ProductCondition {get;set;}
    public DbSet<ProductWithSize> ProductWithSize {get;set;}
    public DbSet<ShippingMethod> ShippingMethod {get;set;}
    public DbSet<ShoeSize> ShoeSize {get;set;}
    public DbSet<Staff> Staff {get;set;}
    //end Table Members
    
    protected override void OnModelCreating(ModelBuilder modelBuilder){
        base.OnModelCreating(modelBuilder);
        SnakeCaseIdentityTableNames(modelBuilder);
    }//ef
    private static void SnakeCaseIdentityTableNames(ModelBuilder modelBuilder){
        //#slot4#
    }//ef

}//ec

 
