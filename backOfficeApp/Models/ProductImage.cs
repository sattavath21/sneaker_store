using System.ComponentModel.DataAnnotations;

public class ProductImage {
  [Key]
  public int ProductImageId {get;set;}//pk label="Product_ Image"
  public String ProductImagePath {get;set;}//label="Product_ Image_ Path"

}//ec

