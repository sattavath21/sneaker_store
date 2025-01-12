using System.ComponentModel.DataAnnotations;

public class Bill {
  [Key]
  public int BillId {get;set;}//pk label="Bill"
  public DateTime OrderDate {get;set;}//label="Order_ Date"
  public int DepositMoney {get;set;}//label="Deposit_ Money"
  public bool IsTransfer {get;set;}//label="Is_ Transfer"
  public int AmountPay {get;set;}//label="Amount_ Pay"
  public int StaffId {get;set;}//fk="Staff"
  public Staff Staff {get;set;} //np
  public List<BillItem> BillItems {get;set;}
//label="Bill_ Items"

}//ec

