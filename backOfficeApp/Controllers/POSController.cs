using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class POSController : Controller
{
    private readonly ILogger<POSController> _logger;
    private ProjectappDbContext _db;

    public POSController(ILogger<POSController> logger, ProjectappDbContext db)
    {
        _logger = logger;
        _db = db;
    }
    public IActionResult Index()
    {
        return View();
    }
    #region ACTIONS

    #endregion

}//ec
