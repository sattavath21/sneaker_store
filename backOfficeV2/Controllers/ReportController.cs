using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Authorize(Roles = "manager")]
public class ReportController : Controller
{
  private readonly ILogger<ReportController> _logger;

  public ReportController(ILogger<ReportController> logger)
  {
    _logger = logger;
  }
  public IActionResult Index()
  {
    return View();
  }
  #region ACTIONS

  #endregion

}//ec
