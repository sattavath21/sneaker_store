using System.ComponentModel.DataAnnotations;

public class Product {
  [Key]
  public int ProductId {get;set;}//pk label="Product"
  public String Name {get;set;}//label="Name"
  public int StorePrice {get;set;}//label="Store_ Price"
  public int LowestSellingPrice {get;set;}//label="Lowest_ Selling_ Price"
  public String Sku {get;set;}//label="S K U"
  public String Colorway {get;set;}//label="Colorway"
  public DateTime ReleaseDate {get;set;}//label="Release_ Date"
  public int AmountSold {get;set;}//label="Amount_ Sold"
  public List<ProductWithSize> ProductWithSizes {get;set;}
//label="Product_ With_ Sizes"
  public int ProductCollectionId {get;set;}//fk="ProductCollection"
  public ProductCollection ProductCollection {get;set;} //np
  public int ProductCatId {get;set;}//fk="ProductCat"
  public ProductCat ProductCat {get;set;} //np
  public List<ProductImage> ProductImages {get;set;}
//label="Product_ Images"

}//ec

