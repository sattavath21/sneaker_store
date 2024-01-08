using System.ComponentModel.DataAnnotations;

public class Supplier {
  [Key]
  public int SupplierId {get;set;}//pk label="Supplier"
  public String SupplierName {get;set;}//label="Supplier_ Name"
  public String SupplierPhone {get;set;}//label="Supplier_ Phone"
  public String SupplierEmail {get;set;}//label="Supplier_ Email"
  public int SupplierAddressId {get;set;}//fk="SupplierAddress"
  public SupplierAddress SupplierAddress {get;set;} //np

}//ec

