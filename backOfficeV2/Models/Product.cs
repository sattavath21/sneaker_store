using System.ComponentModel.DataAnnotations;

public class Product {
  [Key]
  public int ProductId {get;set;}//pk label="Product"
  public String Barcode {get;set;}//label="Barcode"
  public int ProductNameId {get;set;}//fk="ProductName"
  public ProductName ProductName {get;set;} //np
  public String ProductImagePath {get;set;}//label="Product_ Image_ Path"
  public int CostPrice {get;set;}//label="Cost_ Price"
  public int SellingPrice {get;set;}//label="Selling_ Price"
  public String Sku {get;set;}//label="S K U"
  public int ShoeSizeId {get;set;}//fk="ShoeSize"
  public ShoeSize ShoeSize {get;set;} //np
  public int BrandId {get;set;}//fk="Brand"
  public Brand Brand {get;set;} //np
  public String ConditionDescription {get;set;}//label="Condition_ Description"
  public String BoxDescription {get;set;}//label="Box_ Description"
  public bool IsSold {get;set;}//label="Is_ Sold"

}//ec

