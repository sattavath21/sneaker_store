using System.ComponentModel.DataAnnotations;

public class CustomerBankAccount {
  [Key]
  public int CustomerBankAccountId {get;set;}//pk label="Customer_ Bank_ Accounts"
  public int BankId {get;set;}//fk="Bank"
  public Bank Bank {get;set;} //np
  public String AccountName {get;set;}//label="Account_ Name"
  public int AccountNumber {get;set;}//label="Account_ Number"
  public String AccountQr {get;set;}//label="Account_ Qr"
  public int CustomerId {get;set;}//fk="Customer"
  public Customer Customer {get;set;} //np

}//ec

