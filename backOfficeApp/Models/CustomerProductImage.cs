using System.ComponentModel.DataAnnotations;

public class CustomerProductImage {
  [Key]
  public int CustomerProductImageId {get;set;}//pk label="Customer_ Product_ Images"
  public String ProductImage {get;set;}//label="Product_ Image"
  public int ProductSellingId {get;set;}//fk="ProductSelling"
  public ProductSelling ProductSelling {get;set;} //np

}//ec

