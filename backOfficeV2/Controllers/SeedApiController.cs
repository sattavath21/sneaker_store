using System.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/initialization/[action]")]
public class SeedApiController : ControllerBase
{
    private readonly ILogger<SeedApiController> _logger;
    private Backofficev2DbContext _db;

    public SeedApiController(ILogger<SeedApiController> logger, Backofficev2DbContext db)
    {
        _logger = logger;
        _db = db;
    }

    #region ACTIONS

    [HttpPost]
    public IActionResult SeedData()
    {
        Console.WriteLine("Start Seeding.... ");

        /// Brands

        List<Brand> brands = new List<Brand>
        {
            new Brand {BrandId=1, BrandName = "Nike", BrandLogoUrl = "https://example.com/nike-logo.png" },
            new Brand {BrandId=2,BrandName = "Adidas", BrandLogoUrl = "https://example.com/adidas-logo.png" },
            new Brand {BrandId=3, BrandName = "Puma", BrandLogoUrl = "https://example.com/puma-logo.png" },
            new Brand {BrandId=4, BrandName = "Reebok", BrandLogoUrl = "https://example.com/reebok-logo.png" },
            new Brand {BrandId=5, BrandName = "Under Armour", BrandLogoUrl = "https://example.com/underarmour-logo.png" },
            new Brand {BrandId=6, BrandName = "New Balance", BrandLogoUrl = "https://example.com/newbalance-logo.png" },
            new Brand {BrandId=7, BrandName = "ASICS", BrandLogoUrl = "https://example.com/asics-logo.png" },
            new Brand {BrandId=8, BrandName = "Converse", BrandLogoUrl = "https://example.com/converse-logo.png" },
            new Brand {BrandId=9, BrandName = "Fila", BrandLogoUrl = "https://example.com/fila-logo.png" },
            new Brand {BrandId=10,  BrandName = "Vans", BrandLogoUrl = "https://example.com/vans-logo.png" }
        };

        _db.Brand.AddRange(brands);

        /// Shoe Size


        List<ShoeSize> shoeSizes = new List<ShoeSize>();

        for (int i = 35; i <= 47; i++)
        {
            shoeSizes.Add(new ShoeSize
            {
                ShoeSizeId = i - 34,
                SizeType = "EU",
                SizeNumber = i
            });
        }

        _db.ShoeSize.AddRange(shoeSizes);

        // Product Name
        List<ProductName> productNames = new List<ProductName>
        {
            new ProductName {ProductNameId=1, Name = "Jordan 4 Retro Thunder (2023)" },
            new ProductName {ProductNameId=2,Name = "Nike Air Force 1 '07 White" },
            new ProductName {ProductNameId=3,Name = "Adidas Yeezy Boost 350 V2" },
            new ProductName {ProductNameId=4,Name = "Puma RS-X Reinvention" },
            new ProductName {ProductNameId=5,Name = "Converse Chuck Taylor All Star" },
            new ProductName {ProductNameId=6,Name = "New Balance 550 White/Green" },
            new ProductName {ProductNameId=7,Name = "Reebok Classic Leather Legacy" },
            new ProductName {ProductNameId=8,Name = "Vans Old Skool Black/White" },
            new ProductName {ProductNameId=9,Name = "ASICS Gel-Kayano 14" },
            new ProductName {ProductNameId=10, Name = "Salomon XT-6 Advanced" }
        };

        // Use a for loop to add 30 more
        for (int i = 11; i <= 41; i++)
        {
            productNames.Add(new ProductName
            {
                ProductNameId = i,
                Name = $"Sneaker Model {i} (2023)"
            });
        }
        _db.ProductName.AddRange(productNames);


        // Permission

        Permission ownerPermission = new Permission
        {
            PermissionId = 1,
            PermissionName = "Manager"
        };

        Permission viceOwnerPermission = new Permission
        {
            PermissionId = 2,
            PermissionName = "Admin"
        };

        Permission staffPermission = new Permission
        {
            PermissionId = 3,
            PermissionName = "User"
        };

        _db.Permission.AddRange(ownerPermission, viceOwnerPermission, staffPermission);



        // Staff 
        List<Staff> staffList = new List<Staff>
{
    new Staff
    {
        StaffFirstname = "JY",
        StaffLastname = "Yodsaphon",
        StaffBirthday = new DateTime(1995, 7, 20), // Example birthday
        Email = "jy@hotmail.com",
        Password = "password123", // Example password
        StaffPhoneNumber = "555-1111",
        Permission = ownerPermission,  // Assign the Permission object directly
    },
    new Staff
    {
        StaffFirstname = "Ta",
        StaffLastname = "Xayyadeth",
        StaffBirthday = new DateTime(1998, 3, 15), // Example birthday
        Email = "ta@hotmail.com",
        Password = "password456", // Example password
        StaffPhoneNumber = "555-2222",
        Permission = viceOwnerPermission, // Assign the Permission object directly
    },
    new Staff
    {
        StaffFirstname = "Rmuay",
        StaffLastname = "Arisara",
        StaffBirthday = new DateTime(2000, 11, 5), // Example birthday
        Email = "muay@hotmail.com",
        Password = "password789", // Example password
        StaffPhoneNumber = "555-3333",
        Permission = staffPermission, // Assign the Permission object directly
    }
};


        _db.Staff.AddRange(staffList);

        // Random Product Seed
        var random = new Random();
        List<Product> products = new List<Product>();

        for (int i = 1; i <= 100; i++)
        {
             int sellingPrice = random.Next(150, 300) * 10; // Random selling price in range
            int amountPay = sellingPrice + random.Next(10, 50) * 10; // Ensure AmountPay is greater than SellingPrice
            products.Add(new Product
            {
                Barcode = $"BARCODE-{random.Next(100000, 999999)}",
                ProductName = productNames[random.Next(0, productNames.Count)], // Random ProductName object
                ProductImagePath = $"https://example.com/product-image-{i}.png",
                CostPrice = random.Next(50, 150) * 10, // Random cost price in range
                SellingPrice = sellingPrice,
                Sku = $"SKU-{random.Next(1000, 9999)}",
                ShoeSize = shoeSizes[random.Next(0, shoeSizes.Count)], // Random ShoeSize object
                Brand = brands[random.Next(0, brands.Count)], // Random Brand object
                ConditionDescription = "-",
                BoxDescription = "-",
                IsSold = random.Next(0, 2) == 0 // 50% chance for true or false
            });
        }

        // Add products to database
        _db.Product.AddRange(products);
        _db.SaveChanges();

        // List to store generated Bills
        List<Bill> bills = new List<Bill>();

        var productList = _db.Product.Where(p => p.IsSold).ToList(); // Only sold products

        if (productList.Count == 0)
        {
            throw new Exception("No sold products available for seeding.");
        }
// Loop to generate Bills
for (int i = 0; i < 30; i++) // Generate 30 bills
{
    var depositMoney = random.Next(1000, 2001); // Random deposit money between 1000 and 2000
    var staff = staffList[random.Next(0, staffList.Count)]; // Randomly select a Staff object from the staff list

    // Create the bill
    var bill = new Bill
    {
        OrderDate = DateTime.Now.AddDays(-random.Next(1, 30)), // Random OrderDate within the last 30 days
        DepositMoney = depositMoney,
        Staff = staff, // Link the selected Staff object to the Bill
        BillItems = new List<BillItem>() // Initialize BillItems list
    };

    // Random number of BillItems (between 1 and 3 items per bill)
    int numberOfItems = random.Next(1, 4);

    var addedProductIds = new HashSet<int>(); // Track added products in the current bill

    // Shuffle the product list to pick random products
    var shuffledProductList = productList.OrderBy(p => random.Next()).ToList();

    // Loop to add BillItems to the Bill
    for (int j = 0; j < numberOfItems; j++)
    {
        // Find the next product that hasn't been added yet to the Bill
        var product = shuffledProductList.FirstOrDefault(p => !addedProductIds.Contains(p.ProductId));

        if (product == null)
            break; // If no more products available, exit

        // Add product's ProductId to the added list
        addedProductIds.Add(product.ProductId);

        // Create the BillItem and link it to the product and bill
        var billItem = new BillItem
        {
            Product = product, // Link the selected Product object to the BillItem
            Bill = bill // Link this BillItem to the current Bill
        };

        // Add the BillItem to the Bill's list
        bill.BillItems.Add(billItem);
    }

    // Calculate AmountPay as greater than the total price of BillItems
    var totalPrice = bill.BillItems.Sum(item => item.Product.SellingPrice);
    bill.AmountPay = totalPrice + random.Next(10, 50) * 10; // Ensure AmountPay is greater than the total price

    // Add the bill to the collection of bills
    bills.Add(bill);
}

// Add the bills to the database
_db.Bill.AddRange(bills);
        _db.SaveChanges();

        var result = _db.Bill.ToList();
        return Ok(result);


    }



    [HttpPost]
    public IActionResult SeedDataSmall()
    {
        Console.WriteLine("Start Seeding.... ");

        /// Brands

        List<Brand> brands = new List<Brand>
        {
            new Brand {BrandId=1, BrandName = "Nike", BrandLogoUrl = "https://logos-world.net/wp-content/uploads/2020/04/Nike-Logo.png" },
            new Brand {BrandId=2,BrandName = "Adidas", BrandLogoUrl = "https://upload.wikimedia.org/wikipedia/commons/2/24/Adidas_logo.png" },
            new Brand {BrandId=3, BrandName = "Puma", BrandLogoUrl = "https://loodibee.com/wp-content/uploads/Puma-Logo-Symbol.png" },
            new Brand {BrandId=4, BrandName = "Reebok", BrandLogoUrl = "https://www.pngall.com/wp-content/uploads/8/Reebok-Logo-Transparent.png" },
            new Brand {BrandId=5, BrandName = "Under Armour", BrandLogoUrl = "https://cdn.freebiesupply.com/logos/large/2x/under-armour-logo-png-transparent.png" },
            new Brand {BrandId=6, BrandName = "New Balance", BrandLogoUrl = "https://cdn.freebiesupply.com/logos/large/2x/new-balance-2-logo-black-and-white.png" },
            new Brand {BrandId=7, BrandName = "ASICS", BrandLogoUrl = "https://cdn.freebiesupply.com/logos/large/2x/asics-6-logo-png-transparent.png" },
            new Brand {BrandId=8, BrandName = "Converse", BrandLogoUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Converse_logo.svg/1200px-Converse_logo.svg.png" },
            new Brand {BrandId=9, BrandName = "Fila", BrandLogoUrl = "https://i.pinimg.com/originals/13/26/22/132622ce5b69fa301c6b07cf2dc25dfe.png" },
            new Brand {BrandId=10,  BrandName = "Vans", BrandLogoUrl = "https://cdn.freebiesupply.com/logos/large/2x/vans-3-logo-png-transparent.png" }
        };

        _db.Brand.AddRange(brands);

        /// Shoe Size


        List<ShoeSize> shoeSizes = new List<ShoeSize>();

        for (int i = 35; i <= 47; i++)
        {
            shoeSizes.Add(new ShoeSize
            {
                ShoeSizeId = i - 34,
                SizeType = "EU",
                SizeNumber = i
            });
        }

        _db.ShoeSize.AddRange(shoeSizes);

        // Product Name
        List<ProductName> productNames = new List<ProductName>
        {
            new ProductName {ProductNameId=1, Name = "Jordan 4 Retro Thunder (2023)" },
            new ProductName {ProductNameId=2,Name = "Nike Air Force 1 '07 White" },
            new ProductName {ProductNameId=3,Name = "Adidas Yeezy Boost 350 V2" },
            new ProductName {ProductNameId=4,Name = "Puma RS-X Reinvention" },
            new ProductName {ProductNameId=5,Name = "Converse Chuck Taylor All Star" },
            new ProductName {ProductNameId=6,Name = "New Balance 550 White/Green" },
            new ProductName {ProductNameId=7,Name = "Reebok Classic Leather Legacy" },
            new ProductName {ProductNameId=8,Name = "Vans Old Skool Black/White" },
            new ProductName {ProductNameId=9,Name = "ASICS Gel-Kayano 14" },
            new ProductName {ProductNameId=10, Name = "Salomon XT-6 Advanced" }
        };

        // Use a for loop to add 30 more
        for (int i = 11; i <= 41; i++)
        {
            productNames.Add(new ProductName
            {
                ProductNameId = i,
                Name = $"Sneaker Model {i} (2023)"
            });
        }
        _db.ProductName.AddRange(productNames);


        // Permission

        Permission ownerPermission = new Permission
        {
            PermissionId = 1,
            PermissionName = "Manager"
        };

        Permission viceOwnerPermission = new Permission
        {
            PermissionId = 2,
            PermissionName = "Admin"
        };

        Permission staffPermission = new Permission
        {
            PermissionId = 3,
            PermissionName = "User"
        };

        _db.Permission.AddRange(ownerPermission, viceOwnerPermission, staffPermission);



        // Staff 
        List<Staff> staffList = new List<Staff>
{
    new Staff
    {
        StaffFirstname = "JY",
        StaffLastname = "Yodsaphon",
        StaffBirthday = new DateTime(1995, 7, 20), // Example birthday
        Email = "jy@hotmail.com",
        Password = "password123", // Example password
        StaffPhoneNumber = "555-1111",
        Permission = ownerPermission,  // Assign the Permission object directly
    },
    new Staff
    {
        StaffFirstname = "Ta",
        StaffLastname = "Xayyadeth",
        StaffBirthday = new DateTime(1998, 3, 15), // Example birthday
        Email = "ta@hotmail.com",
        Password = "password456", // Example password
        StaffPhoneNumber = "555-2222",
        Permission = viceOwnerPermission, // Assign the Permission object directly
    },
    new Staff
    {
        StaffFirstname = "Rmuay",
        StaffLastname = "Arisara",
        StaffBirthday = new DateTime(2000, 11, 5), // Example birthday
        Email = "muay@hotmail.com",
        Password = "password789", // Example password
        StaffPhoneNumber = "555-3333",
        Permission = staffPermission, // Assign the Permission object directly
    }
};


        _db.Staff.AddRange(staffList);
        _db.SaveChanges();

        return Ok(staffList);

    }

    #endregion

}//ec
