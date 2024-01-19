using System.ComponentModel.DataAnnotations;

public class CustomerDefectImage {
  [Key]
  public int CustomerDefectImageId {get;set;}//pk label="Customer_ Defect_ Images"
  public String DefectImage {get;set;}//label="Defect_ Image"
  public int ProductSellingId {get;set;}//fk="ProductSelling"
  public ProductSelling ProductSelling {get;set;} //np

}//ec

