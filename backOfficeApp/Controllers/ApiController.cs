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
    public IActionResult GetProducts()
    {
        var ProductsList = _db.Product
        .Include(p => p.ProductWithSizes)
            .ThenInclude(pws => pws.ShoeSize)
        .Include(p => p.Brand)
        .Include(p => p.Collection)
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
            p.BrandId,
            p.Brand,
            p.CollectionId,
            p.Collection,
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
                .Include(db => db.Collection)
                .Include(db => db.Brand)
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
        // if (product == null)
        // {
        //     return BadRequest("Invalid product data");
        // }

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
                x.ProductId, // Include the productId property
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
                    pws.ProductWithSizeId, // Include ProductWithSizeId property
                    pws.InventoryQty,
                    ShoeSize = new
                    {
                        pws.ShoeSizeId, // Include the ShoeSizeId property
                        pws.ShoeSize.SizeType,
                        pws.ShoeSize.SizeNumber
                    }
                }),
                Brand = new
                {
                    x.Brand.BrandName // Use directly from Brand model
                },
                Collection = new
                {
                    x.Collection.CollectionName // Use directly from Collection model

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
    public IActionResult GetCollections()
    {
        var colections = _db.Collection.ToList();
        return Ok(colections);
    }

    [HttpGet]
    public IActionResult GetBrands()
    {
        var brands = _db.Brand.ToList();
        return Ok(brands);
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
        bill.OrderDate = DateTime.Now;

        // Save the bill to the database
        _db.Bill.Add(bill);
        _db.SaveChanges();

        // Update inventory quantities
        foreach (var item in bill.BillItems)
        {
            // Fetch the ProductWithSize entity associated with the current BillItem
            var productWithSize = _db.ProductWithSize
                .Include(pws => pws.Product)
                .FirstOrDefault(pws => pws.ProductId == item.ProductId && pws.ShoeSizeId == item.ShoeSizeId);
            
            if (productWithSize != null)
            {
                // Deduct itemQty from inventoryQty
                productWithSize.InventoryQty -= item.ItemQty;
                _db.SaveChanges();
            }
        }

        // Return the newly created bill as a response
        return Ok(bill);
    }
    catch (Exception ex)
    {
        // Log any errors
        Console.WriteLine(ex.Message);

        // Return an error response
        return StatusCode(500, "An error occurred while adding sale");
    }
}







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

    [HttpGet]
    public IActionResult GetShoeSizes()
    {
        var list1 = _db.ShoeSize
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

    [HttpPost]
    public IActionResult EditStatus(Bill c)
    {
        //update staff 
        _db.Bill.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef



    #endregion

}//ec
