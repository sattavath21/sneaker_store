using Microsoft.AspNetCore.Mvc;


public class DashboardController : Controller
{
  private readonly ILogger<DashboardController> _logger;

  public DashboardController(ILogger<DashboardController> logger)
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
