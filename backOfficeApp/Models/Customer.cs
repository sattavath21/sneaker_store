using System.ComponentModel.DataAnnotations;

public class Customer {
  [Key]
  public int CustomerId {get;set;}//pk label="Customer"
  public String CustomerFirstname {get;set;}//label="Customer_ Firstname"
  public String CustomerLastname {get;set;}//label="Customer_ Lastname"
  public String Gender {get;set;}//label="Gender"
  public DateTime CustomerBirthday {get;set;}//label="Customer_ Birthday"
  public String Email {get;set;}//label="Email"
  public String CustomerPhoneNumber {get;set;}//label="Customer_ Phone_ Number"
  public String CustomerSocialLink {get;set;}//label="Customer_ Social_ Link"

}//ec

