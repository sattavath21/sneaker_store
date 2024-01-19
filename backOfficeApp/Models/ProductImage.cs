using System.ComponentModel.DataAnnotations;

public class ProductImage {
  [Key]
  public int ProductImageId {get;set;}//pk label="Product_ Images"
  public String ProductImageUrl {get;set;}//label="Product_ Image_ Url"
  public int ProductId {get;set;}//fk="Product"
  public Product Product {get;set;} //np

}//ec

