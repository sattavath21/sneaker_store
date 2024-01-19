using System.ComponentModel.DataAnnotations;

public class Customer {
  [Key]
  public int CustomerId {get;set;}//pk label="Customer"
  public String FirstName {get;set;}//label="First_ Name"
  public String LastName {get;set;}//label="Last_ Name"
  public int Age {get;set;}//label="Age"
  public DateTime Birthday {get;set;}//label="Birthday"
  public String Email {get;set;}//label="Email"
  public bool VacationMode {get;set;}//label="Vacation_ Mode"
  public bool EmailSubscription {get;set;}//label="Email_ Subscription"
  public int DefaultAddress {get;set;}//label="Default_ Address"
  public List<CustomerAddress> CustomerAddresses {get;set;}
//label="Customer_ Addresses"
  public List<CustomerBankAccount> CustomerBankAccounts {get;set;}
//label="Customer_ Bank_ Accounts"
  public List<CustomerWishlist> CustomerWishlists {get;set;}
//label="Customer_ Wishlists"
  public List<ProductSelling> ProductSellings {get;set;}
//label="Product_ Sellings"

}//ec

