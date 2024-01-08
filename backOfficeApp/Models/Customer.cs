using System.ComponentModel.DataAnnotations;

public class Customer {
  [Key]
  public int CustomerId {get;set;}//pk label="Customer"
  public String FirstName {get;set;}//label="First_ Name"
  public String LastName {get;set;}//label="Last_ Name"
  public DateTime DateOfBirth {get;set;}//label="Date_ Of_ Birth"
  public String Phone {get;set;}//label="Phone"
  public String Email {get;set;}//label="Email"
  public int CustomerAddressId {get;set;}//fk="CustomerAddress"
  public CustomerAddress CustomerAddress {get;set;} //np

}//ec

