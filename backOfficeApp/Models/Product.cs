using System.ComponentModel.DataAnnotations;

public class Product {
  [Key]
  public int ProductId {get;set;}//pk label="Product"
  public String Barcode {get;set;}//label="Barcode"
  public String ProductName {get;set;}//label="Product_ Name"
  public int CostPrice {get;set;}//label="Cost_ Price"
  public int SellingPrice {get;set;}//label="Selling_ Price"
  public String Sku {get;set;}//label="S K U"
  public String Colorway {get;set;}//label="Colorway"
  public DateTime Releasedate {get;set;}//label="Release Date"
  public int Amountsold {get;set;}//label="Amount Sold"
  public List<ProductWithSize> ProductWithSizes {get;set;}
//label="Product_ With_ Sizes"
  public int ProductCollectionId {get;set;}//fk="ProductCollection"
  public ProductCollection ProductCollection {get;set;} //np
  public String ProductImageUrl {get;set;}//label="Product_ Image_ Url"

}//ec

