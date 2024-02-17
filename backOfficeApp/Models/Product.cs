using System.ComponentModel.DataAnnotations;

public class Product {
  [Key]
  public int ProductId {get;set;}//pk label="Product"
  public String ProductName {get;set;}//label="Product_ Name"
  public int RetailPrice {get;set;}//label="Retail_ Price"
  public int SellingPrice {get;set;}//label="Selling_ Price"
  public String Sku {get;set;}//label="S K U"
  public String Colorway {get;set;}//label="Colorway"
  public String Releasedate {get;set;}//label="Release Date"
  public int Amountsold {get;set;}//label="Amount Sold"
  public List<ProductWithSize> ProductWithSizes {get;set;}
//label="Product_ With_ Sizes"
  public int ProductCollectionId {get;set;}//fk="ProductCollection"
  public ProductCollection ProductCollection {get;set;} //np
  public int ProductImageId {get;set;}//fk="ProductImage"
  public ProductImage ProductImage {get;set;} //np

}//ec

