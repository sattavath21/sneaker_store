using System.ComponentModel.DataAnnotations;

public class SaleItem {
  [Key]
  public int SaleItemId {get;set;}//pk label="Sale_ Items"
  public int SaleQty {get;set;}//label="Sale_ Qty"
  public int? DiscountId {get;set;}//fk="Discount"
  public Discount Discount {get;set;} //np
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np
  public int SaleId {get;set;}//fk="Sale"
  public Sale Sale {get;set;} //np

}//ec

