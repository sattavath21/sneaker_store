using System.ComponentModel.DataAnnotations;

public class Customer {
  [Key]
  public int CustomerId {get;set;}//pk label="Customer"
  public String Firstname {get;set;}//label="First Name"
  public String Lastname {get;set;}//label="Last Name"
  public int Age {get;set;}//label="Age"
  public String Birthday {get;set;}//label="Birthday"
  public String Email {get;set;}//label="Email"
  public  Vacationmode {get;set;}//label="Vacation Mode"
  public int Emailsubscribtion {get;set;}//label="Email Subscribtion"
  public  Defaultaddress {get;set;}//label="Default Address"
  public List<Customeraddress> Customeraddresses {get;set;}
//label="Customer Addresses"
  public List<Customerbankaccount> Customerbankaccounts {get;set;}
//label="Customer Bank Accounts"
  public List<Customerwishlist> Customerwishlists {get;set;}
//label="Customer Wishlists"
  public List<Productselling> Productsellings {get;set;}
//label="Product Sellings"

}//ec

