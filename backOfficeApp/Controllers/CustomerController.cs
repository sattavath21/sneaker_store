using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class CustomerController : Controller
{
    private readonly ILogger<CustomerController> _logger;
    private ProjectappDbContext _db;

    public CustomerController(ILogger<CustomerController> logger, ProjectappDbContext db)
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
    #endregion

}//ec
