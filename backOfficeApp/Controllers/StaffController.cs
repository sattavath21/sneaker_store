using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class StaffController : Controller
{
    private readonly ILogger<StaffController> _logger;
    private ProjectappDbContext _db;

    public StaffController(ILogger<StaffController> logger,ProjectappDbContext db)
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
