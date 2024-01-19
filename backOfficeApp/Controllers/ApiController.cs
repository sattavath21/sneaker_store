using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/[action]")]
public class ApiController : ControllerBase
{
    private readonly ILogger<ApiController> _logger;
    private IWebHostEnvironment _host;
    private BackofficeappDbContext _db;

    public ApiController(ILogger<ApiController> logger, BackofficeappDbContext db, IWebHostEnvironment host)
    {
        _logger = logger;
        _db = db;
        _host = host;
    }


    #region ACTIONS

[HttpGet]
public IActionResult GetDeliveryBranches()
{
    var deliveryBranchList = _db.DeliveryBranch
        .Include(db => db.DeliveryService)
        .Include(db => db.BranchTelNumbers)
        .Include(db => db.BranchAddress)
        .ToList();

    if (deliveryBranchList == null || deliveryBranchList.Count == 0)
    {
        return NotFound();
    }

    return Ok(deliveryBranchList);
}

[HttpPost]
public IActionResult AddDeliveryBranches(DeliveryBranch deliveryBranch)
{
    // Add validation logic if needed
    if (deliveryBranch == null)
    {
        return BadRequest("Invalid delivery branch data");
    }

    try
    {
        // Save the delivery branch information to the database
        _db.DeliveryBranch.Add(deliveryBranch);
        _db.SaveChanges();

        return Ok(deliveryBranch);
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

[HttpPost]
    public IActionResult EditDeliveryBranch(DeliveryBranch e)
    {
        //update product
        _db.DeliveryBranch.Update(e);
        _db.SaveChanges();
        return Ok(e);
    }//ef

    [HttpPost]
public IActionResult DeleteDeliveryBranch(DeliveryBranch d)
{
    try
    {
        var deliveryBranchToDelete = _db.DeliveryBranch
            .Include(db => db.DeliveryService)
            .Include(db => db.BranchTelNumbers)
            .Include(db => db.BranchAddress)
            .FirstOrDefault(x => x.DeliveryBranchId == d.DeliveryBranchId);

        if (deliveryBranchToDelete == null)
        {
            return NotFound("Delivery branch not found");
        }

        // Remove the delivery branch from the database
        _db.DeliveryBranch.Remove(deliveryBranchToDelete);
        _db.SaveChanges();

        return Ok(new { message = "Delivery branch deleted successfully" });
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
