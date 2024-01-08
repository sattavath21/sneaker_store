using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class ProductController : Controller
{
    private readonly ILogger<ProductController> _logger;
    private ProjectappDbContext _db;

    public ProductController(ILogger<ProductController> logger, ProjectappDbContext db)
    {
        _logger = logger;
        _db =db;
    }
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult AddPro()
    {
        return View();
    }

    #region ACTIONS

    #endregion

}//ec
