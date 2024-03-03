using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class DiscountController : Controller
{
    private readonly ILogger<DiscountController> _logger;
    private BackofficeappDbContext _db;

    public DiscountController(ILogger<DiscountController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }


    #region ACTIONS
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult AddDis()
    {
        return View();
    }
    #endregion

}//ec
