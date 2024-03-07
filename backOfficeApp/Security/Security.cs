using Microsoft.AspNetCore.Identity;

public class AppRole : IdentityRole<int>
{

    public AppRole(string Name) : base(Name) { }

}

public class AppUser : IdentityUser<int>
{

    public string firstName { get; set; }
    public string lastName { get; set; }
    public string department { get; set; }

}
public class SignInModel
{
    public string email { get; set; }

    public string password { get; set; }
    public string returnUrl { get; set; }

}//ec     