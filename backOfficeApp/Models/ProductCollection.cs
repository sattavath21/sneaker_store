using System.ComponentModel.DataAnnotations;

public class ProductCollection {
  [Key]
  public int ProductCollectionId {get;set;}//pk label="Product_ Collection"
  public String CollectionName {get;set;}//label="Collection_ Name"
  public int BrandId {get;set;}//fk="Brand"
  public Brand Brand {get;set;} //np

}//ec

