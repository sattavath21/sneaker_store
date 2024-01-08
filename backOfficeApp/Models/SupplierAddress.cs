using System.ComponentModel.DataAnnotations;

public class SupplierAddress {
  [Key]
  public int SupplierAddressId {get;set;}//pk label="Supplier_ Address"
  public int No {get;set;}//label="No"
  public String Street {get;set;}//label="Street"
  public String Amphur {get;set;}//label="Amphur"
  public String Province {get;set;}//label="Province"
  public String PostalCode {get;set;}//label="Postal_ Code"

}//ec

