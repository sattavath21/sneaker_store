using System.ComponentModel.DataAnnotations;

public class StoreBranch {
  [Key]
  public int StoreBranchId {get;set;}//pk label="Store_ Branch"
  public String Province {get;set;}//label="Province"

}//ec

