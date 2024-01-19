using System.ComponentModel.DataAnnotations;

public class BillItem {
  [Key]
  public int BillItemId {get;set;}//pk label="Bill_ Items"
  public int Qty {get;set;}//label="Qty"
  public int ShoeSizeId {get;set;}//fk="ShoeSize"
  public ShoeSize ShoeSize {get;set;} //np
  public int ProductConditionId {get;set;}//fk="ProductCondition"
  public ProductCondition ProductCondition {get;set;} //np
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np
  public int BillId {get;set;}//fk="Bill"
  public Bill Bill {get;set;} //np

}//ec

