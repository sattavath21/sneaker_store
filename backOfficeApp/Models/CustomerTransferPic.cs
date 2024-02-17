using System.ComponentModel.DataAnnotations;

public class CustomerTransferPic {
  [Key]
  public int CustomerTransferPicId {get;set;}//pk label="Customer_ Transfer_ Pics"
  public String PicPath {get;set;}//label="Pic_ Path"

}//ec

