using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Authorize]
public class InventoryController : Controller
{
    private readonly ILogger<InventoryController> _logger;

    public InventoryController(ILogger<InventoryController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index(){
        return View();
    }
    
    public IActionResult AddPro(){
        return View();
    }
    #region ACTIONS
    
    #endregion

}//ec
