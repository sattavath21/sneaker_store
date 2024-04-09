  using System.ComponentModel.DataAnnotations;

  public class Province {
    [Key]
    public int ProvinceId {get;set;}//pk label="Province"
    public String ProvinceName {get;set;}//label="Province_ Name"

  }//ec

