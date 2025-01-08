using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Authorize]
public class OrderHistoryController : Controller
{
  private readonly ILogger<OrderHistoryController> _logger;

  public OrderHistoryController(ILogger<OrderHistoryController> logger)
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
