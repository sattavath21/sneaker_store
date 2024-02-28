using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("myapi/[action]")]
public class MyApiController : ControllerBase
{
    private readonly ILogger<MyApiController> _logger;
    private BackofficeappDbContext _db;

    public MyApiController(ILogger<MyApiController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }


    #region ACTIONS

    [HttpGet]
    public IActionResult GetDeliveryServices()
    {
        var list1 = _db.DeliveryService
            .Include(db => db.DeliveryBranches).ThenInclude(db => db.Branch).ThenInclude(db=>db.BranchTelNumbers)
            .ToList();
        return Ok(list1);
    }
[HttpPost]
public IActionResult AddDeliveryService(DeliveryService newDeliveryService)
{

    _db.DeliveryService.Add(newDeliveryService);
     _db.SaveChanges();
        return Ok(newDeliveryService);
  
}


[HttpPost]
    public IActionResult EditDeliveryService(DeliveryService e)
    {
        //update product
        _db.DeliveryService.Update(e);
        _db.SaveChanges();
        return Ok(e);
    }//ef

    [HttpPost]
public IActionResult DeleteDeliveryBranch(DeliveryBranch d)
{
    try
    {
        var deliveryBranchToDelete = _db.DeliveryBranch
            .FirstOrDefault(x => x.DeliveryBranchId == d.DeliveryBranchId);

        if (deliveryBranchToDelete == null)
        {
            return NotFound("Delivery not found");
        }

        // Remove the product from the database
        _db.DeliveryBranch.Remove(deliveryBranchToDelete);
        _db.SaveChanges();

        return Ok(new { message = "Delivery deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

[HttpPost]
public IActionResult AddBranch(Branch newBranch, int deliveryServiceId)
{
    try
    {
        // Add the new branch to the Branch table
        _db.Branch.Add(newBranch);
        _db.SaveChanges();

        // Create a new DeliveryBranch object and associate it with the new branch and delivery service
        var deliveryBranch = new DeliveryBranch
        {
            BranchId = newBranch.BranchId,
            DeliveryServiceId = deliveryServiceId
        };

        // Add the new delivery branch to the DeliveryBranch table
        _db.DeliveryBranch.Add(deliveryBranch);
        _db.SaveChanges();

        return Ok(newBranch);
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}


    
 
 [HttpGet]
public IActionResult GetBills()
{
    var billList = _db.Bill
    .Include(b => b.OrderStatus)
    .Include(b => b.ShippingMethod)
    .Include(b => b.Discount)
    .Include(b => b.DeliveryService)
    .Include(b => b.Branch)
    .Include(b => b.Staff)
    .Include(b => b.Customer)
    .Include(b => b.BillItems)
      .ThenInclude(b=>b.ShoeSize)
    .Include(b => b.BillItems)
      .ThenInclude(b=>b.ProductCondition)
    .Include(b => b.BillItems)
      .ThenInclude(b=>b.Product)
    .ToList();

    return Ok(billList);
}

 [HttpGet]
public IActionResult GetDiscounts()
{
    var discountList = _db.Discount
    .Include(d=>d.ShippingMethod)
    
    .ToList();

    return Ok(discountList);
}
[HttpPost]
    public IActionResult EditDiscount(Discount d)
    {
        //update product
        _db.Discount.Update(d);
        _db.SaveChanges();
        return Ok(d);
    }//ef
[HttpPost]
    public IActionResult AddDiscount(Discount d)
    {
        _db.Discount.Add(d);
        _db.SaveChanges();
        return Ok(d);

    }//ef
[HttpPost]
public IActionResult DeleteDiscount(Discount d)
{
    try
    {
        var discountToDelete = _db.Discount
            .FirstOrDefault(x => x.DiscountId == d.DiscountId);

        if (discountToDelete == null)
        {
            return NotFound("Discount not found");
        }

        // Remove the product from the database
        _db.Discount.Remove(discountToDelete);
        _db.SaveChanges();

        return Ok(new { message = "Discount deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}
    #endregion

}//ec