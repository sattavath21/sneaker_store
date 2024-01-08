using System.ComponentModel.DataAnnotations;

public class Staff {
  [Key]
  public int StaffId {get;set;}//pk label="Staff"
  public String FirstName {get;set;}//label="First_ Name"
  public String LastName {get;set;}//label="Last_ Name"
  public String Phone {get;set;}//label="Phone"

}//ec

