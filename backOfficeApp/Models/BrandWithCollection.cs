using System.ComponentModel.DataAnnotations;

public class BrandWithCollection {
  [Key]
  public int BrandWithCollectionId {get;set;}//pk label="Brand_ With_ Collections"
  public int CollectionId {get;set;}//fk="Collection"
  public Collection Collection {get;set;} //np
  public int BrandId {get;set;}//fk="Brand"
  public Brand Brand {get;set;} //np

}//ec

