using System.ComponentModel.DataAnnotations;

public class Location {
  [Key]
  public int LocationId {get;set;}//pk label="Locations"
  public int ProvinceId {get;set;}//fk="Province"
  public Province Province {get;set;} //np
  public int CityId {get;set;}//fk="City"
  public City City {get;set;} //np
  public int VillageId {get;set;}//fk="Village"
  public Village Village {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np

}//ec

