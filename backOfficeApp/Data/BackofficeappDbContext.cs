using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


public class BackofficeappDbContext : IdentityDbContext<AppUser, AppRole, int> {
    //constructor

    public BackofficeappDbContext(DbContextOptions opts): base(opts) {}

    //Table Members
    public DbSet<AppUser> AppUser {get;set;}
    public DbSet<Address> Address {get;set;}    public DbSet<Bank> Bank {get;set;}    public DbSet<Bill> Bill {get;set;}    public DbSet<BillItem> BillItem {get;set;}    public DbSet<BranchAddress> BranchAddress {get;set;}    public DbSet<BranchTelNumber> BranchTelNumber {get;set;}    public DbSet<Brand> Brand {get;set;}    public DbSet<Customer> Customer {get;set;}    public DbSet<CustomerAddress> CustomerAddress {get;set;}    public DbSet<CustomerBankAccount> CustomerBankAccount {get;set;}    public DbSet<CustomerDefectImage> CustomerDefectImage {get;set;}    public DbSet<CustomerProductImage> CustomerProductImage {get;set;}    public DbSet<CustomerWishlist> CustomerWishlist {get;set;}    public DbSet<DeliveryBranch> DeliveryBranch {get;set;}    public DbSet<DeliveryReceiptPic> DeliveryReceiptPic {get;set;}    public DbSet<DeliveryService> DeliveryService {get;set;}    public DbSet<Discount> Discount {get;set;}    public DbSet<OrderStatus> OrderStatus {get;set;}    public DbSet<Product> Product {get;set;}    public DbSet<ProductCat> ProductCat {get;set;}    public DbSet<ProductCollection> ProductCollection {get;set;}    public DbSet<ProductCondition> ProductCondition {get;set;}    public DbSet<ProductImage> ProductImage {get;set;}    public DbSet<ProductSelling> ProductSelling {get;set;}    public DbSet<ProductWithSize> ProductWithSize {get;set;}    public DbSet<ShippingMethod> ShippingMethod {get;set;}    public DbSet<ShoeSize> ShoeSize {get;set;}    public DbSet<StoreBranch> StoreBranch {get;set;}
    //end Table Members
    
    protected override void OnModelCreating(ModelBuilder modelBuilder){
        base.OnModelCreating(modelBuilder);
        SnakeCaseIdentityTableNames(modelBuilder);
    }//ef
    private static void SnakeCaseIdentityTableNames(ModelBuilder modelBuilder){
        //#slot4#
    }//ef

}//ec

 
