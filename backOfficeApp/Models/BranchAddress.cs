using System.ComponentModel.DataAnnotations;

public class BranchAddress {
  [Key]
  public int BranchAddressId {get;set;}//pk label="Branch_ Address"
  public String Province {get;set;}//label="Province"
  public String City {get;set;}//label="City"
  public String Village {get;set;}//label="Village"
  public String AddressDetail {get;set;}//label="Address_ Detail"

}//ec

