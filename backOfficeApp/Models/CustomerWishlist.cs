using System.ComponentModel.DataAnnotations;

public class CustomerWishlist {
  [Key]
  public int CustomerWishlistId {get;set;}//pk label="Customer_ Wishlists"
  public int ShoeSizeId {get;set;}//fk="ShoeSize"
  public ShoeSize ShoeSize {get;set;} //np
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np

}//ec

