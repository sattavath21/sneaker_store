using System.ComponentModel.DataAnnotations;

public class Bill {
  [Key]
  public int BillId {get;set;}//pk label="Bill"
  public DateTime OrderDate {get;set;}//label="Order_ Date"
  public DateTime StatusDate {get;set;}//label="Status_ Date"
  public int OrderStatusId {get;set;}//fk="OrderStatus"
  public OrderStatus OrderStatus {get;set;} //np
  public int DiscountId {get;set;}//fk="Discount"
  public Discount Discount {get;set;} //np
  public List<DeliveryReceiptPic> DeliveryReceiptPics {get;set;}
//label="Delivery_ Receipt_ Pics"
  public int StoreBranchId {get;set;}//fk="StoreBranch"
  public StoreBranch StoreBranch {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np
  public int DeliveryBranchId {get;set;}//fk="DeliveryBranch"
  public DeliveryBranch DeliveryBranch {get;set;} //np
  public int ShippingMethodId {get;set;}//fk="ShippingMethod"
  public ShippingMethod ShippingMethod {get;set;} //np
  public List<BillItem> BillItems {get;set;}
//label="Bill_ Items"

}//ec

