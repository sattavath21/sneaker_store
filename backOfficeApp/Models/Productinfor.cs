using System.ComponentModel.DataAnnotations;

public class Productinfor {
  [Key]
  public int ProductinforId {get;set;}//pk label="Product Infor"
  public String ProductUnit {get;set;}//label="Product_ Unit"
  public String ProductMake {get;set;}//label="Product_ Make"
  public String ProductType {get;set;}//label="Product_ Type"

}//ec

