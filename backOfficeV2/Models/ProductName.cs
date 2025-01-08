using System.ComponentModel.DataAnnotations;

public class ProductName {
  [Key]
  public int ProductNameId {get;set;}//pk label="Product_ Name"
  public String Name {get;set;}//label="Name"

}//ec

