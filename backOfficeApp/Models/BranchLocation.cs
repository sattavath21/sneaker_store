using System.ComponentModel.DataAnnotations;

public class BranchLocation {
  [Key]
  public int BranchLocationId {get;set;}//pk label="Branch_ Locations"
  public int ProvinceId {get;set;}//fk="Province"
  public Province Province {get;set;} //np
  public int CityId {get;set;}//fk="City"
  public City City {get;set;} //np
  public int VillageId {get;set;}//fk="Village"
  public Village Village {get;set;} //np
  public int DeliveryServiceId {get;set;}//fk="DeliveryService"
  public DeliveryService DeliveryService {get;set;} //np

}//ec

