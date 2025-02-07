using System.Net.Http.Headers;
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
            StatusName = "Shipped"
        };

        OrderStatus deliveredStatus = new OrderStatus
        {
            OrderStatusId = 3,
            StatusName = "Succeeded"
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
        List<Province> provinces = new List<Province>();
        List<City> cities = new List<City>();
        List<Village> villages = new List<Village>();
        Random random = new Random();


        for (int i = 1; i <= 18; i++)
        {
            Province province = new Province
            {
                ProvinceId = i,
                ProvinceName = $"ແຂວງທີ {i}",
                ProvinceNameEn = $"Province {i}"
            };
            provinces.Add(province);
        }


        // Generate 24 cities
        for (int i = 1; i <= 24; i++)
        {
            City city = new City
            {
                CityId = i,
                CityName = $"ເມືອງທີ {i}",
                CityNameEn = $"City {i}"
            };
            cities.Add(city);
        }

        // Generate 48 villages
        for (int i = 1; i <= 48; i++)
        {
            Village village = new Village
            {
                VillageId = i,
                VillageName = $"ບ້ານທີ {i}",
                VillageNameEn = $"Village {i}"
            };
            villages.Add(village);
        }

        // Assign 2 villages to each city
        int villageIndex = 0;
        foreach (var city in cities)
        {
            for (int i = 0; i < 2; i++)
            {
                // Assign village to city
                villages[villageIndex].CityId = city.CityId;
                villages[villageIndex].City = city;
                villageIndex++;
            }
        }

        // Assign one city to each of the first 18 provinces
        for (int i = 0; i < 18; i++)
        {
            cities[i].ProvinceId = provinces[i].ProvinceId;
            cities[i].Province = provinces[i];
        }

        // Randomly distribute the remaining 6 cities among the 18 provinces
        for (int i = 18; i < 24; i++)
        {
            int randomProvinceIndex = random.Next(18);
            cities[i].ProvinceId = provinces[randomProvinceIndex].ProvinceId;
            cities[i].Province = provinces[randomProvinceIndex];
        }

        _db.Province.AddRange(provinces);
        _db.City.AddRange(cities);
        _db.Village.AddRange(villages);


        DeliveryService anousithDeliveryService = new DeliveryService
        {
            DeliveryCompanyName = "Anousith Express",
            BranchLocations = new List<BranchLocation>()
        };
        DeliveryService mixayDeliveryService = new DeliveryService
        {
            DeliveryCompanyName = "Mixay Express",
            BranchLocations = new List<BranchLocation>()

        };

        DeliveryService halDeliveryService = new DeliveryService
        {
            DeliveryCompanyName = "HAL Express",
            BranchLocations = new List<BranchLocation>()
        };

        Province blankProvince = new Province
        {
            ProvinceId = 69,
            ProvinceName = "-",
        };

        City blankCity = new City
        {
            CityId = 69,
            CityName = "-",
            Province = blankProvince
        };

        Village blankVillage = new Village
        {
            VillageId = 69,
            VillageName = "-",
            City = blankCity
        };

        DeliveryService blankService = new DeliveryService
        {
            DeliveryServiceId = 69,
            DeliveryCompanyName = "-",
            BranchLocations = new List<BranchLocation>{
                new BranchLocation{
                    BranchLocationId = 669,
                    Province = blankProvince,
                    City = blankCity,
                    Village = blankVillage
                }
            }
        };

        List<Province> GetRandomProvinces(List<Province> allProvinces, int count)
        {
            List<Province> randomProvinces = new List<Province>();

            while (randomProvinces.Count < count && allProvinces.Count > 0)
            {
                int index = random.Next(allProvinces.Count);
                randomProvinces.Add(allProvinces[index]);
                allProvinces.RemoveAt(index);
            }

            return randomProvinces;
        }


        // Iterate over all provinces
        foreach (var province in provinces)
        {
            // Get a list of cities that belong to the current province
            var provinceCities = cities.Where(c => c.ProvinceId == province.ProvinceId).ToList();

            // Get a random city from the list of provinceCities for each delivery service
            foreach (var deliveryService in new[] { anousithDeliveryService, mixayDeliveryService, halDeliveryService })
            {
                // Get a random city from the list of provinceCities
                var randomCity = provinceCities[random.Next(provinceCities.Count)];

                // Get a random village associated with the random city
                var randomVillage = villages.Where(v => v.CityId == randomCity.CityId).OrderBy(v => Guid.NewGuid()).FirstOrDefault();

                // Create a new BranchLocation and assign properties
                BranchLocation branchLocation = new BranchLocation
                {
                    Province = province,
                    City = randomCity,
                    Village = randomVillage
                };

                // Add the BranchLocation to the DeliveryService's BranchLocations
                deliveryService.BranchLocations.Add(branchLocation);
            }
        }
        _db.DeliveryService.AddRange(anousithDeliveryService, mixayDeliveryService, halDeliveryService, blankService);



        // Define the start and end dates of your range
        DateTime startDate = new DateTime(2023, 12, 1);
        DateTime endDate = new DateTime(2024, 12, 31);

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

        Discount discount6 = new Discount
        {
            DiscountId = 6,
            MinSpend = 0,
            DiscountPercentage = 0,
            MaxDiscountAmount = 0,
            Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
            Duration = 0,
            Amount = 0,
            ShippingMethod = inStoreMethod,
            Description = "-"
        };

        List<Discount> discountList = new List<Discount> { discount1, discount2, discount3, discount4, discount5, discount6 };

        // _db.Discount.AddRange(discount1, discount2, discount3, discount4, discount5);

        Permission ownerPermissopn = new Permission
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

        _db.Permission.AddRange(ownerPermissopn, viceOwnerPermission, staffPermission);

        Staff jameOwner = new Staff
        {
            StaffId = 1,
            StaffFirstname = "Yodsaphon",
            StaffLastname = "Lousomboune",
            StaffBirthday = new DateTime(1999, 1, 2),
            Email = "jy@hotmail.com",
            StaffPhoneNumber = "65498463541",
            Permission = ownerPermissopn

        };

        Staff taStaff = new Staff
        {
            StaffId = 2,
            StaffFirstname = "Ta",
            StaffLastname = "Xayyadeth",
            StaffBirthday = new DateTime(1999, 7, 8),
            Email = "ta@hotmail.com",
            StaffPhoneNumber = "65498463541",
            Permission = viceOwnerPermission

        };

        Staff muayStaff = new Staff
        {
            StaffId = 3,
            StaffFirstname = "Rmuay",
            StaffLastname = "Arisara",
            StaffBirthday = new DateTime(2000, 10, 26),
            Email = "muay@hotmail.com",
            StaffPhoneNumber = "275781578",
            Permission = viceOwnerPermission


        };


        List<Staff> staffList = new List<Staff> { jameOwner, taStaff, muayStaff, };

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
                CustomerFirstname = firstName,
                CustomerLastname = lastName,
                CustomerBirthday = birthday,
                CustomerPhoneNumber = phoneNumber,
                CustomerSocialLink = "blank",
                Gender = gender,
                Email = email,
                Locations = new List<Location>()

            };
            customers.Add(customer);
        }
        
        List<Province> randomProvinces = GetRandomProvinces(provinces, random.Next(1, provinces.Count));

        foreach (var customer in customers)
        {
            // Get a random province
            var randomProvince = randomProvinces[random.Next(randomProvinces.Count)];

            // Get a list of cities that belong to the current province
            var provinceCities = cities.Where(c => c.ProvinceId == randomProvince.ProvinceId).ToList();

            // Get a random city from the list of provinceCities
            var randomCity = provinceCities[random.Next(provinceCities.Count)];

            // Get a random village associated with the random city
            var randomVillage = villages.Where(v => v.CityId == randomCity.CityId).OrderBy(v => Guid.NewGuid()).FirstOrDefault();
            
            // Create the location for the customer
            Location randomLocation = new Location
            {
                Province = randomProvince,
                City = randomCity,
                Village = randomVillage
            };

            // Add the location to the customer's list of locations
            customer.Locations.Add(randomLocation);
        }

        Customer annoCustomer = new Customer
        {
            CustomerFirstname = "-",
            CustomerLastname = "-",
            CustomerBirthday = DateTime.Now.AddDays(-random.Next(365 * 90)),
            CustomerPhoneNumber = "-",
            CustomerSocialLink = "-",
            Gender = "-",
            Email = "-",
            Locations = new List<Location>{
                    new Location{
                        Province = blankProvince,
                        City = blankCity,
                        Village = blankVillage
                    }
                }
        };


        _db.Customer.Add(annoCustomer);
        _db.Customer.AddRange(customers);

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


                List<Collection> nikeCollections = new List<Collection>();

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
                    Collection nikeCollection = new Collection
                    {
                        CollectionName = nikeCollectionNames[i],
                    };
                    nikeCollections.Add(nikeCollection);
                }


                List<Collection> adidasCollections = new List<Collection>();

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
                    Collection adidasCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    adidasCollections.Add(adidasCollection);
                }


                List<Collection> jordanCollections = new List<Collection>();

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
                    Collection jordanCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    jordanCollections.Add(jordanCollection);
                }

                List<Collection> pumaCollections = new List<Collection>();

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
                    Collection pumaCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    pumaCollections.Add(pumaCollection);
                }

                List<Collection> converseCollections = new List<Collection>();


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
                    Collection converseCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    converseCollections.Add(converseCollection);
                }

                List<Collection> newBalanceCollections = new List<Collection>();


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
                    Collection newBalanceCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    newBalanceCollections.Add(newBalanceCollection);
                }


                List<Collection> reebokCollections = new List<Collection>();


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
                    Collection reebokCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    reebokCollections.Add(reebokCollection);
                }

                List<Collection> vansCollections = new List<Collection>();

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
                    Collection vansCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    vansCollections.Add(vansCollection);
                }


                List<Collection> underArmourCollections = new List<Collection>();


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
                    Collection underArmourCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    underArmourCollections.Add(underArmourCollection);
                }


                List<Collection> asicsCollections = new List<Collection>();

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
                    Collection asicsCollection = new Collection
                    {
                        CollectionName = collectionName
                    };
                    asicsCollections.Add(asicsCollection);
                }


                _db.Collection.AddRange(nikeCollections);
                _db.Collection.AddRange(adidasCollections);
                _db.Collection.AddRange(jordanCollections);
                _db.Collection.AddRange(pumaCollections);
                _db.Collection.AddRange(converseCollections);
                _db.Collection.AddRange(newBalanceCollections);
                _db.Collection.AddRange(reebokCollections);
                _db.Collection.AddRange(vansCollections);
                _db.Collection.AddRange(underArmourCollections);
                _db.Collection.AddRange(asicsCollections);


                List<List<Collection>> allCollections = new List<List<Collection>>()
                {
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

                // Loop through each brand
                for (int i = 0; i < allCollections.Count; i++)
                {
                    List<Collection> brandCollections = allCollections[i];
                    List<BrandWithCollection> brandCollection = new List<BrandWithCollection>();

                    // Loop through each collection within the current brand
                    for (int j = 0; j < brandCollections.Count; j++)
                    {
                        Collection productCollection = brandCollections[j];
                        brandCollection.Add(new BrandWithCollection
                        {
                            Collection = productCollection
                        });

                    }

                    Brand brand = new Brand
                    {
                        BrandId = i + 1,
                        BrandName = brandNameList[i],
                        BrandLogoUrl = "blank",
                        BrandWithCollections = brandCollection
                    };

                    brands.Add(brand);
                }
                _db.Brand.AddRange(brands);



                List<Product> mockProducts = new List<Product>();
                int countProductWithSize = 0;

                // TODO: Cont. from this

                for (int brandIndex = 0; brandIndex < brands.Count; brandIndex++)
                {
                    List<BrandWithCollection> brandWithCollections = brands[brandIndex].BrandWithCollections;

                    // Loop through each collection within the current brand
                    for (int collectionIndex = 0; collectionIndex < brandWithCollections.Count; collectionIndex++)
                    {
                        Collection collection = brandWithCollections[collectionIndex].Collection;

                        // Randomly select a product size index within the range of available sizes
                        int randomSizeIndex = random.Next(allProductsWithSizes[brandIndex].Count);

                        // Get the randomly selected product size
                        ProductWithSize productWithSize = allProductsWithSizes[brandIndex][randomSizeIndex];

                        // Create a mock product
                        Product mockProduct = new Product
                        {
                            Barcode = "SampleBarcode",
                            ProductName = $"{collection.CollectionName} Mock Product",
                            CostPrice = random.Next(30, 80), // Random cost price between 3000 and 8000
                            SellingPrice = 0, // Will be calculated below
                            Sku = "SampleSKU",
                            Colorway = "SampleColorway",
                            Releasedate = DateTime.Now.AddDays(-random.Next(1, 365)), // Random release date within the past year
                            Amountsold = random.Next(151), // Random amount sold
                            ProductWithSizes = allProductsWithSizes[countProductWithSize],
                            Brand = brands[brandIndex],
                            Collection = collection,
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
                        DepositMoney = 2000,
                        Discount = discountList[random.Next(discountList.Count)], // Random discount
                        DeliveryService = anousithDeliveryService,
                        AdditionalAddressInfo = "ສາຂາໂນນຫິນແຫ່",
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
                            ItemQty = random.Next(1, 6), // Generates a random number between 1 and 5 (inclusive)
                            Product = mockProducts[random.Next(mockProducts.Count)] // Random product from mockProducts list
                        };

                        bill.BillItems.Add(billItem);
                    }

                    bills.Add(bill);
                }

                foreach (var bill in bills)
                {
                    // Get a random province
                    var randomProvince = randomProvinces[random.Next(randomProvinces.Count)];

                    // Get a list of cities that belong to the current province
                    var provinceCities = cities.Where(c => c.ProvinceId == randomProvince.ProvinceId).ToList();

                    // Get a random city from the list of provinceCities
                    var randomCity = provinceCities[random.Next(provinceCities.Count)];

                    // Get a random village associated with the random city
                    var randomVillage = villages.Where(v => v.CityId == randomCity.CityId).OrderBy(v => Guid.NewGuid()).FirstOrDefault();
                    

                    bill.Province = randomProvince;
                    bill.City = randomCity;
                    bill.Village = randomVillage;
                }

                _db.Bill.AddRange(bills);


                // // //         // Add all bills to the database
                _db.SaveChanges();

        var result = _db.Bill.ToList();
        return Ok(result);


    }



    #endregion

}//ec
