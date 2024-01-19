using System.ComponentModel.DataAnnotations;

public class ProductCondition {
  [Key]
  public int ProductConditionId {get;set;}//pk label="Product_ Condition"
  public String ConditionName {get;set;}//label="Condition_ Name"

}//ec

