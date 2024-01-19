using System.ComponentModel.DataAnnotations;

public class DeliveryBranch {
  [Key]
  public int DeliveryBranchId {get;set;}//pk label="Delivery_ Branch"
  public int DeliveryServiceId {get;set;}//fk="DeliveryService"
  public DeliveryService DeliveryService {get;set;} //np
  public String BranchName {get;set;}//label="Branch_ Name"
  public List<BranchTelNumber> BranchTelNumbers {get;set;}
//label="Branch_ Tel_ Numbers"
  public String BranchAvailability {get;set;}//label="Branch_ Availability"
  public int BranchAddressId {get;set;}//fk="BranchAddress"
  public BranchAddress BranchAddress {get;set;} //np
  public String BranchGooglemapPosition {get;set;}//label="Branch_ Googlemap_ Position"

}//ec

