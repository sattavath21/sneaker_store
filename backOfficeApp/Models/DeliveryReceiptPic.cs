using System.ComponentModel.DataAnnotations;

public class DeliveryReceiptPic {
  [Key]
  public int DeliveryReceiptPicId {get;set;}//pk label="Delivery_ Receipt_ Pics"
  public String PicString {get;set;}//label="Pic_ String"
  public int BillId {get;set;}//fk="Bill"
  public Bill Bill {get;set;} //np

}//ec

