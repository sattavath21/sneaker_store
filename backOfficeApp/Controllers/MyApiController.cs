using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;

[ApiController]
[Route("myapi/[action]")]
public class MyApiController : ControllerBase
{
    private readonly ILogger<MyApiController> _logger;
    private readonly UserManager<AppUser> _userManager;
    private readonly RoleManager<AppRole> _roleManager;

    private BackofficeappDbContext _db;

    public MyApiController(ILogger<MyApiController> logger, BackofficeappDbContext db, UserManager<AppUser> userManager, RoleManager<AppRole> roleManager)
    {
        _logger = logger;
        _db = db;
        _userManager = userManager;
        _roleManager = roleManager;
    }


    #region ACTIONS

    [HttpGet]
    public IActionResult GetShippingMethods()
    {
        var list1 = _db.ShippingMethod
            .ToList();
        return Ok(list1);
    }


    [HttpGet]
    public IActionResult GetDeliveryServices()
    {
        var list1 = _db.DeliveryService
            .Include(db => db.BranchLocations)
                .ThenInclude(db => db.Province)
            .Include(db => db.BranchLocations)
                .ThenInclude(db => db.City)
            .Include(db => db.BranchLocations)
                .ThenInclude(db => db.Village)
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
    public IActionResult EditBill(Bill updatedBill)
    {
        // Update bill information
        _db.Bill.Update(updatedBill);
        _db.SaveChanges();
        return Ok(updatedBill);
    }//ef



[HttpPost]
    public IActionResult AddNewCity(City newCity)
    {   
        _db.City.Add(newCity);
        _db.SaveChanges();
        return Ok(newCity);

    }//ef

    [HttpPost]
    public IActionResult AddNewVillage(Village newVillage)
    {   
        _db.Village.Add(newVillage);
        _db.SaveChanges();
        return Ok(newVillage);

    }//ef

[HttpPost]
public IActionResult AddNewBranchLocation(int deliveryServiceId, int provinceId, int cityId, int villageId)
{
    try
    {
        // Create a new BranchLocation object
        var newBranchLocation = new BranchLocation
        {
            DeliveryServiceId = deliveryServiceId,
            ProvinceId = provinceId,
            CityId = cityId,
            VillageId = villageId
            // You can add other properties if needed
        };

        // Add the new BranchLocation to the database
        _db.BranchLocation.Add(newBranchLocation);
        _db.SaveChanges();

        return Ok("New branch location added successfully.");
    }
    catch (Exception ex)
    {
        // Handle any exceptions that may occur
        return StatusCode(500, $"An error occurred while adding the new branch location: {ex.Message}");
    }
}

    [HttpPost]
    public IActionResult EditCustomerTransfer(string newTransfer, int billId)
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
            bill.CustomerTransferPicPath = newTransfer;
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
    public IActionResult EditShippingReceipt(string newTransfer, int billId)
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
            bill.ShippingReceipt = newTransfer;
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
    public IActionResult EditOrderStatus(int newTransfer, int billId)
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
            bill.OrderStatusId = newTransfer;
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
public IActionResult EditDelivery(DeliveryService e)
{
    // Retrieve the existing DeliveryService entity from the database
    var existingDeliveryService = _db.DeliveryService.Find(e.DeliveryServiceId);
    if (existingDeliveryService == null)
    {
        return NotFound();
    }

    // Update only the properties that should be modified
    existingDeliveryService.DeliveryCompanyName = e.DeliveryCompanyName;

    // Save changes to the database
    _db.SaveChanges();

    return Ok(existingDeliveryService);
}

    // Cascade delete delete delievery service with all of the branch
    [HttpPost]
    public IActionResult DeleteDeliveryService(int deliveryServiceIdToDelete)
    {
        try
        {
            // Find the delivery service entity to delete based on the ID
            var deliveryToDelete = _db.DeliveryService
                .Include(ds => ds.BranchLocations)
                .FirstOrDefault(x => x.DeliveryServiceId == deliveryServiceIdToDelete);

            if (deliveryToDelete == null)
            {
                return NotFound("DeliveryService not found");
            }

            // Remove the associated delivery branches and branches
            foreach (var branchLocation in deliveryToDelete.BranchLocations)
            {
                _db.BranchLocation.Remove(branchLocation);
            }

            // Remove the delivery service from the database
            _db.DeliveryService.Remove(deliveryToDelete);
            _db.SaveChanges();

            return Ok(new { message = "DeliveryService and associated branches deleted successfully" });
        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.Error.WriteLine(ex);
            return StatusCode(500, "Internal Server Error");
        }
    }
    [HttpGet]
    public IActionResult GetAssociateProvinces(int deliveryServiceId)
    {
    var provinces = _db.BranchLocation.Where(bl => bl.DeliveryServiceId == deliveryServiceId)
    .Select(bl => bl.Province)
    .ToList();
        return Ok(provinces);
    }
        [HttpGet]
    public IActionResult GetAssociateBranchLocation(int deliveryServiceId)
    {
    var branchLocations = _db.BranchLocation
        .Include(bl => bl.Province)
        .Include(bl => bl.City)
        .Include(bl => bl.Village)
        .Where(bl => bl.DeliveryServiceId == deliveryServiceId)
        .ToList();
        return Ok(branchLocations);
    }

[HttpGet]
public IActionResult GetAssociateCities(int deliveryServiceId, int provinceId)
{
        var cities = _db.BranchLocation
                    .Where(bl => bl.DeliveryServiceId == deliveryServiceId && bl.ProvinceId == provinceId)
                    .Select(bl => bl.City)
                    .ToList();
    return Ok(cities);
}
[HttpGet]
public IActionResult GetRelateCities(int provinceId)
{
        var cities = _db.City
                    .Where(c => c.ProvinceId == provinceId)
                    .ToList();
    return Ok(cities);
}
[HttpGet]
public IActionResult GetRelateVillages(int cityId)
{
        var villages = _db.Village
                    .Where(v => v.CityId == cityId)
                    .ToList();
    return Ok(villages);
}
[HttpGet]
public IActionResult GetAllCities()
{
            var cities = _db.City.ToList();
        return Ok(cities);
}
[HttpGet]
public IActionResult GetAllProvinces()
{
            var provinces = _db.Province.ToList();
        return Ok(provinces);
}

[HttpGet]
public IActionResult GetAssociateVillages(int deliveryServiceId, int cityId)
{
    var villages = _db.BranchLocation
                    .Where(bl => bl.DeliveryServiceId == deliveryServiceId && bl.CityId == cityId)
                    .Select(bl => bl.Village)
                    .ToList();
    return Ok(villages);
}



[HttpPost]
public IActionResult AddBranchLocation([FromBody] BranchLocation requestBranchLocation)
{
    // Check if the province already exists
    var province = _db.Province.FirstOrDefault(p => p.ProvinceName == requestBranchLocation.Province.ProvinceName);
    if (province == null)
    {
        // If not, create a new province
        province = new Province { ProvinceName = requestBranchLocation.Province.ProvinceName };
        _db.Province.Add(province);
        _db.SaveChanges();
    }

    // Check if the city already exists
    var city = _db.City.FirstOrDefault(c => c.CityName == requestBranchLocation.City.CityName && c.ProvinceId == province.ProvinceId);
    if (city == null)
    {
        // If not, create a new city
        city = new City { CityName = requestBranchLocation.City.CityName, ProvinceId = province.ProvinceId };
        _db.City.Add(city);
        _db.SaveChanges();
    }

    // Check if the village already exists
    var village = _db.Village.FirstOrDefault(v => v.VillageName == requestBranchLocation.Village.VillageName && v.CityId == city.CityId);
    if (village == null)
    {
        // If not, create a new village
        village = new Village { VillageName = requestBranchLocation.Village.VillageName, CityId = city.CityId };
        _db.Village.Add(village);
        _db.SaveChanges();
    }

    // Create a new BranchLocation for the new village
    var newBranchLocation = new BranchLocation
    {
        ProvinceId = province.ProvinceId,
        CityId = city.CityId,
        VillageId = village.VillageId,
        DeliveryServiceId = requestBranchLocation.DeliveryServiceId
    };

    // Add the new BranchLocation to the database context and save changes
    _db.BranchLocation.Add(newBranchLocation);
    _db.SaveChanges();

    return Ok(newBranchLocation);
}

    
    // [HttpPost]
    // public IActionResult EditBranch(Branch b)
    // {
    //     //update product
    //     _db.Branch.Update(b);
    //     _db.SaveChanges();
    //     return Ok(b);
    // }//ef

    // [HttpPost]
    // public IActionResult DeleteDeliveryBranch(int deliveryBranchId)
    // {
    //     try
    //     {
    //         // Find the delivery service entity to delete based on the ID
    //         var deliveryBranchToDelete = _db.DeliveryBranch
    //             .Include(ds => ds.Branch)
    //             .FirstOrDefault(x => x.DeliveryBranchId == deliveryBranchId);

    //         if (deliveryBranchToDelete == null)
    //         {
    //             return NotFound("DeliveryBranch not found");
    //         }

    //         _db.Branch.Remove(deliveryBranchToDelete.Branch);

    //         // Remove the delivery service from the database
    //         _db.DeliveryBranch.Remove(deliveryBranchToDelete);
    //         _db.SaveChanges();

    //         return Ok(new { message = "DeliveryBranch and associated branches deleted successfully" });
    //     }
    //     catch (Exception ex)
    //     {
    //         // Log the exception for debugging purposes
    //         Console.Error.WriteLine(ex);
    //         return StatusCode(500, "Internal Server Error");
    //     }
    // }

    

    [HttpGet]
    public IActionResult GetBills()
    {
        var billList = _db.Bill
        .Include(b => b.OrderStatus)
        .Include(b => b.ShippingMethod)
        .Include(b => b.Discount)
        .Include(b => b.DeliveryService)
        .Include(b => b.Province)
        .Include(b => b.City)
        .Include(b => b.Village)
        .Include(b => b.Staff)
        .Include(b => b.Customer)
        .Include(b => b.BillItems)
          .ThenInclude(b => b.ShoeSize)
        .Include(b => b.BillItems)
          .ThenInclude(b => b.ProductCondition)
        .Include(b => b.BillItems)
          .ThenInclude(b => b.Product)
        .ToList();

        return Ok(billList);
    }

    [HttpGet]
    public IActionResult GetDiscounts()
    {
        var discountList = _db.Discount
        .Include(d => d.ShippingMethod)

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
    public IActionResult AddDiscount(int shippingMethodId, Discount d)
    {
        try
        {

            d.ShippingMethodId = shippingMethodId;
            // Add the new branch to the Branch table
            _db.Discount.Add(d);
            _db.SaveChanges();


            return Ok(d);
        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.Error.WriteLine(ex);
            return StatusCode(500, "Internal Server Error");
        }

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

    [HttpGet]
    public IActionResult GetCustomers()
    {
        var list1 = _db.Customer
            .ToList();
        return Ok(list1);
    }

    [HttpPost]
    public IActionResult AddCustomer(Customer newCustomer)
    {

        _db.Customer.Add(newCustomer);
        _db.SaveChanges();
        return Ok(newCustomer);

    }
    [HttpPost]
    public IActionResult EditCustomer(Customer c)
    {
        //update product
        _db.Customer.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult DeleteCustomer(Customer c)
    {
        try
        {
            var customerToDelete = _db.Customer
                .FirstOrDefault(x => x.CustomerId == c.CustomerId);

            if (customerToDelete == null)
            {
                return NotFound("Customer not found");
            }

            // Remove the product from the database
            _db.Customer.Remove(customerToDelete);
            _db.SaveChanges();

            return Ok(new { message = "Customer deleted successfully" });
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

    [HttpPost]
    public async Task<IActionResult> RegisterStaff(Staff s)
    {
        Console.WriteLine("Begin of RegisterStaff");

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

            // Create new login account
                    Console.WriteLine("Creating login account");

            await _userManager.CreateAsync(newUser, s.Password);
            newUser = await _userManager.FindByEmailAsync(newUser.Email);

                    Console.WriteLine("Adding role to user");

            if (s.PermissionId == 1)
            {
                await _userManager.AddToRoleAsync(newUser, "admin");
            }
            else if (s.PermissionId == 2)
            {
                await _userManager.AddToRoleAsync(newUser, "manager");
            }
            else if (s.PermissionId == 3)
            {
                await _userManager.AddToRoleAsync(newUser, "user");

            }

            // if(!await _userManager.IsInRoleAsync(newUser, "user")){
            //     await _userManager.AddToRoleAsync(newUser, "user");
            // }
                    Console.WriteLine("Before .Add");

            _db.Staff.Add(s);
            await _db.SaveChangesAsync();

            return Ok(new
        {
            code = 0,
            message = "User registered successfully",
            staff = s
        });            // var user = _userManager.FirstOrDefault(x => x.firstName = s.StaffFirstname &&  x.lastName ==s.StaffLastname);





        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.Error.WriteLine(ex);
            return StatusCode(500, "Internal Server Error");
        }
    }


    [HttpPost]
    public IActionResult EditStaff(Staff s)
    {
        //update product
        _db.Staff.Update(s);
        _db.SaveChanges();
        return Ok(s);
    }//ef

    [HttpPost]
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
    public IActionResult GetPermissions()
    {
        var list1 = _db.Permission
            .ToList();
        return Ok(list1);
    }

    [HttpGet]
    public IActionResult GetBrands()
    {
        var list1 = _db.Brand
            .Include(db => db.BrandWithCollections)
                .ThenInclude(db => db.Collection)
            .ToList();
        return Ok(list1);
    }
    [HttpPost]
    public IActionResult AddBrand(Brand newBrand)
    {

        _db.Brand.Add(newBrand);
        _db.SaveChanges();
        return Ok(newBrand);

    }

    [HttpPost]
    public IActionResult EditBrand(Brand b)
    {
        //update product
        _db.Brand.Update(b);
        _db.SaveChanges();
        return Ok(b);
    }//ef

    [HttpPost]
    public IActionResult DeleteBrand(int brandIdToDelete)
    {
        try
        {
            // Find the delivery service entity to delete based on the ID
            var brandToDelete = _db.Brand
                .Include(ds => ds.BrandWithCollections)
                    .ThenInclude(db => db.Collection)
                .FirstOrDefault(x => x.BrandId == brandIdToDelete);

            if (brandToDelete == null)
            {
                return NotFound("Brand not found");
            }

            // Remove the associated delivery branches and branches
            foreach (var brandWithCollection in brandToDelete.BrandWithCollections)
            {
                _db.BrandWithCollection.Remove(brandWithCollection);
                _db.Collection.Remove(brandWithCollection.Collection);
            }

            // Remove the delivery service from the database
            _db.Brand.Remove(brandToDelete);
            _db.SaveChanges();

            return Ok(new { message = "Brand and associated collections deleted successfully" });
        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.Error.WriteLine(ex);
            return StatusCode(500, "Internal Server Error");
        }
    }

    [HttpPost]
    public IActionResult AddCollection(Collection newCollection, int brandId)
    {
        try
        {
            // Add the new branch to the Branch table
            _db.Collection.Add(newCollection);
            _db.SaveChanges();

            var brandWithCollection = new BrandWithCollection
            {
                BrandId = brandId,
                CollectionId = newCollection.CollectionId
            };

            // Add the new delivery branch to the DeliveryBranch table
            _db.BrandWithCollection.Add(brandWithCollection);
            _db.SaveChanges();

            return Ok(newCollection);
        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.Error.WriteLine(ex);
            return StatusCode(500, "Internal Server Error");
        }
    }
    [HttpPost]
    public IActionResult EditCollection(Collection c)
    {
        //update product
        _db.Collection.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef
    [HttpPost]
    public IActionResult DeleteBrandWithCollection(int brandWithCollectionId)
    {
        try
        {
            // Find the delivery service entity to delete based on the ID
            var brandWithCollectionToDelete = _db.BrandWithCollection
                .Include(ds => ds.Collection)
                .FirstOrDefault(x => x.BrandWithCollectionId == brandWithCollectionId);

            if (brandWithCollectionToDelete == null)
            {
                return NotFound("BrandWithCollection not found");
            }

            _db.Collection.Remove(brandWithCollectionToDelete.Collection);

            // Remove the delivery service from the database
            _db.BrandWithCollection.Remove(brandWithCollectionToDelete);
            _db.SaveChanges();

            return Ok(new { message = "BrandWithCollection and associated collection deleted successfully" });
        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.Error.WriteLine(ex);
            return StatusCode(500, "Internal Server Error");
        }
    }
[HttpDelete]
public IActionResult DeleteBranchLocation(int branchLocationId)
{
    try
    {
        // Find the branch location by its ID
        var branchLocation = _db.BranchLocation.FirstOrDefault(bl => bl.BranchLocationId == branchLocationId);
        
        // Check if the branch location exists
        if (branchLocation == null)
        {
            // Return a 404 Not Found response if the branch location doesn't exist
            return NotFound();
        }

        // Remove the branch location from the database
        _db.BranchLocation.Remove(branchLocation);
        _db.SaveChanges();

        // Return a 200 OK response indicating successful deletion
        return Ok();
    }
    catch (Exception ex)
    {
        // Handle any exceptions and return a 500 Internal Server Error response
        return StatusCode(500, $"An error occurred while deleting the branch location: {ex.Message}");
    }
}
[HttpGet]
public IActionResult GetUserData()
{
    var isAdmin = User.IsInRole("manager") || User.IsInRole("admin");
    var responseData = new { isAdmin };
    return Ok(responseData);
}

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
