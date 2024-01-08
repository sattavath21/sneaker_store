using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/[action]")]
public class ApiController : ControllerBase
{
    private readonly ILogger<ApiController> _logger;
    private IWebHostEnvironment _host;
    private ProjectappDbContext _db;

    public ApiController(ILogger<ApiController> logger, ProjectappDbContext db, IWebHostEnvironment host)
    {
        _logger = logger;
        _db = db;
        _host = host;
    }


    #region ACTIONS
    [HttpPost]
    public IActionResult AddProduct(Product product)
    {
        _db.Product.Add(product);
        _db.SaveChanges();
        _logger.LogInformation("new product was saved");
        return Ok(product);
    }//ef

    [HttpGet]
    public IActionResult GetProduct()
    {
        var result = _db.Product
                    .Include(t => t.Supplier)
                    .ThenInclude(t => t.SupplierAddress)
                    .ToList();
        return Ok(result);
    }//ef

    [HttpPost]
    public IActionResult EditProduct(Product p)
    {
        //update product
        _db.Product.Update(p);
        _db.SaveChanges();
        return Ok(p);
    }//ef

    [HttpPost]
    public IActionResult DeleteProduct(CheckInItem c)
    {
        var checkInItemToDelete = _db.CheckInItem.Include(x => x.Checkin).FirstOrDefault(x => c.CheckinId == x.CheckinId);
        //delete customer


        if (checkInItemToDelete != null)
        {
            _db.CheckInItem.Remove(checkInItemToDelete);
            var checkinToDelete = _db.Checkin.FirstOrDefault(x => c.CheckinId == x.CheckinId);
            if (checkinToDelete != null)
            {
                _db.Checkin.Remove(checkinToDelete);
            }
            var productToDelete = _db.Product.FirstOrDefault(x => c.ProductId == x.ProductId);
            if (productToDelete != null)
            {
                _db.Product.Remove(productToDelete);
            }
            _db.SaveChanges();
        }
        return Ok(c);
    }//ef


    [HttpPost]
    public IActionResult AddSuppliers(Supplier s)
    {
        _db.Supplier.Add(s);
        _db.SaveChanges();
        return Ok(s);

    }//ef

    [HttpGet]
    public IActionResult GetSuppliers()
    {
        var list1 = _db.Supplier
                    .Include(t => t.SupplierAddress)
                    .ToList();
        return Ok(list1);
    }

    [HttpGet]
    public IActionResult GetProductInfor()
    {
        var list1 = _db.Productinfor.ToList();
        return Ok(list1);
    }

    [HttpPost]
    public IActionResult EditSupplier(Supplier c)
    {
        //update ingrdient 
        _db.Supplier.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult EditSupplierAddress(SupplierAddress c)
    {
        //update customer address 
        _db.SupplierAddress.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult AddSuppliersAddress(SupplierAddress s)
    {
        _db.SupplierAddress.Add(s);
        _db.SaveChanges();
        return Ok(s);

    }//ef

    [HttpGet]
    public IActionResult GetSupplierAddress()
    {
        var list1 = _db.SupplierAddress.ToList();
        return Ok(list1);
    }

    [HttpPost]
    public IActionResult DeleteSupplier(Supplier c)
    {
        var supplierToDelete = _db.Supplier.Include(x => x.SupplierAddress).FirstOrDefault(x => c.SupplierId == x.SupplierId);
        //delete customer

        if (supplierToDelete != null)
        {
            _db.Supplier.Remove(supplierToDelete);
            var addressToDelete = _db.SupplierAddress.FirstOrDefault(x => x.SupplierAddressId == c.SupplierAddressId);
            if (addressToDelete != null)
            {
                _db.SupplierAddress.Remove(addressToDelete);
            }
            _db.SaveChanges();
        }
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult DeleteSupplierAddress(SupplierAddress c)
    {
        var supplierToDelete = _db.Supplier.Include(x => x.SupplierAddress).FirstOrDefault(x => c.SupplierAddressId == x.SupplierAddressId);
        //delete customer

        if (supplierToDelete != null)
        {
            _db.Supplier.Remove(supplierToDelete);
            var addressToDelete = _db.SupplierAddress.FirstOrDefault(x => x.SupplierAddressId == c.SupplierAddressId);
            if (addressToDelete != null)
            {
                _db.SupplierAddress.Remove(addressToDelete);
            }
            _db.SaveChanges();
        }
        return Ok(c);
    }//ef



    [HttpPost]
    public IActionResult AddCustomer(Customer c)
    {
        _db.Customer.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpGet]
    public IActionResult GetCustomers()
    {
        var result = _db.Customer
                    .Include(t => t.CustomerAddress)
                    .ToList();
        return Ok(result);
    }//ef


    [HttpPost]
    public IActionResult EditCustomer(Customer c)
    {
        //update customer
        _db.Customer.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult EditCustomerAddress(CustomerAddress c)
    {
        //update customer address 
        _db.CustomerAddress.Update(c);
        _db.SaveChanges();
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult EditCheckInItem(CheckInItem p)
    {
        var Checkin = _db.Checkin.FirstOrDefault(x => x.CheckinId == p.CheckinId);
        Checkin.CheckInDate = DateTime.Now;
        _db.Checkin.Update(Checkin);
        //update ingrdient 
        _db.CheckInItem.Update(p);
        _db.SaveChanges();
        return Ok(p);
    }//ef

    [HttpPost]
    public IActionResult EditQtyProduct(CheckInItem p)
    {
        _db.CheckInItem.Update(p);
        _db.SaveChanges();
        return Ok(p);
    }//ef

    [HttpPost]
    public IActionResult DeleteCustomer(Customer c)
    {
        var customerToDelete = _db.Customer.Include(x => x.CustomerAddress).FirstOrDefault(x => c.CustomerId == x.CustomerId);
        //delete customer

        if (customerToDelete != null)
        {
            _db.Customer.Remove(customerToDelete);
            var addressToDelete = _db.CustomerAddress.FirstOrDefault(x => x.CustomerAddressId == c.CustomerAddressId);
            if (addressToDelete != null)
            {
                _db.CustomerAddress.Remove(addressToDelete);
            }
            _db.SaveChanges();
        }
        return Ok(c);
    }//ef

    [HttpPost]
    public IActionResult DeleteCustomerAddress(CustomerAddress c)
    {
        var customerToDelete = _db.Customer.Include(x => x.CustomerAddress).FirstOrDefault(x => c.CustomerAddressId == x.CustomerAddressId);
        //delete customer

        if (customerToDelete != null)
        {
            _db.Customer.Remove(customerToDelete);
            var addressToDelete = _db.CustomerAddress.FirstOrDefault(x => x.CustomerAddressId == c.CustomerAddressId);
            if (addressToDelete != null)
            {
                _db.CustomerAddress.Remove(addressToDelete);
            }
            _db.SaveChanges();
        }
        return Ok(c);
    }//ef


    [HttpPost]
    public IActionResult AddCusAddress(CustomerAddress c)
    {
        _db.CustomerAddress.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpGet]
    public IActionResult GetCusAddress()
    {
        var list1 = _db.CustomerAddress.ToList();
        return Ok(list1);
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
        var list1 = _db.Staff.ToList();
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
    public IActionResult AddDiscount(Discount c)
    {
        _db.Discount.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpGet]
    public IActionResult GetDiscount()
    {
        var list1 = _db.Discount.ToList();
        return Ok(list1);
    }

    [HttpPost]
    public IActionResult AddSaleItem(SaleItem c)
    {
        _db.SaleItem.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpGet]
    public IActionResult GetSaleItem()
    {
        var list1 = _db.SaleItem.ToList();
        return Ok(list1);
    }

    [HttpGet]
    public IActionResult GetCheckIn()
    {
        var list1 = _db.Checkin.ToList();
        return Ok(list1);
    }

    [HttpPost]
    public IActionResult AddSale(Sale c)
    {
        c.Date = DateTime.Now;
        var soldProduct = c.SaleItems.Select(x => x.ProductId).ToList();
        var checkInItemQty = _db.CheckInItem.Where(x => soldProduct.Contains(x.ProductId)).ToList();
        foreach (var item in checkInItemQty) {
            foreach (var solditem in c.SaleItems) {
                if (item.ProductId == solditem.ProductId) {
                    item.CheckInQty -= solditem.SaleQty;
                    break;
                }
            }
        }
        _db.CheckInItem.UpdateRange(checkInItemQty);
        _db.Sale.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpPost]
    public IActionResult AddCheckIn(Checkin c)
    {
        c.CheckInDate = DateTime.Now;
        _db.Checkin.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpPost]
    public IActionResult AddCheckInItem(CheckInItem c)
    {
        _db.CheckInItem.Add(c);
        _db.SaveChanges();
        return Ok(c);

    }//ef

    [HttpGet]
    public IActionResult GetCheckInItem()
    {
        var list1 = _db.CheckInItem
                    .Include(t => t.Product)
                    .ThenInclude(s => s.Supplier)
                    .Include(p => p.Checkin)
                    .ThenInclude(st => st.Staff)
                    .ToList();
        return Ok(list1);
    }

    [HttpGet]
    public IActionResult GetSale()
    {
        var list1 = _db.Sale
        .Select(x => new
        {
            x.Date,
            total = x.SaleItems.Sum(x => (x.Product.ProductPrice * x.SaleQty) - x.Discount.DiscountPercentage)
        })
        .ToList();
        return Ok(list1);
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
        .Select(x => new
        {
            productId = x.ProductId,
            productName = x.ProductName,
            productDescription = x.ProductDescription,
            productCost = x.ProductCost,
            productPrice = x.ProductPrice,
            productMake = x.ProductMake,
            productType = x.ProductType,
            productUnit = x.ProductUnit,
            productModelno = x.ProductModelno,
            productBarcode = x.Barcode,
            qty = 1

        }).FirstOrDefault(x => x.productBarcode == barcode);
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
    }//ef

    [HttpGet]
    public IActionResult ProductByBarcode(string barcode)
    {
        var result = _db.CheckInItem
        .Select(x => new
        {
            checkInItemId = x.CheckInItemId,
            productId = x.ProductId,
            checkinId = x.CheckinId,
            checkinDate = x.Checkin.CheckInDate,
            checkinCredit = x.Checkin.CreditTerm,
            productName = x.Product.ProductName,
            checkInQty = x.CheckInQty,
            productCost = x.Product.ProductCost,
            productPrice = x.Product.ProductPrice,
            productMake = x.Product.ProductMake,
            productType = x.Product.ProductType,
            productUnit = x.Product.ProductUnit,
            productBarcode = x.Product.Barcode

        }).FirstOrDefault(x => x.productBarcode == barcode);
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
    }//ef

    [HttpGet]
    public IActionResult Report1()
    {
        var sales = _db.SaleItem
                        .Include(x => x.Product)
                        .GroupBy(x => x.Product.ProductType)
                        .Select(g => new
                        {
                            name = g.Key,
                            sale = g.Sum(s => s.Product.ProductPrice * s.SaleQty),
                        })
                        .ToList();


        return Ok(sales);
    }//ef

    [HttpGet]
    public IActionResult Report2()
    {
        var sales = _db.SaleItem
                        .Include(x => x.Product)
                        .GroupBy(x => x.Product.ProductName)
                        .Select(g => new
                        {
                            name = g.Key,
                            saleQty = g.Sum(s => s.SaleQty),
                        })
                        .ToList();


        return Ok(sales);
    }//ef

    [HttpGet]
    public IActionResult Report3()
    {
        var saleItemtThisMonth = _db.Sale
        .Include(x => x.SaleItems)
        .ThenInclude(x=> x.Product)
        .Where(x => x.Date.Month == DateTime.Now.Month && x.Date.Year == DateTime.Now.Year)
        .SelectMany(x => x.SaleItems)
        .ToList();
        var sales = saleItemtThisMonth
                        .GroupBy(x => x.Product.ProductName)
                        .Select(g => new
                        {
                            name = g.Key,
                            sale = g.Sum(s => s.Product.ProductPrice * s.SaleQty)
                        })
                        .ToList();


        return Ok(sales);
    }//ef

    [HttpGet]
    public IActionResult Report4()
    {
        var sales = _db.SaleItem
                        .Include(p => p.Sale)
                        .ThenInclude(st => st.Customer)
                        .GroupBy(x => x.Sale.Customer.FirstName)
                        .Select(g => new
                        {
                            name = g.Key,
                            sale = g.Sum(s => s.Product.ProductPrice * s.SaleQty),
                        })
                        .ToList();


        return Ok(sales);
    }//ef


    [HttpGet]
    public IActionResult SaleItems()
    {
        var result = _db.SaleItem
                     .Include(x => x.Product)
                     .Select(x => new
                     {
                         x.Product.ProductName,
                         x.Product.ProductPrice,
                         x.Product.ProductType,
                         x.SaleQty
                     })
                     .ToList();
        return Ok(result);
    }

    #endregion
}