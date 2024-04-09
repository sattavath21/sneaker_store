using System.ComponentModel.DataAnnotations;

public class City {
  [Key]
  public int CityId {get;set;}//pk label="City"
  public String CityName {get;set;}//label="City_ Name"
  public int ProvinceId {get;set;}//fk="Province"
  public Province Province {get;set;} //np

}//ec

