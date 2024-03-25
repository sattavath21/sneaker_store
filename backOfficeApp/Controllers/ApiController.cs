using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
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
public IActionResult DeleteProduct(int productIdToDelete)
{
    try
    {
        // Find the product entity to delete based on the ID
        var productToDelete = _db.Product
            .Include(p => p.ProductWithSizes) // Include related ProductWithSize entities
            .FirstOrDefault(x => x.ProductId == productIdToDelete);

        if (productToDelete == null)
        {
            return NotFound("Product not found");
        }

        // Loop through each associated ProductWithSize entry and remove them
        foreach (var productWithSize in productToDelete.ProductWithSizes)
        {
            _db.ProductWithSize.Remove(productWithSize);
        }

        // Remove the product from the database
        _db.Product.Remove(productToDelete);
        _db.SaveChanges();

        return Ok(new { message = "Product and associated ProductWithSize entries deleted successfully" });
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
        // Generate productWithSizes for all shoe sizes
        List<ProductWithSize> productWithSizes = new List<ProductWithSize>();
        for (int i = 1; i <= 35; i++)
        {
            int inventoryQty = (i == product.ProductWithSizes[0].ShoeSizeId) ?
                product.ProductWithSizes[0].InventoryQty : 0;

            // Adjust inventoryQty for selectedShoeSizeId and selectedInventoryQty
            if (i == product.ProductWithSizes[0].ShoeSizeId)
            {
                inventoryQty = product.ProductWithSizes[0].InventoryQty;
            }

            ProductWithSize productWithSize = new ProductWithSize
            {
                InventoryQty = inventoryQty,
                ShoeSizeId = i,
                ProductId = product.ProductId // assuming ProductId is available in product
            };

            productWithSizes.Add(productWithSize);
        }

        // Set the productWithSizes for the product
        product.ProductWithSizes = productWithSizes;

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
public IActionResult GetBranchesSelection(int selectedDeliveryServiceId)
{
    try
    {
        // Assuming _db is your DbContext instance
        var branches = _db.DeliveryBranch
                          .Where(db => db.DeliveryServiceId == selectedDeliveryServiceId)
                          .Select(db => db.Branch)
                          .ToList();

        return Ok(branches);
    }
    catch (Exception ex)
    {
        // Handle exceptions appropriately
        return StatusCode(500, "An error occurred while fetching branches.");
    }
}

    [HttpGet]
    public IActionResult GetOrderStatusesSelection()
    {
        var statuses = _db.OrderStatus.ToList();
        return Ok(statuses);
    }

    {

                if (productWithSize != null)
                {
                    // Deduct itemQty from inventoryQty
                    productWithSize.InventoryQty -= item.ItemQty;
                    _db.SaveChanges();
                }
            }

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
    public IActionResult EditStatus(Bill c)
    {
        //update staff 
        _db.Bill.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef    
    
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





    [HttpGet]
public IActionResult Report1(string month, int year)
{
    IQueryable<BillItem> query = _db.BillItem
                                      .Include(x => x.Product)
                                      .ThenInclude(p => p.Brand)
                                      .Include(x => x.ShoeSize) // Include ShoeSize
                                      .Where(x => x.Bill.OrderDate.Year == year); // Filter by year

    if (!string.IsNullOrEmpty(month))
    {
        // Convert month name to month number
        int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
        query = query.Where(x => x.Bill.OrderDate.Month == monthNumber); // Filter by month
    }

    var sales = query.GroupBy(x => new { x.Product.Brand.BrandName, x.ShoeSize.SizeType, x.ShoeSize.SizeNumber })
                     .Select(g => new
                     {
                         name = $"{g.Key.BrandName} - Size {g.Key.SizeType} {g.Key.SizeNumber}",
                         sale = g.Sum(s => s.Product.SellingPrice * s.ItemQty),
                     })
                     .ToList();

    // Compute the most profitable brand
    string mostProfitableBrand = null;
    decimal maxSales = 0;

    foreach (var brandSale in sales)
    {
        if (brandSale.sale > maxSales)
        {
            maxSales = brandSale.sale;
            mostProfitableBrand = brandSale.name;
        }
    }

    var result = new
    {
        sales,
        mostProfitableBrand,
        maxSales
    };

    return Ok(result);
}



    [HttpGet]
    public IActionResult Report2(string month, int year)
    {
        IQueryable<BillItem> query = _db.BillItem
                                          .Include(x => x.Product)
                                          .Where(x => x.Bill.OrderDate.Year == year); // Filter by year

        if (!string.IsNullOrEmpty(month))
        {
            // Convert month name to month number
            int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
            query = query.Where(x => x.Bill.OrderDate.Month == monthNumber); // Filter by month
        }

        var sales = query.GroupBy(x => x.Product.ProductName)
                         .Select(g => new
                         {
                             name = g.Key,
                             saleQty = g.Sum(s => s.ItemQty),
                         })
                         .ToList();

        return Ok(sales);
    }



   [HttpGet]
public IActionResult Report3(string month, int year)
{
    IQueryable<BillItem> query = _db.BillItem
                                      .Include(x => x.Product)
                                      .Include(x => x.ShoeSize) // Include ShoeSize
                                      .Where(x => x.Bill.OrderDate.Year == year); // Filter by year

    if (!string.IsNullOrEmpty(month))
    {
        // Convert month name to month number
        int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
        query = query.Where(x => x.Bill.OrderDate.Month == monthNumber); // Filter by month
    }

    var sales = query.GroupBy(x => new { x.Product.ProductName, x.ShoeSize.SizeType, x.ShoeSize.SizeNumber })
                     .Select(g => new
                     {
                         name = $"{g.Key.ProductName} - Size {g.Key.SizeType} {g.Key.SizeNumber}",
                         sale = g.Sum(s => s.Product.SellingPrice * s.ItemQty),
                     })
                     .ToList();

    // Compute the most profitable product
    string mostProfitableProduct = null;
    decimal maxSales = 0;

    foreach (var productSale in sales)
    {
        if (productSale.sale > maxSales)
        {
            maxSales = productSale.sale;
            mostProfitableProduct = productSale.name;
        }
    }

    var result = new
    {
        sales,
        mostProfitableProduct,
        maxSales
    };

    return Ok(result);
}





    [HttpGet]
public IActionResult Report4(string month, int year)
{
    IQueryable<BillItem> query = _db.BillItem
                                      .Include(p => p.Bill)
                                      .ThenInclude(st => st.Customer)
                                      .Where(x => x.Bill.OrderDate.Year == year); // Filter by year

    if (!string.IsNullOrEmpty(month))
    {
        // Convert month name to month number
        int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
        query = query.Where(x => x.Bill.OrderDate.Month == monthNumber); // Filter by month
    }

    var sales = query.GroupBy(x => new { 
                            x.Bill.Customer.CustomerFirstname, 
                            x.Bill.Customer.CustomerLastname, 
                            x.Bill.Customer.Gender 
                        })
                     .Select(g => new
                     {
                         name = $"{g.Key.CustomerFirstname} {g.Key.CustomerLastname} ({g.Key.Gender})",
                         sale = g.Sum(s => s.Product.SellingPrice * s.ItemQty),
                         gender = g.Key.Gender
                     })
                     .ToList();

    // Compute the total sales for each gender
    var totalSalesByGender = sales.GroupBy(x => x.gender)
                                   .Select(g => new
                                   {
                                       gender = g.Key,
                                       totalSales = g.Sum(s => s.sale)
                                   })
                                   .ToList();

    // Find the most purchased gender
    var mostPurchasedGender = totalSalesByGender.OrderByDescending(x => x.totalSales)
                                                .FirstOrDefault();

    return Ok(new { mostPurchasedGender, sales });
}



    [HttpGet]
    public IActionResult Report5(int year)
    {
        CultureInfo cultureInfo = new CultureInfo("en-US"); // Set culture to English (United States)

        var sales = _db.BillItem
                        .Include(x => x.Product)
                        .Where(x => x.Bill.OrderDate.Year == year) // Filter by year
                        .GroupBy(x => new { x.Bill.OrderDate.Month, x.Bill.OrderDate.Day }) // Group by month and day
                        .Select(g => new
                        {
                            date = new DateTime(year, g.Key.Month, g.Key.Day).ToString("MMMM-dd", cultureInfo), // Create a string representation of month name and day
                            totalSale = g.Sum(s => s.Product.SellingPrice * s.ItemQty),
                        })
                        .ToList();

        return Ok(sales);
    }

[HttpGet]
public async Task<IActionResult> GetStaffId(string userEmail)
{
    try
    {

        var staff = await _db.Staff.SingleOrDefaultAsync(s => s.Email == userEmail);
        if (staff == null)
        {
            return NotFound("Staff not found for the provided email");
        }
        return Ok(staff.StaffId);
    }
    catch (Exception ex)
    {
        return StatusCode(500, $"Internal server error: {ex.Message}");
    }
}
    #endregion

}//ec
