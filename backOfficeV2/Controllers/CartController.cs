using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Authorize]
public class CartController : Controller
{
  private readonly ILogger<CartController> _logger;

  public CartController(ILogger<CartController> logger)
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
