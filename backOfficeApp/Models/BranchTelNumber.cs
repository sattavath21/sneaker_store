using System.ComponentModel.DataAnnotations;

public class BranchTelNumber {
  [Key]
  public int BranchTelNumberId {get;set;}//pk label="Branch_ Tel_ Numbers"
  public String TelNumber {get;set;}//label="Tel_ Number"
  public int BranchId {get;set;}//fk="Branch"
  public Branch Branch {get;set;} //np

}//ec

