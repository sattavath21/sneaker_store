
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
public class SecurityController : Controller
{
    private readonly SignInManager<AppUser> _signInManager;
    private readonly UserManager<AppUser> _userManager;
    private readonly BackofficeappDbContext _db;
    private readonly ILogger<SecurityController> _msg;
    public SecurityController(
                ILogger<SecurityController> msg,
                 SignInManager<AppUser> signInManager,
                                        UserManager<AppUser> userManager,
                                        BackofficeappDbContext db)
    {
        _signInManager = signInManager;
        _userManager = userManager;
        _db = db;
        _msg = msg;
    }//ef
public IActionResult Login()
    {
        return View();
    }

    #region ACTIONS
    [HttpGet]
    public async Task<IActionResult> Login(string ReturnUrl)
    {

        await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);
        ViewBag.ReturnUrl = ReturnUrl;
        ViewBag.error = false;
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> Login([FromBody] SignInModel signin)
    {


        var user = await _signInManager.UserManager.FindByEmailAsync(signin.email);
        var result = await _signInManager.PasswordSignInAsync(user.UserName, signin.password, true, false);
        _msg.LogCritical(result.Succeeded.ToString());

        if (result.Succeeded)
        {
            if (signin.returnUrl != null)
            {

                return Ok(new
                {
                    code = 1,
                    path = signin.returnUrl,
                    msg = "yes"
                });
            }


        }
        return BadRequest(new
        {
            code = -1,
            msg = "no"
        });





    }//ef


    [HttpGet]
    public async Task<IActionResult> LogOut()
    {
        await _signInManager.SignOutAsync();
        return RedirectToAction("Index", "Home");

    }//ef
#endregion





}//ec
