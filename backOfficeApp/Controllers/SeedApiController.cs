using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/initialization/[action]")]
public class SeedApiController : ControllerBase
{
    private readonly ILogger<SeedApiController> _logger;
    private BackofficeappDbContext _db;

    public SeedApiController(ILogger<SeedApiController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }


    #region ACTIONS

    [HttpPost]
    public IActionResult SeedData()

    {

Console.WriteLine("Start Seeding.... ");

        OrderStatus pendingStatus = new OrderStatus
        {
            OrderStatusId = 1,
            StatusName = "Pending"
        };

        OrderStatus paidStatus = new OrderStatus
        {
            OrderStatusId = 2,
            StatusName = "Paid"
        };

        OrderStatus deliveredStatus = new OrderStatus
        {
            OrderStatusId = 3,
            StatusName = "Delivered"
        };

        List<OrderStatus> orderStatuses = new List<OrderStatus> {
        pendingStatus,
        paidStatus,
        deliveredStatus
    };

        // _db.OrderStatus.AddRange(pendingStatus, paidStatus, deliveredStatus);

        ShippingMethod inStoreMethod = new ShippingMethod
        {
            ShippingMethodId = 1,
            MethodName = "In-store",
        };

        ShippingMethod deliveryMethod = new ShippingMethod
        {
            ShippingMethodId = 2,
            MethodName = "Delivery",
        };

        List<ShippingMethod> listShippingMethods = new List<ShippingMethod> {
        inStoreMethod,
        deliveryMethod,
    };

        // _db.ShippingMethod.AddRange(inStoreMethod, deliveryMethod);

        Branch anousithBranch1 = new Branch
        {
            BranchName = "ສາຂາ ໂພນຕ້ອງສະຫວາດ(ຈັນທະບູລີ)",
            BranchTelNumbers = new List<BranchTelNumber>{
        new BranchTelNumber{
            TelNumber = "020 95960461"
        },
        new BranchTelNumber{
            TelNumber = "030 5472217"
        },
}
        };

        Branch anousithBranch2 = new Branch
        {
            BranchName = "ສາຂາ ນາແຮ່",
            BranchTelNumbers = new List<BranchTelNumber>{
        new BranchTelNumber{
            TelNumber = "020 58646635"
        },
        new BranchTelNumber{
            TelNumber = "0305207804"
        },
}
        };
        Branch anousithBranch3 = new Branch
        {
            BranchName = "ສາຂາ ໜອງໄຮ(ເມືອງສີສັດຕະນາກ)",
            BranchTelNumbers = new List<BranchTelNumber>{
        new BranchTelNumber{
            TelNumber = "96686664"
        },
        new BranchTelNumber{
            TelNumber = "030 5207709"
        },
}
        };
        Branch anousithBranch4 = new Branch
        {
            BranchName = "ສາຂາ ໂນນສະອາດ(ໄຊທານີ)",
            BranchTelNumbers = new List<BranchTelNumber>{
        new BranchTelNumber{
            TelNumber = "030 5472100"
        }
}
        };

        // _db.Branch.AddRange(anousithBranch1, anousithBranch2, anousithBranch3, anousithBranch4);

        DeliveryService anousithDeliveryService = new DeliveryService
        {
            DeliveryServiceId = 1,
            DeliveryCompanyName = "Anousith Express",
            DeliveryBranches = new List<DeliveryBranch> {
        new DeliveryBranch {
            Branch = anousithBranch1
        },
          new DeliveryBranch {
            Branch = anousithBranch2
        },
          new DeliveryBranch {
            Branch = anousithBranch3
        },
          new DeliveryBranch {
            Branch = anousithBranch4
        },

    },


        };


        // _db.DeliveryService.Add(anousithDeliveryService);

        DeliveryService MDeliveryService = new DeliveryService
        {
            DeliveryServiceId = 1,
            DeliveryCompanyName = "M Express"
        };

        // Define the start and end dates of your range
        DateTime startDate = new DateTime(2023, 12, 1);
        DateTime endDate = new DateTime(2024, 12, 31);
        Random random = new Random();

        Discount discount1 = new Discount
        {
            DiscountPercentage = 10,
            MaxDiscountAmount = 500,
            DiscountId = 1,
            MinSpend = 2000,
            Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
            Duration = 30,
            Amount = 100,
            ShippingMethod = inStoreMethod,
            Description = "Valentime Discount"
        };

        Discount discount2 = new Discount
        {
            DiscountPercentage = 15,
            MaxDiscountAmount = 1000,
            DiscountId = 2,
            MinSpend = 3000,
            Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
            Duration = 30,
            Amount = 10,
            ShippingMethod = deliveryMethod,
            Description = "Christmas Discount"
        };

        Discount discount3 = new Discount
        {
            DiscountId = 3,
            MinSpend = 1000,
            DiscountPercentage = 5,
            MaxDiscountAmount = 200,
            Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
            Duration = 15,
            Amount = 10,
            ShippingMethod = inStoreMethod,
            Description = "Hallowine Discount"
        };

        Discount discount4 = new Discount
        {
            DiscountId = 4,
            MinSpend = 10000,
            DiscountPercentage = 9,
            MaxDiscountAmount = 99,
            Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
            Duration = 10,
            Amount = 10,
            ShippingMethod = deliveryMethod,
            Description = "New year Discount"
        };

        Discount discount5 = new Discount
        {
            DiscountId = 5,
            MinSpend = 15000,
            DiscountPercentage = 10,
            MaxDiscountAmount = 150,
            Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
            Duration = 5,
            Amount = 10,
            ShippingMethod = inStoreMethod,
            Description = "Lunar New Year Discount"
        };

        List<Discount> discountList = new List<Discount> { discount1, discount2, discount3, discount4, discount5 };

        // _db.Discount.AddRange(discount1, discount2, discount3, discount4, discount5);

        Permission ownerPermissopn = new Permission
        {
            PermissionId = 1,
            PermissionName = "Owner"
        };

        Permission viceOwnerPermission = new Permission
        {
            PermissionId = 2,
            PermissionName = "Vice-owner"
        };

        Permission staffPermission = new Permission
        {
            PermissionId = 3,
            PermissionName = "Staff"
        };

        // _db.Permission.AddRange(ownerPermissopn, viceOwnerPermission, staffPermission);

        Staff taStaff = new Staff
        {
            StaffId = 1,
            StaffFirstname = "Ta",
            StaffLastname = "Xayyadeth",
            StaffBirthday = new DateTime(1999, 7, 8),
            Email = "tasmth@hotmail.com",
            StaffPhoneNumber = "65498463541",
            Permission = viceOwnerPermission

        };

        Staff muayStaff = new Staff
        {
            StaffId = 2,
            StaffFirstname = "Rmuay",
            StaffLastname = "Arisara",
            StaffBirthday = new DateTime(2000, 10, 26),
            Email = "muaysmth@hotmail.com",
            StaffPhoneNumber = "275781578",
            Permission = viceOwnerPermission


        };

        // _db.Staff.AddRange(taStaff, muayStaff);

        List<Staff> staffList = new List<Staff> { taStaff, muayStaff };

        List<Customer> customers = new List<Customer>();

        string[] firstNames = { "John", "Emma", "Michael", "Sophia", "William", "Olivia", "James", "Ava", "Alexander", "Isabella" };
        string[] lastNames = { "Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor" };


        for (int i = 1; i <= 10; i++)
        {
            string firstName = firstNames[random.Next(firstNames.Length)];
            string lastName = lastNames[random.Next(lastNames.Length)];
            DateTime birthday = DateTime.Now.AddDays(-random.Next(365 * 90)); // Random birthday within the past 90 years
            string phoneNumber = $"{random.Next(100000000, 999999999):#########}"; // Random 9-digit phone number
            string gender = random.Next(2) == 0 ? "male" : "female"; // Randomly select gender
            if (random.Next(10) < 2) // 20% chance to select lb or tom
            {
                gender = random.Next(2) == 0 ? "lb" : "tom";
            }
            string email = $"{firstName.ToLower()}.{lastName.ToLower()}{i}@example.com"; // Construct email address

            Customer customer = new Customer
            {
                CustomerId = i,
                CustomerFirstname = firstName,
                CustomerLastname = lastName,
                CustomerBirthday = birthday,
                CustomerPhoneNumber = phoneNumber,
                CustomerSocialLink = "blank",
                Gender = gender,
                Email = email
            };

            customers.Add(customer);
        }

        // _db.Customer.AddRange(customers);


        ProductCondition brandNewCondition = new ProductCondition
        {
            ProductConditionId = 1,
            ConditionName = "Brand new"
        };

        ProductCondition preOwnedCondition = new ProductCondition
        {
            ProductConditionId = 2,
            ConditionName = "Pre-owned"
        };

        List<ProductCondition> productConditionList = new List<ProductCondition> { brandNewCondition, preOwnedCondition };

        List<ShoeSize> shoeSizes = new List<ShoeSize>();

        for (double size = 35.5; size <= 52.5; size += 0.5)
        {
            ShoeSize shoeSize = new ShoeSize
            {
                SizeType = "EU",
                SizeNumber = size
            };

            shoeSizes.Add(shoeSize);
        }

        List<List<ProductWithSize>> allProductsWithSizes = new List<List<ProductWithSize>>();

        for (int j = 0; j < 100; j++)
        {
            List<ProductWithSize> productWithSizes = new List<ProductWithSize>();

            for (int i = 0; i < shoeSizes.Count; i++)
            {
                int randomQty = random.Next(51); // Generate a random quantity between 0 and 50

                ProductWithSize productWithSize = new ProductWithSize
                {
                    InventoryQty = randomQty,
                    ShoeSize = shoeSizes[i]
                };

                productWithSizes.Add(productWithSize);
            }

            allProductsWithSizes.Add(productWithSizes);
        }



        List<string> brandNameList = new List<string> {
    "Nike",
    "Adidas",
    "Jordan",
    "Puma",
    "Converse",
    "New Balance",
    "Reebok",
    "Vans",
    "Under Armour",
    "ASICS"
};

        List<Brand> brands = new List<Brand>();

        for (int i = 0; i < brandNameList.Count; i++)
        {
            Brand brand = new Brand
            {
                BrandId = i + 1,
                BrandName = brandNameList[i]
            };
            brands.Add(brand);
        }




        List<ProductCollection> nikeCollections = new List<ProductCollection>();

        Brand nikeBrand = brands[0]; // Using the first brand for Nike

        string[] nikeCollectionNames = {
    "Nike Air Force 1",
    "Nike Air Max",
    "Nike Jordan",
    "Nike Blazer",
    "Nike React",
    "Nike Dunk Low",
    "Nike Zoom Fly",
    "Nike Air Max 90",
    "Nike Air Max 97",
    "Nike Air Max 270"
};

        for (int i = 0; i < nikeCollectionNames.Length; i++)
        {
            ProductCollection nikeCollection = new ProductCollection
            {
                CollectionName = nikeCollectionNames[i],
                Brand = nikeBrand
            };
            nikeCollections.Add(nikeCollection);
        }


        List<ProductCollection> adidasCollections = new List<ProductCollection>();

        Brand adidasBrand = brands[1]; // Using the second brand for Adidas

        string[] adidasCollectionNames = {
    "Adidas Superstar",
    "Adidas Stan Smith",
    "Adidas Ultra Boost",
    "Adidas NMD",
    "Adidas Yeezy",
    "Adidas Gazelle",
    "Adidas Originals",
    "Adidas Pharrell",
    "Adidas Terrex",
    "Adidas Duramo"
};

        foreach (string collectionName in adidasCollectionNames)
        {
            ProductCollection adidasCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = adidasBrand
            };
            adidasCollections.Add(adidasCollection);
        }


        List<ProductCollection> jordanCollections = new List<ProductCollection>();

        Brand jordanBrand = brands[2]; // Using the third brand for Jordan

        string[] jordanCollectionNames = {
    "Air Jordan 1",
    "Air Jordan 3",
    "Air Jordan 4",
    "Air Jordan 5",
    "Air Jordan 6",
    "Air Jordan 11",
    "Air Jordan 13",
    "Air Jordan 14",
    "Air Jordan x Off-White",
    "Air Jordan x Travis Scott"
};

        foreach (string collectionName in jordanCollectionNames)
        {
            ProductCollection jordanCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = jordanBrand
            };
            jordanCollections.Add(jordanCollection);
        }

        List<ProductCollection> pumaCollections = new List<ProductCollection>();

        Brand pumaBrand = brands[3]; // Using the fourth brand for Puma

        string[] pumaCollectionNames = {
    "Puma Suede",
    "Puma RS-X",
    "Puma Cali",
    "Puma Thunder",
    "Puma Future Rider",
    "Puma Rider",
    "Puma Basket",
    "Puma Cell",
    "Puma Trinomic",
    "Puma Nova"
};

        foreach (string collectionName in pumaCollectionNames)
        {
            ProductCollection pumaCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = pumaBrand
            };
            pumaCollections.Add(pumaCollection);
        }

        List<ProductCollection> converseCollections = new List<ProductCollection>();

        Brand converseBrand = brands[4]; // Using the fifth brand for Converse

        string[] converseCollectionNames = {
    "Converse Chuck Taylor",
    "Converse One Star",
    "Converse Jack Purcell",
    "Converse All Star",
    "Converse Run Star Hike",
    "Converse Renew",
    "Converse Lifestyle",
    "Converse Skateboarding",
    "Converse Collaborations",
    "Converse Custom"
};

        foreach (string collectionName in converseCollectionNames)
        {
            ProductCollection converseCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = converseBrand
            };
            converseCollections.Add(converseCollection);
        }

        List<ProductCollection> newBalanceCollections = new List<ProductCollection>();

        Brand newBalanceBrand = brands[5]; // Using the sixth brand for New Balance

        string[] newBalanceCollectionNames = {
    "New Balance 574",
    "New Balance 990",
    "New Balance 997",
    "New Balance 1500",
    "New Balance 530",
    "New Balance 860",
    "New Balance Fresh Foam",
    "New Balance FuelCore",
    "New Balance Lifestyle",
    "New Balance Numeric"
};

        foreach (string collectionName in newBalanceCollectionNames)
        {
            ProductCollection newBalanceCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = newBalanceBrand
            };
            newBalanceCollections.Add(newBalanceCollection);
        }


        List<ProductCollection> reebokCollections = new List<ProductCollection>();

        Brand reebokBrand = brands[6]; // Using the seventh brand for Reebok

        string[] reebokCollectionNames = {
    "Reebok Classic",
    "Reebok Nano",
    "Reebok Club C",
    "Reebok ZigTech",
    "Reebok Instapump Fury",
    "Reebok Workout",
    "Reebok Question",
    "Reebok Nano X",
    "Reebok Floatride",
    "Reebok CrossFit"
};

        foreach (string collectionName in reebokCollectionNames)
        {
            ProductCollection reebokCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = reebokBrand
            };
            reebokCollections.Add(reebokCollection);
        }

        List<ProductCollection> vansCollections = new List<ProductCollection>();

        Brand vansBrand = brands[7]; // Assuming Vans is the eighth brand in the list

        string[] vansCollectionNames = {
    "Vans Authentic",
    "Vans Old Skool",
    "Vans Sk8-Hi",
    "Vans Era",
    "Vans Slip-On",
    "Vans Checkerboard",
    "Vans Vault",
    "Vans Surf",
    "Vans Pro Skate",
    "Vans Off The Wall"
};

        foreach (string collectionName in vansCollectionNames)
        {
            ProductCollection vansCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = vansBrand
            };
            vansCollections.Add(vansCollection);
        }



        List<ProductCollection> underArmourCollections = new List<ProductCollection>();

        Brand underArmourBrand = brands[8]; // Assuming Under Armour is the ninth brand in the list

        string[] underArmourCollectionNames = {
    "Under Armour HOVR",
    "Under Armour Sportstyle",
    "Under Armour Forge",
    "Under Armour Speedform",
    "Under Armour Threadborne",
    "Under Armour Charged",
    "Under Armour Rush",
    "Under Armour Surge",
    "Under Armour Breathe",
    "Under Armour HeatGear"
};

        foreach (string collectionName in underArmourCollectionNames)
        {
            ProductCollection underArmourCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = underArmourBrand
            };
            underArmourCollections.Add(underArmourCollection);
        }


        List<ProductCollection> asicsCollections = new List<ProductCollection>();

        Brand asicsBrand = brands[9]; // Assuming ASICS is the tenth brand in the list

        string[] asicsCollectionNames = {
    "ASICS GEL-Kayano",
    "ASICS GEL-Nimbus",
    "ASICS GEL-Cumulus",
    "ASICS GEL-Lyte",
    "ASICS GEL-Quantum",
    "ASICS GEL-Kayano Lite",
    "ASICS GEL-Kayano 25",
    "ASICS GEL-Kayano 26",
    "ASICS GEL-Kayano 27",
    "ASICS GEL-Kayano Trainer"
};




        foreach (string collectionName in asicsCollectionNames)
        {
            ProductCollection asicsCollection = new ProductCollection
            {
                CollectionName = collectionName,
                Brand = asicsBrand
            };
            asicsCollections.Add(asicsCollection);
        }

        List<List<ProductCollection>> allBrandsCollections = new List<List<ProductCollection>>{
            nikeCollections,
            adidasCollections,
            jordanCollections,
            pumaCollections,
            converseCollections,
            newBalanceCollections,
            reebokCollections,
            vansCollections,
            underArmourCollections,
            asicsCollections
    };


        _db.ProductCollection.AddRange(nikeCollections);
        _db.ProductCollection.AddRange(adidasCollections);
        _db.ProductCollection.AddRange(jordanCollections);
        _db.ProductCollection.AddRange(pumaCollections);
        _db.ProductCollection.AddRange(converseCollections);
        _db.ProductCollection.AddRange(newBalanceCollections);
        _db.ProductCollection.AddRange(reebokCollections);
        _db.ProductCollection.AddRange(vansCollections);
        _db.ProductCollection.AddRange(underArmourCollections);
        _db.ProductCollection.AddRange(asicsCollections);




List<Product> mockProducts = new List<Product>();
int countProductWithSize = 0;

for (int brandIndex = 0; brandIndex < allBrandsCollections.Count; brandIndex++)
{
    List<ProductCollection> brandCollections = allBrandsCollections[brandIndex];
    
    // Loop through each collection within the current brand
    for (int collectionIndex = 0; collectionIndex < brandCollections.Count; collectionIndex++)
    {
        ProductCollection productCollection = brandCollections[collectionIndex];

        // Randomly select a product size index within the range of available sizes
        int randomSizeIndex = random.Next(allProductsWithSizes[brandIndex].Count);

        // Get the randomly selected product size
        ProductWithSize productWithSize = allProductsWithSizes[brandIndex][randomSizeIndex];

        // Create a mock product
        Product mockProduct = new Product
        {
            Barcode = "SampleBarcode",
            ProductName = $"{productCollection.CollectionName} Mock Product",
            CostPrice = random.Next(30, 80), // Random cost price between 3000 and 8000
            SellingPrice = 0, // Will be calculated below
            Sku = "SampleSKU",
            Colorway = "SampleColorway",
            Releasedate = DateTime.Now.AddDays(-random.Next(1, 365)), // Random release date within the past year
            Amountsold = random.Next(151), // Random amount sold
            ProductWithSizes = allProductsWithSizes[countProductWithSize],
            ProductCollection = productCollection,
            ProductImageUrl = "blank"
        };

        mockProduct.CostPrice = mockProduct.CostPrice * 100;
        // Set selling price as cost price plus 200
        mockProduct.SellingPrice = mockProduct.CostPrice + 200;
        countProductWithSize++;
        // Add the mock product to DB
        mockProducts.Add(mockProduct);
    }
}

    _db.Product.AddRange(mockProducts);


List<Bill> bills = new List<Bill>();
for (int i = 0; i < 10; i++)
{
    Bill bill = new Bill
    {
        OrderDate = startDate.AddDays(random.Next((endDate - startDate).Days)),
        OrderStatus = orderStatuses[random.Next(orderStatuses.Count)], // Random order status
        ShippingMethod = listShippingMethods[random.Next(listShippingMethods.Count)], // Random shipping method
        CustomerTransferPicPath = "SomeWhereInAssets",
        ShippingReceipt = "AlsoSomeWhereInAssets",
        Discount = discountList[random.Next(discountList.Count)], // Random discount
        Branch = anousithDeliveryService.DeliveryBranches[0].Branch,
        DeliveryService = anousithDeliveryService,
        Staff = staffList[random.Next(staffList.Count)], // Random staff
        Customer = customers[random.Next(customers.Count)], // Random customer
        BillItems = new List<BillItem>()
    };

    int numberOfItems = random.Next(1, 6); // Random number of bill items between 1 and 5

    for (int j = 0; j < numberOfItems; j++)
    {
        BillItem billItem = new BillItem
        {
            ShoeSize = shoeSizes[random.Next(shoeSizes.Count)], // Random shoe size
            ProductCondition = productConditionList[random.Next(productConditionList.Count)], // Random product condition
            ItemQty = random.Next(6),
            Product = mockProducts[random.Next(mockProducts.Count)] // Random product from mockProducts list
        };

        bill.BillItems.Add(billItem);
    }

    bills.Add(bill);
}

_db.Bill.AddRange(bills);


// //         // Add all bills to the database
        _db.Bill.AddRange(bills);
        _db.SaveChanges();

        var result = _db.Bill.ToList();
        return Ok(result);


    }

    #endregion

}//ec
