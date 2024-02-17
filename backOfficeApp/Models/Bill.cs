using System.ComponentModel.DataAnnotations;

public class Bill {
  [Key]
  public int BillId {get;set;}//pk label="Bill"
  public String OrderDate {get;set;}//label="Order_ Date"
  public int OrderStatusId {get;set;}//fk="OrderStatus"
  public OrderStatus OrderStatus {get;set;} //np
  public int ShippingMethodId {get;set;}//fk="ShippingMethod"
  public ShippingMethod ShippingMethod {get;set;} //np
  public int CustomerTransferPicId {get;set;}//fk="CustomerTransferPic"
  public CustomerTransferPic CustomerTransferPic {get;set;} //np
  public int DiscountId {get;set;}//fk="Discount"
  public Discount Discount {get;set;} //np
  public int DeliveryBranchId {get;set;}//fk="DeliveryBranch"
  public DeliveryBranch DeliveryBranch {get;set;} //np
  public int StaffId {get;set;}//fk="Staff"
  public Staff Staff {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np
  public List<BillItem> BillItems {get;set;}
//label="Bill_ Items"

}//ec

