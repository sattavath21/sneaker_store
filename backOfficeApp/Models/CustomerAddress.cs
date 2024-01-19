using System.ComponentModel.DataAnnotations;

public class Customeraddress {
  [Key]
  public int CustomeraddressId {get;set;}//pk label="Customer Addresses"
  public int AddressId {get;set;}//fk="Address"
  public Address Address {get;set;} //np
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np

}//ec

