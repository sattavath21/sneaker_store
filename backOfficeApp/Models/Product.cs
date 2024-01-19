using System.ComponentModel.DataAnnotations;

public class Product {
  [Key]
  public int ProductId {get;set;}//pk label="Product"
  public String Name {get;set;}//label="Name"
  public int Storeprice {get;set;}//label="Store Price"
  public int Lowestsellingprice {get;set;}//label="Lowest Selling Price"
  public String Sku {get;set;}//label="S K U"
  public String Colorway {get;set;}//label="Colorway"
  public String Releasedate {get;set;}//label="Release Date"
  public int Amountsold {get;set;}//label="Amount Sold"
  public List<Productwithsize> Productwithsizes {get;set;}
//label="Product With Sizes"
  public int ProductcollectionId {get;set;}//fk="Productcollection"
  public Productcollection Productcollection {get;set;} //np
  public int ProductcatId {get;set;}//fk="Productcat"
  public Productcat Productcat {get;set;} //np
  public List<Productimage> Productimages {get;set;}
//label="Product Images"

}//ec

