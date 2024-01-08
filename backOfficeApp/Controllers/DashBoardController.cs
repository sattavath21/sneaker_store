using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;

public class DashBoardController : Controller
{
    private readonly ILogger<DashBoardController> _logger;
    private ProjectappDbContext _db;

    public DashBoardController(ILogger<DashBoardController> logger, ProjectappDbContext db)
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
