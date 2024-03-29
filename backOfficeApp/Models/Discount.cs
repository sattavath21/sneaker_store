using System.ComponentModel.DataAnnotations;

public class Discount {
  [Key]
  public int DiscountId {get;set;}//pk label="Discount"
  public String Description {get;set;}//label="Description"
  public int DiscountPercentage {get;set;}//label="Discount_ Percentage"
  public int MinSpend {get;set;}//label="Min_ Spend"
  public int MaxDiscountAmount {get;set;}//label="Max_ Discount_ Amount"
  public DateTime Start {get;set;}//label="Start"
  public int Duration {get;set;}//label="Duration"
  public int Amount {get;set;}//label="Amount"
  public int ShippingMethodId {get;set;}//fk="ShippingMethod"
  public ShippingMethod ShippingMethod {get;set;} //np

}//ec

