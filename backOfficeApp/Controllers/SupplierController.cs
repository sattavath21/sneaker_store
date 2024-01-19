using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class SupplierController : Controller
{
    private readonly ILogger<SupplierController> _logger;
    private BackofficeappDbContext _db;

    public SupplierController(ILogger<SupplierController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }


    #region ACTIONS
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult AddSup()
    {
        return View();
    }
    #endregion

}//ec
