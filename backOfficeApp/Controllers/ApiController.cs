using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using System.Linq;

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

// [HttpPost]
//     public IActionResult EditDeliveryBranch(DeliveryBranch e)
//     {
//         //update product
//         _db.DeliveryBranch.Update(e);
//         _db.SaveChanges();
//         return Ok(e);
//     }//ef

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
    .Include(p => p.ProductWithSizes)
        .ThenInclude(pws => pws.ShoeSize)
    .Include(p => p.ProductCollection.Brand)
    .Select(p => new
    {
        p.ProductId,
        p.Barcode,
        p.ProductName,
        p.CostPrice,
        p.SellingPrice,
        p.Sku,
        p.Colorway,
        p.Releasedate,
        p.Amountsold,
        p.ProductCollectionId,
        p.ProductCollection,
        p.ProductImageUrl,
        TotalInventoryQty = p.ProductWithSizes.Sum(pws => pws.InventoryQty),
        ProductWithSizes = p.ProductWithSizes  // Include ProductWithSizes here
    })
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

[HttpGet]
    public IActionResult GetProductByBarcodeAdd(string barcode)
    {
        var result = _db.Product.FirstOrDefault(x => x.Barcode == barcode);
        return Ok(result);
    }//ef

[HttpGet]
public IActionResult GetProductByBarcode(string barcode)
{
    var result = _db.Product
        .Where(x => x.Barcode == barcode)
        .Select(x => new
        {
            x.Barcode,
            x.ProductName,
            x.CostPrice,
            x.SellingPrice,
            x.Sku,
            x.Colorway,
            x.Releasedate,
            qty = 1,
            x.Amountsold, // Use directly from Product model
            ProductWithSizes = x.ProductWithSizes.Select(pws => new
            {
                pws.InventoryQty,
                ShoeSize = new
                {
                    pws.ShoeSize.SizeType,
                    pws.ShoeSize.SizeNumber
                }
            }),
            ProductCollection = new
            {
                x.ProductCollection.CollectionName, // Use directly from ProductCollection model
                Brand = new
                {
                    x.ProductCollection.Brand.BrandName // Use directly from Brand model
                }
            },
            x.ProductImageUrl
        })
        .FirstOrDefault();

    if (result == null)
    {
        return Ok(new
        {
            result,
            status = -1
        });
    }
    else
    {
        return Ok(new
        {
            result,
            status = 1
        });
    }
}

[HttpGet]
public IActionResult GetDiscountSelection()
{
    var discounts = _db.Discount.ToList();
    return Ok(discounts);
}


[HttpGet]
public IActionResult GetProductConditionSelection()
{
    var productConditions = _db.BillItem
        .Select(billItem => billItem.ProductCondition)
        .Distinct() // To get unique ProductConditions
        .ToList();

    return Ok(productConditions);
}


[HttpGet]
public IActionResult GetStaffSelection()
{
    var staffList = _db.Staff.ToList();
    return Ok(staffList);
}

[HttpGet]
public IActionResult GetCustomersSelection()
{
    var customerList = _db.Customer.ToList();
    return Ok(customerList);
}

[HttpGet]
public IActionResult GetShippingMethodsSelection()
{
    var shippingMethods = _db.ShippingMethod.ToList();
    return Ok(shippingMethods);
}

[HttpGet]
public IActionResult GetDeliveryServicesSelection()
{
    var deliveryServices = _db.DeliveryService.ToList();
    return Ok(deliveryServices);
}

[HttpGet]
public IActionResult GetBranchesSelection()
{
    var branches = _db.Branch.ToList();
    return Ok(branches);
}

[HttpGet]
public IActionResult GetOrderStatusesSelection()
{
    var statuses = _db.OrderStatus.ToList();
    return Ok(statuses);
}

[HttpPost]
public IActionResult AddSale(Bill bill)
{
    try
    {

        // Assuming other necessary properties are already populated
        var soldProduct = bill.BillItems.Select(x => x.ProductId).ToList();
        
        // Save the bill to the database
        _db.Bill.Add(bill);
        _db.SaveChanges();

        // Optionally, you can return the newly created bill as a response
        return Ok(bill);
    }
    catch (Exception ex)
    {
        // Handle any exceptions that occur during the process
        return StatusCode(500, $"An error occurred: {ex.Message}");
    }
}


    // [HttpGet]
    // public IActionResult ProductByBarcode(string barcode)
    // {
    //     var result = _db.CheckInItem
    //     .Select(x => new
    //     {
    //         checkInItemId = x.CheckInItemId,
    //         productId = x.ProductId,
    //         checkinId = x.CheckinId,
    //         checkinDate = x.Checkin.CheckInDate,
    //         checkinCredit = x.Checkin.CreditTerm,
    //         productName = x.Product.ProductName,
    //         checkInQty = x.CheckInQty,
    //         productCost = x.Product.ProductCost,
    //         productPrice = x.Product.ProductPrice,
    //         productMake = x.Product.ProductMake,
    //         productType = x.Product.ProductType,
    //         productUnit = x.Product.ProductUnit,
    //         productBarcode = x.Product.Barcode

    //     }).FirstOrDefault(x => x.productBarcode == barcode);
    //     if (result == null)
    //     {

    //         return Ok(new
    //         {
    //             result,
    //             status = -1
    //         });
    //     }
    //     else
    //     {
    //         return Ok(new
    //         {
    //             result,
    //             status = 1
    //         });
    //     }
    // }//ef

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
