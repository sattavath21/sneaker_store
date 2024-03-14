using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Authorize]

public class ReportController : Controller
{
    private readonly ILogger<ReportController> _logger;
    private BackofficeappDbContext _db;

    public ReportController(ILogger<ReportController> logger, BackofficeappDbContext db)
    {
        _logger = logger;
        _db =db;
    }
    [HttpGet]
    [Authorize(Roles = "admin")]
    public IActionResult Index()
    {
        return View();
    }
    #region ACTIONS

    #endregion

}//ec