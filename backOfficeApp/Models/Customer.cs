using System.ComponentModel.DataAnnotations;

public class Customer {
  [Key]
  public int CustomerId {get;set;}//pk label="Customer"
  public String CustomerFirstname {get;set;}//label="Customer_ First Name"
  public String CustomerLastname {get;set;}//label="Customer_ Last Name"
  public String CustomerBirthday {get;set;}//label="Customer_ Birthday"
  public String CustomerPhoneNumber {get;set;}//label="Customer_ Phone_ Number"
  public String CustomerSocialLink {get;set;}//label="Customer_ Social_ Link"
  public String Gender {get;set;}//label="Gender"
  public String Email {get;set;}//label="Email"

}//ec

