using System.Globalization;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


[ApiController]
[Route("bossapi/[action]")]
public class BossApiController : ControllerBase
{
  private readonly ILogger<BossApiController> _logger;
  private readonly UserManager<AppUser> _userManager;
  private readonly RoleManager<AppRole> _roleManager;


  private readonly Backofficev2DbContext _db;
  private readonly string _uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images"); // Path to store images

  public BossApiController(ILogger<BossApiController> logger, Backofficev2DbContext db, UserManager<AppUser> userManager, RoleManager<AppRole> roleManager)
  {
    _logger = logger;
    _db = db;
    _userManager = userManager;
    _roleManager = roleManager;
  }



  #region INVENTORY SECTION
  [HttpPost]
  public async Task<IActionResult> UploadProductImage(IFormFile file)
  {
    if (file == null || file.Length == 0)
    {
      return Ok(new { success = false, message = "No file uploaded" });
    }

    // Define the path where the image will be saved
    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", file.FileName);

    // Ensure the directory exists
    var directory = Path.GetDirectoryName(path);
    if (!Directory.Exists(directory))
    {
      Directory.CreateDirectory(directory);
    }

    // Save the file to the server
    using (var stream = new FileStream(path, FileMode.Create))
    {
      await file.CopyToAsync(stream);
    }

    _logger.LogInformation("Image uploaded successfully: " + "/images/" + file.FileName);

    // Return success response with the file path
    return Ok(new { success = true, imageUrl = "/images/" + file.FileName });
  }
  // ---------- Add product
  [HttpGet]
  public IActionResult GetShoeSizes()
  {
    var list1 = _db.ShoeSize
        .ToList();
    return Ok(list1);
  }
  [HttpGet]
  public IActionResult GetBrands()
  {
    var brands = _db.Brand.ToList();
    return Ok(brands);
  }

  [HttpGet]
public IActionResult GetUserData()
{
    var isAdmin = User.IsInRole("manager") || User.IsInRole("admin");
    var responseData = new { isAdmin };
    return Ok(responseData);
}

  #endregion


  #region STAFF SECTION
  [HttpPost]
  [Authorize(Roles = "manager, admin")]
  public async Task<IActionResult> EditStaff(Staff s)
  {
    try
    {
      // Retrieve the Staff record from the database
      var staffToUpdate = _db.Staff.FirstOrDefault(x => x.StaffId == s.StaffId);

      if (staffToUpdate == null)
      {
        return NotFound("Staff not found");
      }

      // Update Staff table properties
      staffToUpdate.StaffFirstname = s.StaffFirstname;
      staffToUpdate.StaffLastname = s.StaffLastname;
      staffToUpdate.Email = s.Email;
      staffToUpdate.PermissionId = s.PermissionId; // Update role or permission ID

      _db.Staff.Update(staffToUpdate);
      _db.SaveChanges();

      // Update Identity Framework user
      var user = await _userManager.FindByIdAsync(staffToUpdate.StaffId.ToString());

      if (user != null)
      {
        user.firstName = s.StaffFirstname;
        user.lastName = s.StaffLastname;
        user.Email = s.Email;
        user.UserName = s.Email; // Ensure email matches username
        user.PhoneNumber = s.StaffPhoneNumber;

        // Update user role
        var currentRoles = await _userManager.GetRolesAsync(user);
        if (currentRoles.Count > 0)
        {
          await _userManager.RemoveFromRolesAsync(user, currentRoles);
        }

        var newRole = _db.Permission.FirstOrDefault(p => p.PermissionId == s.PermissionId)?.PermissionName;
        if (!string.IsNullOrEmpty(newRole))
        {
          await _userManager.AddToRoleAsync(user, newRole);
        }

        // Save user updates
        var result = await _userManager.UpdateAsync(user);
        if (!result.Succeeded)
        {
          return StatusCode(500, "Failed to update Identity user");
        }
      }
      else
      {
        return NotFound("Corresponding Identity user not found");
      }

      return Ok(new { message = "Staff and Identity user updated successfully" });
    }
    catch (Exception ex)
    {
      Console.Error.WriteLine(ex);
      return StatusCode(500, "Internal Server Error");
    }
  }



  [HttpPost]
  [Authorize(Roles = "manager")]
  public async Task<IActionResult> DeleteStaff(Staff s)
  {
    try
    {
      var user = await _userManager.FindByEmailAsync(s.Email);

      var staffToDelete = _db.Staff
          .FirstOrDefault(x => x.StaffId == s.StaffId);

      if (staffToDelete == null)
      {
        return NotFound("Staff not found");
      }
      _db.Staff.Remove(staffToDelete);
      _db.SaveChanges();


      if (user != null)
      {
        // Delete the user
        var result = await _userManager.DeleteAsync(user);
        if (result.Succeeded)
        {
          // User deleted successfully
          return Ok(new { message = "Staff deleted successfully" });
        }
        else
        {
          return Ok(new { message = "Error occured" });

        }
      }
      else
      {
        // User with the specified email not found
        return Ok(new { message = "Staff with specific email not found" });

      }


      // Remove the product from the database

    }
    catch (Exception ex)
    {
      // Log the exception for debugging purposes
      Console.Error.WriteLine(ex);
      return StatusCode(500, "Internal Server Error");
    }
  }

  [HttpGet]
  public IActionResult GetStaffs()
  {
    var list1 = _db.Staff.Include(db => db.Permission)
        .ToList();
    return Ok(list1);
  }

  [HttpGet]
  public IActionResult GetPermissions()
  {
    var list1 = _db.Permission
        .ToList();
    return Ok(list1);
  }

  // ------------ Add staff page

  [HttpPost]
  public async Task<IActionResult> RegisterStaff(Staff s)
  {
    try
    {
      // Create a new AppUser instance and assign values
      var newUser = new AppUser
      {
        Email = s.Email,
        UserName = s.Email,
        firstName = s.StaffFirstname,
        lastName = s.StaffLastname
      };

      // Verify if that user already exist
      if (_userManager.Users.Any(u => u.UserName == newUser.UserName))
      {
        return Ok(
            new
            {
              code = -1,
              messssage = "Username already taken, please tyr again"
            }
        );
      }

      await _userManager.CreateAsync(newUser, s.Password);
      newUser = await _userManager.FindByEmailAsync(newUser.Email);

      Console.WriteLine("Adding role to user");

      if (s.PermissionId == 1)
      {
        await _userManager.AddToRoleAsync(newUser, "manager");
      }
      else if (s.PermissionId == 2)
      {
        await _userManager.AddToRoleAsync(newUser, "admin");
      }
      else if (s.PermissionId == 3)
      {
        await _userManager.AddToRoleAsync(newUser, "user");

      }

      _db.Staff.Add(s);
      await _db.SaveChangesAsync();

      return Ok(new
      {
        code = 0,
        message = "User registered successfully",
        staff = s
      });         



    }
    catch (Exception ex)
    {
      // Log the exception for debugging purposes
      Console.Error.WriteLine(ex);
      return StatusCode(500, "Internal Server Error");
    }
  }
  #endregion

  #region REPORT SECTION

  [HttpGet]
  [Authorize(Roles = "manager")]
  public IActionResult GetTotalSaleDatas(int year)
  {
    CultureInfo cultureInfo = new CultureInfo("en-US"); // Set culture to English (United States)

    var sales = _db.BillItem
                    .Include(x => x.Product)
                    .Where(x => x.Bill.OrderDate.Year == year) // Filter by year
                    .GroupBy(x => new { x.Bill.OrderDate.Month, x.Bill.OrderDate.Day }) // Group by month and day
                    .Select(g => new
                    {
                      date = new DateTime(year, g.Key.Month, g.Key.Day).ToString("MMMM-dd", cultureInfo), // Create a string representation of month name and day
                      totalSale = g.Sum(s => s.Product.SellingPrice),
                    })
                    .ToList();

    return Ok(sales);
  }

  [HttpGet]
  [Authorize(Roles = "manager")]

  public IActionResult GetSaleByProductNameData(string month, int year)
  {
    // Start by querying BillItems with their associated Products and Bills
    IQueryable<BillItem> query = _db.BillItem
                                    .Include(bi => bi.Product)
                                    .ThenInclude(p => p.ProductName)
                                    .Where(bi => bi.Product.IsSold && bi.Bill.OrderDate.Year == year); // Filter by year and IsSold = true

    // If a month is specified, filter by the corresponding month's orders
    if (!string.IsNullOrEmpty(month))
    {
      int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
      query = query.Where(bi => bi.Bill.OrderDate.Month == monthNumber); // Filter by month
    }

    // Group products by ProductNameId and calculate total sales and quantity sold
    var sales = query.GroupBy(bi => bi.Product.ProductName.Name) // Group by product name
                     .Select(g => new
                     {
                       name = g.Key, // Product name
                       sale = g.Sum(bi => bi.Product.SellingPrice), // Total sales for this product
                       quantity = g.Count() // Count how many BillItems have this product name
                     })
                     .ToList();

    // Compute the most profitable product
    var mostProfitableProduct = sales.OrderByDescending(x => x.sale).FirstOrDefault();

    var result = new
    {
      sales,
      mostProfitableProduct = mostProfitableProduct?.name,
      maxSales = mostProfitableProduct?.sale
    };

    return Ok(result);
  }

  [HttpGet]
  [Authorize(Roles = "manager")]
  public IActionResult GetSaleByBrand(string month, int year)
  {
    IQueryable<BillItem> query = _db.BillItem
                                    .Include(bi => bi.Product)
                                    .ThenInclude(p => p.Brand)
                                    .Where(bi => bi.Product.IsSold && bi.Bill.OrderDate.Year == year);

    if (!string.IsNullOrEmpty(month))
    {
      int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
      query = query.Where(bi => bi.Bill.OrderDate.Month == monthNumber);
    }

    var sales = query.GroupBy(bi => bi.Product.Brand.BrandName)
                     .Select(g => new
                     {
                       name = g.Key, // Brand name
                       sale = g.Sum(bi => bi.Product.SellingPrice), // Total sales for this brand
                       quantity = g.Count() // Count how many BillItems have this Brand
                     })
                     .ToList();

    // Compute the most profitable brand
    var mostProfitableBrand = sales.OrderByDescending(x => x.sale).FirstOrDefault();

    var result = new
    {
      sales,
      mostProfitableBrand = mostProfitableBrand?.name,
      maxSales = mostProfitableBrand?.sale
    };

    return Ok(result);
  }
  [HttpGet]
  [Authorize(Roles = "manager")]
  public IActionResult SizeReport(string month, int year)
  {
    // Query BillItems with associated Products and ShoeSize, filtered by year
    IQueryable<BillItem> query = _db.BillItem
                                      .Include(bi => bi.Product)
                                      .ThenInclude(p => p.ShoeSize) // Include ShoeSize data
                                      .Include(bi => bi.Bill) // Include Bill for filtering by date
                                      .Where(bi => bi.Product.IsSold && bi.Bill.OrderDate.Year == year); // Filter by year

    // If a month is specified, filter by the corresponding month's orders
    if (!string.IsNullOrEmpty(month))
    {
      int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
      query = query.Where(bi => bi.Bill.OrderDate.Month == monthNumber); // Filter by month
    }

    // Group by ShoeSizeId to calculate total sales and quantity sold for each size
    var sizeSales = query.GroupBy(bi => bi.Product.ShoeSizeId) // Group by ShoeSizeId
                         .Select(g => new
                         {
                           size = g.First().Product.ShoeSize.SizeType + " - " + g.First().Product.ShoeSize.SizeNumber, // Get the size information
                           sale = g.Sum(bi => bi.Product.SellingPrice), // Sum the selling price to get the total sales for this size
                           itemQty = g.Count() // Count the number of rows in the group, which represents the number of instances sold
                         })
                         .ToList();

    // Find the most profitable size by total sales
    var mostProfitableSize = sizeSales.OrderByDescending(x => x.sale).FirstOrDefault();

    var result = new
    {
      sales = sizeSales, // Sales data for each shoe size
      mostProfitableSize = mostProfitableSize?.size, // Name of the most profitable size
      maxSales = mostProfitableSize?.sale // Total sales value of the most profitable size
    };

    return Ok(result); // Return the result as JSON
  }


  [HttpGet]
  [Authorize(Roles = "manager")]
  public IActionResult EmployeeReport(string month, int year)
  {
    IQueryable<BillItem> query = _db.BillItem
                                  .Include(p => p.Bill)
                                  .ThenInclude(st => st.Staff)
                                  .Where(x => x.Bill.OrderDate.Year == year); // Filter by year

    if (!string.IsNullOrEmpty(month))
    {
      // Convert month name to month number
      int monthNumber = DateTime.ParseExact(month, "MMMM", CultureInfo.InvariantCulture).Month;
      query = query.Where(x => x.Bill.OrderDate.Month == monthNumber); // Filter by month
    }

    var sales = query.GroupBy(x => new
    {
      x.Bill.Staff.StaffFirstname,
      x.Bill.Staff.StaffLastname
    })
                     .Select(g => new
                     {
                       name = $"{g.Key.StaffFirstname} {g.Key.StaffLastname}",
                       sale = g.Sum(s => s.Product.SellingPrice),
                       quantity = g.Count()
                     })
                     .ToList();



    return Ok(sales);
  }
  #endregion

  #region BILL SECTION
  [HttpGet]
  public IActionResult GetBills()
  {
    var billList = _db.Bill
    .Include(b => b.Staff)
    .Include(b => b.BillItems)
      .ThenInclude(b => b.Product)
        .ThenInclude(b => b.ProductName)
      .Include(b => b.BillItems)
        .ThenInclude(b => b.Product)
        .ThenInclude(b => b.Brand)
      .Include(b => b.BillItems)
        .ThenInclude(b => b.Product)
        .ThenInclude(b => b.ShoeSize)
    .ToList();
    return Ok(billList);
  }

  [HttpPost]
  [Authorize(Roles = "manager, admin")]
  public IActionResult EditDepositMoney(int newDepositMoney, int billId)
  {
    try
    {
      // Retrieve the bill from the database based on the provided billId
      var bill = _db.Bill.FirstOrDefault(b => b.BillId == billId);

      if (bill == null)
      {
        return NotFound("Bill not found");
      }

      // Update the CustomerTransferPicPath attribute
      bill.DepositMoney = newDepositMoney;
      // Save the changes to the database
      _db.SaveChanges();

      // Return the updated bill
      return Ok(bill);
    }
    catch (Exception ex)
    {
      // Log the exception for debugging purposes
      Console.Error.WriteLine(ex);
      return StatusCode(500, "Internal Server Error");
    }
  }//ef

  
  [HttpPost]
  [Authorize(Roles = "manager, admin")]
  public IActionResult EditAmountPay(int amountPay, int billId)
  {
    try
    {
      var bill = _db.Bill.FirstOrDefault(b => b.BillId == billId);

      if (bill == null)
      {
        return NotFound("Bill not found");
      }

      bill.AmountPay = amountPay;
      _db.SaveChanges();

      return Ok(bill);
    }
    catch (Exception ex)
    {
      // Log the exception for debugging purposes
      Console.Error.WriteLine(ex);
      return StatusCode(500, "Internal Server Error");
    }
  }//ef


  [HttpPost]
  public IActionResult DeleteBill(int billIdToDelete)
  {
    try
    {
      // Find the delivery service entity to delete based on the ID
      var billToDelete = _db.Bill
          .Include(ds => ds.BillItems)
          .FirstOrDefault(x => x.BillId == billIdToDelete);

      if (billIdToDelete == null)
      {
        return NotFound("Bill not found");
      }

      // Remove the associated delivery branches and branches
      foreach (var billItem in billToDelete.BillItems)
      {
        _db.BillItem.Remove(billItem);
      }

      // Remove the delivery service from the database
      _db.Bill.Remove(billToDelete);
      _db.SaveChanges();

      return Ok(new { message = "Bill and associated BillItems deleted successfully" });
    }
    catch (Exception ex)
    {
      // Log the exception for debugging purposes
      Console.Error.WriteLine(ex);
      return StatusCode(500, "Internal Server Error");
    }
  }

  #endregion

  #region DASHBOARD SECTION
  [HttpGet]
  public IActionResult GetShoeSizesWithQuantity()
  {
    // Query Products with ShoeSize where IsSold is false
    var result = _db.Product
        .Include(p => p.ShoeSize) // Include ShoeSize information
        .Where(p => !p.IsSold)    // Filter for unsold products
        .GroupBy(p => p.ShoeSizeId) // Group by ShoeSizeId
        .Select(g => new
        {
          ShoeSize = g.First().ShoeSize.SizeType + " - " + g.First().ShoeSize.SizeNumber, // Combine size type and number
          Quantity = g.Count() // Count the quantity for this specific size
        })
        .ToList();

    return Ok(result); // Return the result as JSON
  }

  [HttpGet]
  public IActionResult GetProductsWithQuantity()
  {
    // Query Products with ShoeSize where IsSold is false
    var result = _db.Product
        .Include(p => p.ProductName) // Include ShoeSize information
        .Where(p => !p.IsSold)    // Filter for unsold products
        .GroupBy(p => p.ProductNameId) // Group by ShoeSizeId
        .Select(g => new
        {
          ProductName = g.First().ProductName.Name, // Combine size type and number
          Quantity = g.Count() // Count the quantity for this specific size
        })
        .ToList();

    return Ok(result); // Return the result as JSON
  }

  [HttpGet]
public IActionResult GetTopSaleProduct()
{
    try
    {
        // Query the BillItems, filtering for sold products, and grouping by product name
        var topProduct = _db.BillItem
                            .Include(bi => bi.Product)
                            .ThenInclude(p => p.ProductName)
                            .Where(bi => bi.Product.IsSold)  // Only include sold products
                            .GroupBy(bi => bi.Product.ProductName.Name) // Group by product name
                            .Select(g => new
                            {
                                name = g.Key, // Product name
                                quantity = g.Count() // Count how many times this product has been sold
                            })
                            .OrderByDescending(g => g.quantity) // Order by quantity sold in descending order
                            .FirstOrDefault(); // Get the product with the highest quantity sold

        // If no product is found, return a not found response
        if (topProduct == null)
        {
            return NotFound(new { message = "No products found or none sold." });
        }

        // Return the top product's name and quantity sold
        var result = new
        {
            productName = topProduct.name,
            quantity = topProduct.quantity
        };

        return Ok(result);
    }
    catch (Exception ex)
    {
        // Return an error response in case of any exception
        return StatusCode(500, new { message = "An error occurred.", details = ex.Message });
    }
}
[HttpGet]
public IActionResult GetTopSaleBrand()
{
    try
    {
        // Fetch products and join with the brand, then group by brand
        var products = _db.Product
            .Include(p => p.Brand)  // Include Brand data
            .Where(p => p.IsSold)  // Filter products where IsSold is true
            .ToList();  // Execute the query and bring the data to memory

        // Perform the grouping and calculation in memory (client-side)
        var topBrand = products
            .GroupBy(p => p.Brand)
            .OrderByDescending(g => g.Count())  // Order by the count of sold products
            .Select(g => new
            {
                BrandName = g.Key.BrandName,  // Accessing BrandName from Brand
                Count = g.Count(),            // Count the number of sold products
                BrandLogoUrl = g.Key.BrandLogoUrl  // Accessing BrandLogoUrl from Brand
            })
            .FirstOrDefault();  // Get the top brand

        if (topBrand == null)
        {
            return NotFound(new { message = "No products found or none sold." });
        }

        // Return the top brand's details
        var result = new
        {
            brandName = topBrand.BrandName,
            brandUrl = topBrand.BrandLogoUrl,
            quantity = topBrand.Count
        };

        return Ok(result);
    }
    catch (System.Exception ex)
    {
        // Log the full exception details
        return StatusCode(500, new { message = "An error occurred.", details = ex.ToString() });
    }
}

[HttpGet]
public IActionResult GetBillAndBillItemCount()
{
    try
    {
        // Get the total count of Bill rows
        var totalBills = _db.Bill.Count();

        // Get the total count of BillItem rows
        var totalBillItems = _db.BillItem.Count();

        // Return the results as an anonymous object
        var result = new
        {
            totalBills,
            totalBillItems
        };

        return Ok(result);
    }
    catch (System.Exception ex)
    {
        return StatusCode(500, new { message = "An error occurred.", details = ex.Message });
    }
}

[HttpGet]
public async Task<IActionResult> GetProductsBySize(string sizeType, double sizeNumber)
{
    try
    {
        // Query the database for matching products
        var products = await _db.Product
            .Include(p => p.ShoeSize)
            .Include(p => p.Brand)
            .Include(p => p.ProductName)
            .Where(p => p.ShoeSize.SizeType == sizeType && 
                        p.ShoeSize.SizeNumber == sizeNumber && 
                        !p.IsSold) // Ensure IsSold is false
            .ToListAsync();

        if (products == null || !products.Any())
        {
            return NotFound(new { Message = "No products found for the specified size." });
        }

        return Ok(products); // Return the list of products
    }
    catch (Exception ex)
    {
        // Handle any exceptions
        return StatusCode(500, new { Message = "An error occurred while processing your request.", Error = ex.Message });
    }
}







  #endregion

  #region Cart
[HttpGet]
  public IActionResult GetStaffByEmail(string email)
{
    var staff = _db.Staff.FirstOrDefault(s => s.Email == email);
    if (staff != null)
    {
        return Ok(staff);
    }
    return NotFound(new { message = "Staff not found" });
}


  #endregion




}//ec
