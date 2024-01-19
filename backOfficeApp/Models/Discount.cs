using System.ComponentModel.DataAnnotations;

public class Discount {
  [Key]
  public int DiscountId {get;set;}//pk label="Discount"
  public int Minspend {get;set;}//label="Min Spend"
  public String Start {get;set;}//label="Start"
  public int Duration {get;set;}//label="Duration"
  public int Amount {get;set;}//label="Amount"
  public int ShippingmethodId {get;set;}//fk="Shippingmethod"
  public Shippingmethod Shippingmethod {get;set;} //np
  public String Description {get;set;}//label="Description"

}//ec

