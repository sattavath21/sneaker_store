using System.ComponentModel.DataAnnotations;

public class Checkin {
  [Key]
  public int CheckinId {get;set;}//pk label="Check In"
  public int CreditTerm {get;set;}//label="Credit_ Term"
  public DateTime CheckInDate {get;set;}//label="Check_ In_ Date"
  public int StaffId {get;set;}//fk="Staff"
  public Staff Staff {get;set;} //np
  public List<CheckInItem> CheckInItems {get;set;}
//label="Check_ In_ Items"

}//ec

