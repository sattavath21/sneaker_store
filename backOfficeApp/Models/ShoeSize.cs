using System.ComponentModel.DataAnnotations;

public class ShoeSize {
  [Key]
  public int ShoeSizeId {get;set;}//pk label="Shoe_ Size"
  public String SizeType {get;set;}//label="Size_ Type"
  public double SizeNumber {get;set;}//label="Size_ Number"

}//ec

