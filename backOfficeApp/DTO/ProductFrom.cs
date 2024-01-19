public class ProductFormDTO {

 
  public String Name {get;set;}//label="Name"
  public double Price {get;set;}//label="Price"
  public int ProductTypeId {get;set;}//fk="ProductType"
  //hold the picture file

  public IFormFile Picture {get;set;}

}//ec