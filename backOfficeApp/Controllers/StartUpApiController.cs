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

//     ShippingMethod inStoreMethod = new ShippingMethod{
//         ShippingMethodId = 0,
//         MethodName = "In-store",
        
//     };

//      ShippingMethod deliveryMethod = new ShippingMethod{
//         ShippingMethodId = 1,
//         MethodName = "Delivery",
        
//     };

   
//         // Define the start and end dates of your range
//         DateTime startDate = new DateTime(2023, 12, 1);
//         DateTime endDate = new DateTime(2024, 12, 31);
//         Random random = new Random();

//     Discount discount1 = new Discount{
//             DiscountId = 0,
//             MinSpend = 500,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Valentime Discount"
//         };

//           Discount discount2 = new Discount{
//             DiscountId = 0,
//             MinSpend = 500,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Christmas Discount"
//         };

//           Discount discount3 = new Discount{
//             DiscountId = 0,
//             MinSpend = 500,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Valentime Discount"
//         };

//           Discount discount4 = new Discount{
//             DiscountId = 0,
//             MinSpend = 500,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Valentime Discount"
//         };

//           Discount discount5 = new Discount{
//             DiscountId = 0,
//             MinSpend = 500,
//             Start = startDate.AddDays(random.Next((endDate - startDate).Days)),
//             Duration = 30,
//             Amount = 10,
//             ShippingMethod = inStoreMethod,
//             Description = "Valentime Discount"
//         };


//     Bill bill = new Bill{
//         OrderDate = startDate.AddDays(random.Next((endDate - startDate).Days)),
//         OrderStatus = paidStatus,
//         ShippingMethod = inStoreMethod,
//         CustomerTransferPicPath = "SomeWhereInAssets",
//         Discount
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
