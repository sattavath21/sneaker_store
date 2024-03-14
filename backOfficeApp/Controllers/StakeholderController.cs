using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class StakeholderController : Controller
{
    private readonly ILogger<StakeholderController> _logger;
    private BackofficeappDbContext _db;

    public StakeholderController(ILogger<StakeholderController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }


    #region ACTIONS
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult AddCus()
    {
        return View();
    }
 [HttpGet]
    [Authorize(Roles = "admin, manager")]
    public IActionResult AddStaf()
    {
        return View();
    }
    
    #endregion

}//ec
