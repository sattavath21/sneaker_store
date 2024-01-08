using System.ComponentModel.DataAnnotations;

public class Discount {
  [Key]
  public int DiscountId {get;set;}//pk label="Discount"
  public String AppliesTo {get;set;}//label="Applies_ To"
  public String Description {get;set;}//label="Description"
  public double DiscountPercentage {get;set;}//label="Discount_ Percentage"

}//ec

