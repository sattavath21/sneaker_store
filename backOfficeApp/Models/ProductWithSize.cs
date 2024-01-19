using System.ComponentModel.DataAnnotations;

public class ProductWithSize {
  [Key]
  public int ProductWithSizeId {get;set;}//pk label="Product_ With_ Sizes"
  public int InventoryQty {get;set;}//label="Inventory_ Qty"
  public int ShoeSizeId {get;set;}//fk="ShoeSize"
  public ShoeSize ShoeSize {get;set;} //np
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np

}//ec

