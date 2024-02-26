using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class TestingController : Controller
{
    private readonly ILogger<TestingController> _logger;
    private BackofficeappDbContext _db;

    public TestingController(ILogger<TestingController> logger,BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }
    public IActionResult Index(){
        return View();
    }
    #region ACTIONS
    
    #endregion

}//ec
