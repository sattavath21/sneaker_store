using System.ComponentModel.DataAnnotations;

public class ProductSelling {
  [Key]
  public int ProductSellingId {get;set;}//pk label="Product_ Sellings"
  public DateTime ProductLiveDate {get;set;}//label="Product_ Live_ Date"
  public int OrderStatusId {get;set;}//fk="OrderStatus"
  public OrderStatus OrderStatus {get;set;} //np
  public int CustomerPlacedPrice {get;set;}//label="Customer_ Placed_ Price"
  public int Qty {get;set;}//label="Qty"
  public int ShoeSizeId {get;set;}//fk="ShoeSize"
  public ShoeSize ShoeSize {get;set;} //np
  public int ProductConditionId {get;set;}//fk="ProductCondition"
  public ProductCondition ProductCondition {get;set;} //np
  public bool ProductDefect {get;set;}//label="Product_ Defect"
  public bool BoxDefect {get;set;}//label="Box_ Defect"
  public List<CustomerProductImage> CustomerProductImages {get;set;}
//label="Customer_ Product_ Images"
  public List<CustomerDefectImage> CustomerDefectImages {get;set;}
//label="Customer_ Defect_ Images"
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np

}//ec

