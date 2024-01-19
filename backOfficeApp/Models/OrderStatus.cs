using System.ComponentModel.DataAnnotations;

public class OrderStatus {
  [Key]
  public int OrderStatusId {get;set;}//pk label="Order_ Status"
  public String StatusName {get;set;}//label="Status_ Name"

}//ec

