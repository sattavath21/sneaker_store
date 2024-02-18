// using Microsoft.AspNetCore.Mvc;
// using Microsoft.EntityFrameworkCore;

// [ApiController]
// [Route("api/initialization/[action]")]
// public class StartUpApiController : ControllerBase
// {
//     private readonly ILogger<StartUpApiController> _logger;
//     private BackofficeappDbContext _db;

//     public StartUpApiController(ILogger<StartUpApiController> logger, BackofficeappDbContext db)
//     {
//         _logger = logger;
//         _db = db;
//     }


//     #region ACTIONS

//     [HttpPost]
//     public IActionResult SeedData()
    
// {

//     OrderStatus pendingStatus = new OrderStatus{
//         OrderStatusId = 0,
//         StatusName = "Pending"
//     };

//      OrderStatus paidStatus = new OrderStatus{
//         OrderStatusId = 1,
//         StatusName = "Paid"
//     };

//       OrderStatus deliveredStatus = new OrderStatus{
//         OrderStatusId = 2,
//         StatusName = "Delivered"
//     };

//     _db.OrderStatus.AddRange(pendingStatus, paidStatus, deliveredStatus);

//     ShippingMethod inStoreMethod = new ShippingMethod{
//         ShippingMethodId = 0,
//         MethodName = "In-store",
        
//     };

//      ShippingMethod deliveryMethod = new ShippingMethod{
//         ShippingMethodId = 1,
//         MethodName = "Delivery",
        
//     };

//     _db.ShippingMethod.AddRange(inStoreMethod, deliveryMethod);

//     Branch anousithBranch1 = new Branch{
//         BranchName = "ສາຂາ ໂພນຕ້ອງສະຫວາດ(ຈັນທະບູລີ)",
//         BranchTelNumbers = new List<BranchTelNumber>{
//         new BranchTelNumber{
//             TelNumber = "020 95960461"
//         },
//         new BranchTelNumber{
//             TelNumber = "030 5472217"
//         },
// }
//     };

//     Branch anousithBranch2 = new Branch{
//         BranchName = "ສາຂາ ນາແຮ່",
//         BranchTelNumbers = new List<BranchTelNumber>{
//         new BranchTelNumber{
//             TelNumber = "020 58646635"
//         },
//         new BranchTelNumber{
//             TelNumber = "0305207804"
//         },
// }
//     };
//     Branch anousithBranch3 = new Branch{
//         BranchName = "ສາຂາ ໜອງໄຮ(ເມືອງສີສັດຕະນາກ)",
//         BranchTelNumbers = new List<BranchTelNumber>{
//         new BranchTelNumber{
//             TelNumber = "96686664"
//         },
//         new BranchTelNumber{
//             TelNumber = "030 5207709"
//         },
// }
//     };
//     Branch anousithBranch4 = new Branch{
//         BranchName = "ສາຂາ ໂນນສະອາດ(ໄຊທານີ)",
//         BranchTelNumbers = new List<BranchTelNumber>{
//         new BranchTelNumber{
//             TelNumber = "030 5472100"
//         }
// }
//     };

//     _db.Branch.AddRange(anousithBranch1, anousithBranch2, anousithBranch3, anousithBranch4);

//     DeliveryService anousithDeliveryService = new DeliveryService{
//         DeliveryServiceId = 0,
//         DeliveryCompanyName = "Anousith Express",
//        DeliveryBranches = new List<DeliveryBranch> {
//         new DeliveryBranch {
//             Branch = anousithBranch1
//         },
//           new DeliveryBranch {
//             Branch = anousithBranch2
//         },
//           new DeliveryBranch {
//             Branch = anousithBranch3
//         },
//           new DeliveryBranch {
//             Branch = anousithBranch4
//         },

//         // Add anousithBranch3, anousithBranch4, etc. here
//     },


//     };


//     _db.DeliveryService.Add(anousithDeliveryService);

//     DeliveryService MDeliveryService = new DeliveryService{
//         DeliveryServiceId = 1,
//         DeliveryCompanyName = "M Express"
//     };

 
//         // Define the start and end dates of your range
//         DateTime startDate = new DateTime(2023, 12, 1);
//         DateTime endDate = new DateTime(2024, 12, 31);
//         Random random = new Random();

//     Discount discount1 = new Discount{
//             DiscountPercentage = 10,
//             MaxDiscountAmount = 500,
//             DiscountId = 0,
//             MinSpend = 2000,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 100,
//             ShippingMethod = inStoreMethod,
//             Description = "Valentime Discount"
//         };

//           Discount discount2 = new Discount{
//                  DiscountPercentage = 15,
//             MaxDiscountAmount = 1000,
//             DiscountId = 0,
//             MinSpend = 3000,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Christmas Discount"
//         };

//           Discount discount3 = new Discount{
//             DiscountId = 0,
//             MinSpend = 1000,
//              DiscountPercentage = 5,
//             MaxDiscountAmount = 200,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 15,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Hallowine Discount"
//         };

//           Discount discount4 = new Discount{
//             DiscountId = 0,
//             MinSpend = 10000,
//              DiscountPercentage = 9,
//             MaxDiscountAmount = 99,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 10,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "New year Discount"
//         };

//           Discount discount5 = new Discount{
//             DiscountId = 0,
//             MinSpend = 15000,
//                    DiscountPercentage = 10,
//             MaxDiscountAmount = 150,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 5,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Lunar New Year Discount"
//         };

//     _db.Discount.AddRange(discount1,discount2,discount3,discount4,discount5);

//     Permission ownerPermissopn = new Permission{
//         PermissionId = 0,
//         PermissionName = "Owner"
//     };

//         Permission viceOwnerPermission = new Permission{
//         PermissionId = 0,
//         PermissionName = "Vice-owner"
//     };

//             Permission staffPermission = new Permission{
//         PermissionId = 0,
//         PermissionName = "Staff"
//     };

//     _db.Permission.AddRange(ownerPermissopn, viceOwnerPermission, staffPermission);

//     Staff taStaff = new Staff {
//         StaffId = 0,
//         StaffFirstname = "Ta",
//         StaffLastname = "Xayyadeth",
//         StaffBirthday = new DateTime(1999, 7, 8),
//         Email = "tasmth@hotmail.com",
//         StaffPhoneNumber = "65498463541",
//         Permission = viceOwnerPermission

//     };

//       Staff muayStaff = new Staff {
//         StaffId = 1,
//         StaffFirstname = "Rmuay",
//         StaffLastname = "Arisara",
//         StaffBirthday =new DateTime(2000, 10, 26),
//         Email = "muaysmth@hotmail.com",
//         StaffPhoneNumber = "275781578",
//                 Permission = viceOwnerPermission


//     };

//     _db.Staff.AddRange(taStaff, muayStaff);

//     Customer customer1 = new Customer{
//         CustomerId = 0,
//         CustomerFirstname = "Sasaki",
//         CustomerLastname = "Kojiro",
//         CustomerBirthday = new DateTime(1612, 4, 13),
//         CustomerPhoneNumber = "45646549844",
//         CustomerSocialLink = "https://www.facebook.com/profile.php?id=100067397717269",
//         Gender = "male",
//         Email = "sasakismth@hotmail.com"
//     };

//     _db.Customer.AddRange(customer1);

//     List<ShoeSize> shoeSizes = new List<ShoeSize>();

//     for (double size = 35.5; size <= 52.5; size += 0.5)
//     {
//         int id = (int)((size - 35.5) * 2); // Calculate id based on index
//         ShoeSize shoeSize = new ShoeSize
//         {
//             ShoeSizeId = id,
//             SizeType = "EU",
//             SizeNumber = size
//         };
        
//         shoeSizes.Add(shoeSize);
//     }

//     ProductCondition brandNewCondition = new ProductCondition{
//         ProductConditionId = 0,
//         ConditionName = "Brand new"
//     };

//     ProductCondition preOwnedCondition = new ProductCondition{
//         ProductConditionId = 1,
//         ConditionName = "Pre-owned"
//     };

  
//     List<ProductWithSize> productWithSizes = new List<ProductWithSize>();

//     for (int i = 0; i < shoeSizes.Count; i++)
//     {
//         int randomQty = random.Next(51); // Generate a random quantity between 0 and 50

//         ProductWithSize productWithSize = new ProductWithSize
//         {
//             InventoryQty = randomQty,
//             ShoeSize = shoeSizes[i]
//         };

//         productWithSizes.Add(productWithSize);
//     }

    


//     Product product1 = new Product{
//         Barcode = ";laskd;alsdk;alsd;laskd",
//         ProductName = "Jordan 4 Retro Thunder (2023)",
//         CostPrice = 5000,
//         SellingPrice = 5200,
//         Sku = "DH6927-017",
//         Colorway= "BLACK/TOUR YELLOW",
//         Releasedate = new DateTime(2023,12,3),
//         Amountsold = random.Next(151),
//         ProductWithSizes = productWithSizes,

//     };


//     Bill bill = new Bill{
//         OrderDate = startDate.AddDays(random.Next((endDate - startDate).Days)),
//         OrderStatus = paidStatus,
//         ShippingMethod = inStoreMethod,
//         CustomerTransferPicPath = "SomeWhereInAssets",
//         Discount = discount1,
//                 Branch = anousithDeliveryService.DeliveryBranches[0].Branch,

//         DeliveryService = anousithDeliveryService,
//         Staff = taStaff,
//         Customer = customer1,
//         BillItems = new List<BillItem>{
//             new BillItem{
//                 ShoeSize = shoeSizes[0],
//                 ProductCondition = brandNewCondition,
//                 Product = 
//             }
//         }
        
        

//     }

       

//         List<Plo> ecePlos = new List<Plo>
//         {
//             new Plo
//             {
//                 PloId = 1,
//                 PloNo = 1,
//                 Value = "Demonstrate a deep understanding of natural/applied science, mathematics, and fundamental engineering principles, and apply them effectively to real-world problems.",
//                 EloType = "Generic",
//                 BloomLevel = cognitiveUnderstandApplyBloom
//             },
//             new Plo
//             {
//                 PloId = 2,
//                 PloNo = 2,
//                 Value = "Evaluate and utilize modern engineering and IT tools effectively and efficiently, demonstrating critical thinking and adaptability.",
//                 EloType = "Generic",
//                 BloomLevel = cognitiveUnderstandAnalyzeBloom
//             },
            
//         };
        
//         _db.Plo.AddRange(ecePlos);
//         _db.SaveChanges();

//         Status pendingStatus = new Status
//         {
//             StatusId = 1,
//             StatusName = "pending"
//         };
//         // Add it in the Status table since we wont be needing this for this form1
//         _db.Status.AddRange(new List<Status> { pendingStatus, preApprovedStatus, approvedStatus, deniedStatus });


//         // For the CLOs and the related PLOs
//         Clo clo1 = new Clo
//         {
//             // ID as no for CLO, but for PLO we use no
//             CloId = 1,
//             CloValue = "Remembering the fundamental concepts of Boolean algebra and digital logic design.",
//             CloWithDepartments = new List<CloWithDepartment>{
//                 new CloWithDepartment{
//                     DepartmentAcronym = "ECE",
//                     CloWithPlos = new List<CloWithPlo>{
//                         new CloWithPlo{
//                             EmphasizeLevelId = 3,
//                             PloId = 1,
//                         },
//                         new CloWithPlo{
//                             EmphasizeLevelId = 1,
//                             PloId = 2,

                       
//                     }
//                 },
//                 new CloWithDepartment{
//                     DepartmentAcronym = "MCE-AI",
//                     CloWithPlos = new List<CloWithPlo>{
//                         new CloWithPlo{
//                             EmphasizeLevelId = 3,
//                             PloId = 9,
//                         },
//                         new CloWithPlo{
//                             EmphasizeLevelId = 1,
//                             PloId = 10,
//                         },
                   
//                 },
//             }
//         };
    


//         _db.Form.Add(form1);
//         _db.SaveChanges();

//         var result = _db.Form.ToList();
//         return Ok(result);

//     }
//         }}

//     #endregion

// }//ec
