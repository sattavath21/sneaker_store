using System.ComponentModel.DataAnnotations;

public class DeliveryService {
  [Key]
  public int DeliveryServiceId {get;set;}//pk label="Delivery_ Service"
  public String DeliveryCompanyName {get;set;}//label="Delivery_ Company_ Name"
  public List<BranchLocation> BranchLocations {get;set;}
//label="Branch_ Locations"

}//ec

