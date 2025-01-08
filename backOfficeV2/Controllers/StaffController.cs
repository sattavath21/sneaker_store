using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Authorize(Roles = "admin, manager")]
public class StaffController : Controller
{
  private readonly ILogger<StaffController> _logger;

  public StaffController(ILogger<StaffController> logger)
  {
    _logger = logger;
  }
  public IActionResult Index()
  {
    _logger.LogInformation("Index action accessed.");
    return View();
  }
  
    public IActionResult AddStaf()
    {
        return View();
    }
  #region ACTIONS



  #endregion

}//ec
