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
    private Backofficev2DbContext _db;

    public ApiController(ILogger<ApiController> logger, Backofficev2DbContext db, IWebHostEnvironment host)
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
        .Include(p => p.ProductName)
        .Include(p => p.ShoeSize)
        .Include(p => p.Brand)
        .Where(p => p.IsSold == false) // Only include unsold products
        .Select(p => new
        {
            p.ProductId,
            p.Barcode,
            p.ProductNameId,
            p.ProductName,
            p.CostPrice,
            p.SellingPrice,
            p.Sku,

            p.ShoeSizeId,
            p.ShoeSize,
            p.BrandId,
            p.Brand,
            p.ConditionDescription,
            p.BoxDescription,
            p.ProductImagePath,
        })
        .ToList();


        if (ProductsList == null || ProductsList.Count == 0)
        {
            return NotFound();
        }

        return Ok(ProductsList);
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
    public IActionResult EditShoeSize(ShoeSize s)
    {
        //update product
        _db.ShoeSize.Update(s);
        _db.SaveChanges();
        return Ok(s);
    }//ef

    [HttpPost]
    public IActionResult EditProductName(ProductName p)
    {
        //update product
        _db.ProductName.Update(p);
        _db.SaveChanges();
        return Ok(p);
    }//ef

    [HttpPost]
    public IActionResult EditBrand(Brand b)
    {
        //update product
        _db.Brand.Update(b);
        _db.SaveChanges();
        return Ok(b);
    }//ef

    [HttpGet]
    public IActionResult GetProductByBarcode(string barcode)
    {
        var result = _db.Product
            .Where(p => p.Barcode == barcode && p.IsSold == false) // Check if IsSold is false (0)
            .Select(p => new
            {
            p.ProductId,
            p.Barcode,
            ProductName = new
                {
                    p.ProductName.Name // Use directly from Collection model

                },
                p.ProductImagePath,
            p.CostPrice,
            p.SellingPrice,
            p.Sku,
            ShoeSize = new
                {
                    p.ShoeSize.SizeType, // Use directly from Collection model
                    p.ShoeSize.SizeNumber, // Use directly from Collection model
                },
            Brand = new
                {
                    p.Brand.BrandName, // Use directly from Collection model
                    p.Brand.BrandLogoUrl // Use directly from Collection model
                },
            p.ConditionDescription,
            p.BoxDescription
            
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
public IActionResult GetProductBySearchName(string searchProductName)
{

    try
    {
        var result = _db.Product
            .Where(p => p.ProductName.Name == searchProductName)
            .Select(p => new
            {
                p.ProductId,
            p.Barcode,
            ProductName = new
                {
                    p.ProductName.Name // Use directly from Collection model

                },
                p.ProductImagePath,
            p.CostPrice,
            p.SellingPrice,
            p.Sku,
            ShoeSize = new
                {
                    p.ShoeSize.SizeType, // Use directly from Collection model
                    p.ShoeSize.SizeNumber, // Use directly from Collection model
                },
            Brand = new
                {
                    p.Brand.BrandName, // Use directly from Collection model
                    p.Brand.BrandLogoUrl // Use directly from Collection model
                },
            p.ConditionDescription,
            p.BoxDescription


            })
            .FirstOrDefault();

        if (result != null)
        {
            return Ok(new
            {
                result,
                status = 1
            });
        }
        else
        {
            return Ok(new
            {
                result,
                status = -1
            });
        }
    }
    catch (Exception ex)
    {
        // Log the exception for troubleshooting
        Console.WriteLine($"Error in GetProductBySearchName: {ex.Message}");
        return StatusCode(500, "Internal Server Error");
    }
}

     [HttpPost]
public IActionResult DeleteProduct(int productIdToDelete)
{
    try
    {
        // Find the product entity based on ProductId
        var productToDelete = _db.Product
            .FirstOrDefault(x => x.ProductId == productIdToDelete);

        if (productToDelete == null)
        {
            return NotFound("Product not found");
        }



        // Delete the Product first
        _db.Product.Remove(productToDelete);

        // Save changes to the database
        _db.SaveChanges();

        return Ok(new { message = "Product and associated Product deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

 [HttpPost]
public IActionResult DeleteShoeSize(int shoeSizeIdToDelete)
{
    try
    {
        // Find the product entity based on ProductId
        var shoeSizeToDelete = _db.ShoeSize
            .FirstOrDefault(x => x.ShoeSizeId == shoeSizeIdToDelete);

        if (shoeSizeToDelete == null)
        {
            return NotFound("Product not found");
        }



        // Delete the Product first
        _db.ShoeSize.Remove(shoeSizeToDelete);

        // Save changes to the database
        _db.SaveChanges();

        return Ok(new { message = "Shoe size deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

 [HttpPost]
public IActionResult DeleteBrand(int brandIdToDelete)
{
    try
    {
        // Find the product entity based on ProductId
        var brandToDelete = _db.Brand
            .FirstOrDefault(x => x.BrandId == brandIdToDelete);

        if (brandToDelete == null)
        {
            return NotFound("Product not found");
        }



        // Delete the Product first
        _db.Brand.Remove(brandToDelete);

        // Save changes to the database
        _db.SaveChanges();

        return Ok(new { message = "Brand deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}

 [HttpPost]
public IActionResult DeleteProductName(int productNameIdToDelete)
{
    try
    {
        // Find the product entity based on ProductId
        var productNameToDelete = _db.ProductName
            .FirstOrDefault(x => x.ProductNameId == productNameIdToDelete);

        if (productNameToDelete == null)
        {
            return NotFound("Product name not found");
        }



        // Delete the Product first
        _db.ProductName.Remove(productNameToDelete);

        // Save changes to the database
        _db.SaveChanges();

        return Ok(new { message = "Product name deleted successfully" });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine(ex);
        return StatusCode(500, "Internal Server Error");
    }
}


    [HttpGet]
    public IActionResult GetBrands()
    {
        var brands = _db.Brand.ToList();
        return Ok(brands);
    }

        [HttpGet]
    public IActionResult GetShoeSizes()
    {
        var list1 = _db.ShoeSize
            .ToList();
        return Ok(list1);
    }

   
        [HttpGet]
    public IActionResult GetProductByBarcodeAdd(string barcode)
    {
        var result = _db.Product.FirstOrDefault(x => x.Barcode == barcode);
        return Ok(result);
    }//ef

      [HttpPost]
public IActionResult AddProduct(Product product)
{

    try
    {

        _db.Product.Add(product);
        _db.SaveChanges();

        return Ok(product);
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        Console.Error.WriteLine("Hello");
        return StatusCode(500, "Internal Server Error");
    }
}

      [HttpPost]
public IActionResult AddShoeSize(ShoeSize shoeSize)
{

    try
    {

        _db.ShoeSize.Add(shoeSize);
        _db.SaveChanges();

        return Ok(shoeSize);
    }
    catch (Exception ex)
    {

        return StatusCode(500, "Internal Server Error");
    }
}

 [HttpPost]
public IActionResult AddBrand(Brand brand)
{

    try
    {

        _db.Brand.Add(brand);
        _db.SaveChanges();

        return Ok(brand);
    }
    catch (Exception ex)
    {

        return StatusCode(500, "Internal Server Error");
    }
}

 [HttpPost]
public IActionResult AddProductName(ProductName name)
{

    try
    {

        _db.ProductName.Add(name);
        _db.SaveChanges();

        return Ok(name);
    }
    catch (Exception ex)
    {

        return StatusCode(500, "Internal Server Error");
    }
}

    [HttpGet]
public IActionResult GetProductName()
{
    var products = _db.ProductName
        .ToList();

    return Ok(products);
}

[HttpPost]
public IActionResult AddSale(Bill bill)
{
    try
    {
        bill.OrderDate = DateTime.Now;

        // Iterate over BillItems and update the IsSold property for each Product
        foreach (var billItem in bill.BillItems)
        {
            var product = _db.Product.FirstOrDefault(p => p.ProductId == billItem.ProductId);
            if (product != null)
            {
                product.IsSold = true; // Mark the product as sold
            }
        }
        // Save the bill to the database
        _db.Bill.Add(bill);
        _db.SaveChanges();

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
