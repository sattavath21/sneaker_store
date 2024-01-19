using System.ComponentModel.DataAnnotations;

public class ShippingMethod {
  [Key]
  public int ShippingMethodId {get;set;}//pk label="Shipping_ Method"
  public String MethodName {get;set;}//label="Method_ Name"

}//ec

