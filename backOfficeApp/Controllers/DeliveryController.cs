using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class DeliveryController : Controller
{
    private readonly ILogger<DeliveryController> _logger;
    private BackofficeappDbContext _db;

    public DeliveryController(ILogger<DeliveryController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db = db;
    }


    #region ACTIONS
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult AddDelivery()
    {
        return View();
    }
    #endregion

}//ec
