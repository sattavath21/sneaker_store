using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


public class ProjectappDbContext : IdentityDbContext<AppUser, AppRole, int> {
    //constructor

    public ProjectappDbContext(DbContextOptions opts): base(opts) {}

    //Table Members
    public DbSet<AppUser> AppUser {get;set;}
    public DbSet<Address> Address {get;set;}    public DbSet<Bank> Bank {get;set;}    public DbSet<Billitem> Billitem {get;set;}    public DbSet<Branchaddress> Branchaddress {get;set;}    public DbSet<Branchtelnumber> Branchtelnumber {get;set;}    public DbSet<Brand> Brand {get;set;}    public DbSet<Customer> Customer {get;set;}    public DbSet<Customeraddress> Customeraddress {get;set;}    public DbSet<Customerbankaccount> Customerbankaccount {get;set;}    public DbSet<Customerdefectimage> Customerdefectimage {get;set;}    public DbSet<Customerproductimage> Customerproductimage {get;set;}    public DbSet<Customerwishlist> Customerwishlist {get;set;}    public DbSet<Deliverybranch> Deliverybranch {get;set;}    public DbSet<Deliveryreceiptpic> Deliveryreceiptpic {get;set;}    public DbSet<Deliveryservice> Deliveryservice {get;set;}    public DbSet<Discount> Discount {get;set;}    public DbSet<Orderstatus> Orderstatus {get;set;}    public DbSet<Product> Product {get;set;}    public DbSet<Productcat> Productcat {get;set;}    public DbSet<Productcollection> Productcollection {get;set;}    public DbSet<Productcondition> Productcondition {get;set;}    public DbSet<Productimage> Productimage {get;set;}    public DbSet<Productselling> Productselling {get;set;}    public DbSet<Productwithsize> Productwithsize {get;set;}    public DbSet<Shippingmethod> Shippingmethod {get;set;}    public DbSet<Shoesize> Shoesize {get;set;}    public DbSet<Store> Store {get;set;}    public DbSet<Storebranch> Storebranch {get;set;}
    //end Table Members
    
    protected override void OnModelCreating(ModelBuilder modelBuilder){
        base.OnModelCreating(modelBuilder);
        SnakeCaseIdentityTableNames(modelBuilder);
    }//ef
    private static void SnakeCaseIdentityTableNames(ModelBuilder modelBuilder){
        //#slot4#
    }//ef

}//ec

 
