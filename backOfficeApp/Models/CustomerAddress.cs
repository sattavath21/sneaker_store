using System.ComponentModel.DataAnnotations;

public class CustomerAddress {
  [Key]
  public int CustomerAddressId {get;set;}//pk label="Customer_ Addresses"
  public int AddressId {get;set;}//fk="Address"
  public Address Address {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np

}//ec

