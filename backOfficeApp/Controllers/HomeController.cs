using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using backOfficeApp.Models;

namespace backOfficeApp.Controllers;

public class HommeController : Controller
{
    private readonly ILogger<HommeController> _logger;

    public HommeController(ILogger<HommeController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Privacy()
    {
        return View();
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

}//ec
