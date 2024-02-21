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
    public IActionResult GetDeliveryServices()
    {
        var list1 = _db.DeliveryService
            .Include(db => db.DeliveryBranches).ThenInclude(db => db.Branch).ThenInclude(db=>db.BranchTelNumbers)
            .ToList();
        return Ok(list1);
    }

// [HttpGet]
// public IActionResult GetDeliveryBranches()
// {
//     var deliveryBranchList = _db.DeliveryBranch
//         .Include(db => db.DeliveryService)
//         .Include(db => db.BranchTelNumbers)
//         .Include(db => db.BranchAddress)
//         .ToList();

//     if (deliveryBranchList == null || deliveryBranchList.Count == 0)
//     {
//         return NotFound();
//     }

//     return Ok(deliveryBranchList);
// }

// [HttpPost]
// public IActionResult AddDeliveryBranches(DeliveryBranch deliveryBranch)
// {
//     // Add validation logic if needed
//     if (deliveryBranch == null)
//     {
//         return BadRequest("Invalid delivery branch data");
//     }

//     try
//     {
//         // Save the delivery branch information to the database
//         _db.DeliveryBranch.Add(deliveryBranch);
//         _db.SaveChanges();

//         return Ok(deliveryBranch);
//     }
//     catch (Exception ex)
//     {
//         // Log the exception for debugging purposes
//         Console.Error.WriteLine(ex);
//         return StatusCode(500, "Internal Server Error");
//     }
// }

[HttpPost]
    public IActionResult EditDeliveryService(DeliveryService e)
    {
        //update product
        _db.DeliveryService.Update(e);
        _db.SaveChanges();
        return Ok(e);
    }//ef

//     [HttpPost]
// public IActionResult DeleteDeliveryBranch(DeliveryBranch d)
// {
//     try
//     {
//         var deliveryBranchToDelete = _db.DeliveryBranch
//             .Include(db => db.DeliveryService)
//             .Include(db => db.BranchTelNumbers)
//             .Include(db => db.BranchAddress)
//             .FirstOrDefault(x => x.DeliveryBranchId == d.DeliveryBranchId);

//         if (deliveryBranchToDelete == null)
//         {
//             return NotFound("Delivery branch not found");
//         }

//         // Remove related entities
//         _db.DeliveryService.RemoveRange(deliveryBranchToDelete.DeliveryService);
//         _db.BranchTelNumber.RemoveRange(deliveryBranchToDelete.BranchTelNumbers);
//         _db.BranchAddress.RemoveRange(deliveryBranchToDelete.BranchAddress);

//         // Remove the delivery branch from the database
//         _db.DeliveryBranch.Remove(deliveryBranchToDelete);
//         _db.SaveChanges();

//         return Ok(new { message = "Delivery branch deleted successfully" });
//     }
//     catch (Exception ex)
//     {
//         // Log the exception for debugging purposes
//         Console.Error.WriteLine(ex);
//         return StatusCode(500, "Internal Server Error");
//     }
// }


[HttpGet]
public IActionResult GetProducts()
{
    var ProductsList = _db.Product
    .Include(db => db.ProductWithSizes)
        .ThenInclude(pws => pws.ShoeSize)
    .Include(db => db.ProductCollection.Brand)  // Include Brand explicitly
    .ToList();


    if (ProductsList == null || ProductsList.Count == 0)
    {
        return NotFound();
    }

    return Ok(ProductsList);
}

[HttpPost]
public IActionResult DeleteProduct(Product p)
{
    try
    {
        var productToDelete = _db.Product
            .Include(db => db.ProductWithSizes)
                .ThenInclude(pws => pws.ShoeSize) // Include ShoeSize for cascading delete
            .Include(db => db.ProductCollection)
                .ThenInclude(pws => pws.Brand) // Include ShoeSize for cascading delete
            .FirstOrDefault(x => x.ProductId == p.ProductId);

        if (productToDelete == null)
        {
            return NotFound("Product not found");
        }

        // Remove the product from the database
        _db.Product.Remove(productToDelete);
        _db.SaveChanges();

        return Ok(new { message = "Product deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

[HttpPost]
    public IActionResult EditProduct(Product p)
    {
        //update product
        _db.Product.Update(p);
        _db.SaveChanges();
        return Ok(p);
    }//ef

     [HttpPost]
public IActionResult AddProduct(Product product)
{
    // Add validation logic if needed
    if (product == null)
    {
        return BadRequest("Invalid product data");
    }

    try
    {
        // Save the product information to the database
        _db.Product.Add(product);
        _db.SaveChanges();

        return Ok(product);
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

// [HttpGet]
// public IActionResult GetProductSellings()
// {
//     var ProductSellingsList = _db.ProductSelling
//     .Include(db => db.OrderStatus)
//     .Include(db => db.ShoeSize)  // Include Brand explicitly
//     .Include(db => db.ProductCondition)
//     .Include(db => db.CustomerProductImages)
//     .Include(db => db.CustomerDefectImages)
//     .Include(db => db.Product)
//     .ToList();


//     if (ProductSellingsList == null || ProductSellingsList.Count == 0)
//     {
//         return NotFound();
//     }

//     return Ok(ProductSellingsList);
// }

[HttpPost]
    public IActionResult AddStaff(Staff c)
    {
        _db.Staff.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpGet]
    public IActionResult GetStaff()
    {
        var list1 = _db.Staff
            .Include(db => db.Permission)
            .ToList();
        return Ok(list1);
    }

    [HttpPost]
    public IActionResult DeleteStaff(Staff c)
    {
        //delete staff 
        _db.Staff.Remove(c);
        _db.SaveChanges();

        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult EditStaff(Staff c)
    {
        //update staff 
        _db.Staff.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef

// [HttpGet]
// public IActionResult GetCustomers()
// {
//     var GetCustomersList = _db.Customer
//     .Include(db => db.CustomerAddresses)
//         .ThenInclude(pws => pws.Address)
//     .Include(db => db.CustomerBankAccounts)  // Include Brand explicitly
//         .ThenInclude(pws => pws.Bank)
//     .Include(db => db.CustomerWishlists)
//         .ThenInclude(pws => pws.Product)
//     .Include(db => db.CustomerWishlists)
//     .ThenInclude(pws => pws.ShoeSize)
//     .ToList();


//     if (GetCustomersList == null || GetCustomersList.Count == 0)
//     {
//         return NotFound();
//     }

//     return Ok(GetCustomersList);
// }

// [HttpGet]
// public IActionResult GetOrders()
// {
//     var GetCustomersList = _db.Bill
//     .Include(db => db.OrderStatus)
//     .Include(db => db.Discount)  // Include Brand explicitly
//     .Include(db => db.DeliveryReceiptPics)
//     .Include(db => db.StoreBranch)
//     .Include(db => db.Customer)
//     .Include(db => db.DeliveryBranch)
//         .ThenInclude(pws => pws.DeliveryService)
//     .Include(db => db.ShippingMethod)
//     .Include(db => db.BillItems)
//         .ThenInclude(pws => pws.ShoeSize)
//     .Include(db => db.BillItems)
//         .ThenInclude(pws => pws.ProductCondition)
//     .Include(db => db.BillItems)
//         .ThenInclude(pws => pws.Product)
//             .ThenInclude(ss => ss.ProductCollection)
//     .ToList();


//     if (GetCustomersList == null || GetCustomersList.Count == 0)
//     {
//         return NotFound();
//     }

//     return Ok(GetCustomersList);
// }

// [HttpGet]
//     public IActionResult GetStatus()
//     {
//         var list1 = _db.OrderStatus.ToList();
//         return Ok(list1);
//     }

// [HttpPost]
// public IActionResult ChangeOrderStatus([FromBody] ChangeOrderStatusRequest request)
// {
//     try
//     {
//         var bill = _db.Bill.Find(request.BillId);
//         if (bill == null)
//         {
//             return NotFound(); // Handle not found scenario
//         }

//         bill.OrderStatusId = request.OrderStatusId;
//         _db.Bill.Update(bill); // Update the bill object
//         _db.SaveChanges();

//         return Ok(bill); // Return updated bill object
//     }
//     catch (Exception ex)
//     {
//         // Log the exception for debugging purposes
//         _logger.LogError(ex, "Error changing order status");
//         return StatusCode(500, "Internal Server Error");
//     }
// }


     #endregion

}//ec
