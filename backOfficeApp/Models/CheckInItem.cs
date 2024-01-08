using System.ComponentModel.DataAnnotations;

public class CheckInItem {
  [Key]
  public int CheckInItemId {get;set;}//pk label="Check_ In_ Items"
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np
  public int CheckInQty {get;set;}//label="Check_ In_ Qty"
  public int CheckinId {get;set;}//fk="Checkin"
  public Checkin Checkin {get;set;} //np

}//ec

