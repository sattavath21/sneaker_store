
using System.Security.Claims;
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
        return RedirectToAction("Index", "POS");

    }//ef

   [HttpGet]
public async Task<IActionResult> GetUserRole()
{
    try
    {
        // Retrieve the current user's ID
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (userId == null)
        {
            return NotFound(new { error = "User not found" });
        }

        // Retrieve the user from UserManager
        var user = await _userManager.FindByIdAsync(userId);

        if (user == null)
        {
            return NotFound(new { error = "User not found" });
        }

        // Retrieve user roles
        var userRoles = await _userManager.GetRolesAsync(user);

        // If the user has no roles, return a 404 status code
        if (userRoles == null || !userRoles.Any())
        {
            return NotFound(new { error = "User has no roles" });
        }

        // Return the first role (assuming a user has only one role)
        return Ok(new { role = userRoles.First() });
    }
    catch (Exception ex)
    {
        // Log the exception for debugging purposes
        _msg.LogError(ex, "Error in GetUserRole");

        // Return an internal server error
        return StatusCode(500, "Internal Server Error");
    }
}


#endregion





}//ec
