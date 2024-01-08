using System.ComponentModel.DataAnnotations;

public class CustomerAddress {
  [Key]
  public int CustomerAddressId {get;set;}//pk label="Customer_ Address"
  public String No {get;set;}//label="No"
  public String Street {get;set;}//label="Street"
  public String City {get;set;}//label="City"
  public String Zip {get;set;}//label="Zip"

}//ec

