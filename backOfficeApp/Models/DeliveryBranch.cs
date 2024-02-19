using System.ComponentModel.DataAnnotations;

public class DeliveryBranch {
  [Key]
  public int DeliveryBranchId {get;set;}//pk label="Delivery_ Branches"
  public int BranchId {get;set;}//fk="Branch"
  public Branch Branch {get;set;} //np
  public int DeliveryServiceId {get;set;}//fk="DeliveryService"
  public DeliveryService DeliveryService {get;set;} //np

}//ec

