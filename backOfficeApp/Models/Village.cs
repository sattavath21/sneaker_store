using System.ComponentModel.DataAnnotations;

public class Village {
  [Key]
  public int VillageId {get;set;}//pk label="Village"
  public String VillageName {get;set;}//label="Village_ Name"
  public int CityId {get;set;}//fk="City"
  public City City {get;set;} //np

}//ec

