using Microsoft.AspNetCore.Mvc;


public class TestingController : Controller
{
  private readonly ILogger<TestingController> _logger;

  public TestingController(ILogger<TestingController> logger)
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
