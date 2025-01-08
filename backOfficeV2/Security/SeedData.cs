
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Microsoft.Extensions.Logging;
using System;


public class SeedUserAccount
{
    public static async Task go(UserManager<AppUser> _userManager,
                           RoleManager<AppRole> _roleManager)
    {

        //create role here
        if (!await _roleManager.RoleExistsAsync("manager"))
        {
            await _roleManager.CreateAsync(new AppRole("manager"));
        }
        if (!await _roleManager.RoleExistsAsync("admin"))
        {
            await _roleManager.CreateAsync(new AppRole("admin"));
        }
        if (!await _roleManager.RoleExistsAsync("user"))
        {
            await _roleManager.CreateAsync(new AppRole("user"));
        }
        var jameUser = new AppUser
        {
            UserName = "jy@hotmail.com",
            Email = "jy@hotmail.com",
            firstName = "JY",
            lastName = "Yodsaphon"
        };
        var taUser = new AppUser
        {
            UserName = "ta@hotmail.com",
            Email = "ta@hotmail.com",
            firstName = "Ta",
            lastName = "Xayyadeth"
        };
        var muayUser = new AppUser
        {
            UserName = "muay@hotmail.com",
            Email = "muay@hotmail.com",
            firstName = "Rmuay",
            lastName = "Arisara"
        };

        //query exisiting user
        if (_userManager.Users.All(u => u.UserName != jameUser.UserName))
        {
            await _userManager.CreateAsync(jameUser, "1234");
            Console.WriteLine("root account has been created.");
        }

        if (_userManager.Users.All(u => u.UserName != taUser.UserName))
        {
            await _userManager.CreateAsync(taUser, "1234");
            Console.WriteLine("taUser account has been created.");
        }

        if (_userManager.Users.All(u => u.UserName != muayUser.UserName))
        {
            await _userManager.CreateAsync(muayUser, "1234");
            Console.WriteLine("taUser account has been created.");
        }

        jameUser = await _userManager.FindByEmailAsync("jy@hotmail.com");
        taUser = await _userManager.FindByEmailAsync("ta@hotmail.com");
        muayUser = await _userManager.FindByEmailAsync("muay@hotmail.com");


        //insert role for super user  
        if (!await _userManager.IsInRoleAsync(jameUser, "manager"))
        {
            await _userManager.AddToRoleAsync(jameUser, "manager");
            Console.WriteLine("apply manager role to root");
        }
        else
        {
            Console.WriteLine("admin user  exist");
        }
        //inser role for taUser
        if (!await _userManager.IsInRoleAsync(taUser, "admin"))
        {
            await _userManager.AddToRoleAsync(taUser, "admin");
            Console.WriteLine("apply admin role to taUser");
        }
        else
        {
            Console.WriteLine("taUser exist");
        }
if (!await _userManager.IsInRoleAsync(muayUser, "user"))
        {
            await _userManager.AddToRoleAsync(muayUser, "user");
            Console.WriteLine("apply user role to muayUser");
        }
        else
        {
            Console.WriteLine("muayUser exist");
        }





    }//ef
}//ec
