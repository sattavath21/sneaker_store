using System.ComponentModel.DataAnnotations;

public class Bill {
  [Key]
  public int BillId {get;set;}//pk label="Bill"
  public DateTime OrderDate {get;set;}//label="Order_ Date"
  public int OrderStatusId {get;set;}//fk="OrderStatus"
  public OrderStatus OrderStatus {get;set;} //np
  public int ShippingMethodId {get;set;}//fk="ShippingMethod"
  public ShippingMethod ShippingMethod {get;set;} //np
  public String CustomerTransferPicPath {get;set;}//label="Customer_ Transfer_ Pic_ Path"
  public String ShippingReceipt {get;set;}//label="Shipping_ Receipt"
  public int DepositMoney {get;set;}//label="Deposit_ Money"
  public int DiscountId {get;set;}//fk="Discount"
  public Discount Discount {get;set;} //np
  public int DeliveryServiceId {get;set;}//fk="DeliveryService"
  public DeliveryService DeliveryService {get;set;} //np
  public int ProvinceId {get;set;}//fk="Province"
  public Province Province {get;set;} //np
  public int CityId {get;set;}//fk="City"
  public City City {get;set;} //np
  public int VillageId {get;set;}//fk="Village"
  public Village Village {get;set;} //np
  public String AdditionalAddressInfo {get;set;}//label="Additional_ Address_ Info"
  public int StaffId {get;set;}//fk="Staff"
  public Staff Staff {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np
  public List<BillItem> BillItems {get;set;}
//label="Bill_ Items"

}//ec

