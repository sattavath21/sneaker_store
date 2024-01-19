using System.ComponentModel.DataAnnotations;

public class Bank {
  [Key]
  public int BankId {get;set;}//pk label="Bank"
  public String BankName {get;set;}//label="Bank_ Name"

}//ec

