using System.ComponentModel.DataAnnotations;

public class Collection {
  [Key]
  public int CollectionId {get;set;}//pk label="Collection"
  public String CollectionName {get;set;}//label="Collection_ Name"

}//ec

