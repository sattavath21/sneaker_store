using System.ComponentModel.DataAnnotations;

public class Branch {
  [Key]
  public int BranchId {get;set;}//pk label="Branch"
  public String BranchName {get;set;}//label="Branch_ Name"
  public List<BranchTelNumber> BranchTelNumbers {get;set;}
//label="Branch_ Tel_ Numbers"

}//ec

