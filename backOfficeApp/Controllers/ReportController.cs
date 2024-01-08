using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Authorize]

public class ReportController : Controller
{
    private readonly ILogger<ReportController> _logger;
    private ProjectappDbContext _db;

    public ReportController(ILogger<ReportController> logger, ProjectappDbContext db)
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