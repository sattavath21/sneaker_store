using System.ComponentModel.DataAnnotations;

public class Sale {
  [Key]
  public int SaleId {get;set;}//pk label="Sale"
  public DateTime Date {get;set;}//label="Date"
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np
  public List<SaleItem> SaleItems {get;set;}
//label="Sale_ Items"

}//ec

