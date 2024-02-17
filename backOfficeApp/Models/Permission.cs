using System.ComponentModel.DataAnnotations;

public class Permission {
  [Key]
  public int PermissionId {get;set;}//pk label="Permission"
  public String PermissionName {get;set;}//label="Permission_ Name"

}//ec

