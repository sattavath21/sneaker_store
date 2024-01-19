using System.ComponentModel.DataAnnotations;

public class ProductCat {
  [Key]
  public int ProductCatId {get;set;}//pk label="Product_ Cat"
  public String CatName {get;set;}//label="Cat_ Name"

}//ec

