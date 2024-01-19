using System.ComponentModel.DataAnnotations;

public class BranchTelNumber {
  [Key]
  public int BranchTelNumberId {get;set;}//pk label="Branch_ Tel_ Numbers"
  public String TelNumber {get;set;}//label="Tel_ Number"
  public int DeliveryBranchId {get;set;}//fk="DeliveryBranch"
  public DeliveryBranch DeliveryBranch {get;set;} //np

}//ec

