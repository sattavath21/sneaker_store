using System.ComponentModel.DataAnnotations;

public class Address {
  [Key]
  public int AddressId {get;set;}//pk label="Address"
  public String SellerName {get;set;}//label="Seller_ Name"
  public int SellerTelNumber {get;set;}//label="Seller_ Tel_ Number"
  public String Province {get;set;}//label="Province"
  public String City {get;set;}//label="City"
  public String Village {get;set;}//label="Village"
  public String AddressDetail {get;set;}//label="Address_ Detail"
  public int PostCode {get;set;}//label="Post_ Code"

}//ec

