using System.ComponentModel.DataAnnotations;

public class Brand {
  [Key]
  public int BrandId {get;set;}//pk label="Brand"
  public String BrandName {get;set;}//label="Brand_ Name"
  public String BrandLogo {get;set;}//label="Brand_ Logo"

}//ec

