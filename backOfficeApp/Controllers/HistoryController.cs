using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class HistoryController : Controller
{
    private readonly ILogger<HistoryController> _logger;
    private BackofficeappDbContext _db;

    public HistoryController(ILogger<HistoryController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db =db;
    }
    public IActionResult Index()
    {
        return View();
    }

    #region ACTIONS

    #endregion

}//ec
