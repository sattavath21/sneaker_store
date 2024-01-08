using System.ComponentModel.DataAnnotations;

public class Product {
  [Key]
  public int ProductId {get;set;}//pk label="Product"
  public String Barcode {get;set;}//label="Barcode"
  public String ProductName {get;set;}//label="Product_ Name"
  public String ProductDescription {get;set;}//label="Product_ Description"
  public String ProductType {get;set;}//label="Product_ Type"
  public String ProductUnit {get;set;}//label="Product_ Unit"
  public int ProductPrice {get;set;}//label="Product_ Price"
  public int ProductCost {get;set;}//label="Product_ Cost"
  public String ProductMake {get;set;}//label="Product_ Make"
  public String ProductModelno {get;set;}//label="Product_ Model No"
  public int SupplierId {get;set;}//fk="Supplier"
  public Supplier Supplier {get;set;} //np

}//ec

