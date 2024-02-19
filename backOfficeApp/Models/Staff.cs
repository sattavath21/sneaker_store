using System.ComponentModel.DataAnnotations;

public class Staff {
  [Key]
  public int StaffId {get;set;}//pk label="Staff"
  public String StaffFirstname {get;set;}//label="Staff_ Firstname"
  public String StaffLastname {get;set;}//label="Staff_ Lastname"
  public DateTime StaffBirthday {get;set;}//label="Staff_ Birthday"
  public String Email {get;set;}//label="Email"
  public String StaffPhoneNumber {get;set;}//label="Staff_ Phone_ Number"
  public int PermissionId {get;set;}//fk="Permission"
  public Permission Permission {get;set;} //np

}//ec

