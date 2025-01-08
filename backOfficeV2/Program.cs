using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

using System.Text.Json.Serialization;
using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.Extensions.FileProviders;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

//swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

#region json text serialization
builder.Services
        .AddControllersWithViews()
        .AddJsonOptions(x =>
                x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);

#endregion

#region register identity

builder.Services.AddIdentity<AppUser, AppRole>()
             .AddEntityFrameworkStores<Backofficev2DbContext>()
             .AddDefaultTokenProviders()
             .AddDefaultUI();


builder.Services.Configure<IdentityOptions>(options =>
            {
                options.User.RequireUniqueEmail = false;
                options.Password.RequireDigit = true;
                options.Password.RequireLowercase = false;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireUppercase = false;
                options.Password.RequiredLength = 4;
                options.Password.RequiredUniqueChars = 1;

                // Lockout settings.
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
                options.Lockout.MaxFailedAccessAttempts = 5;
                options.Lockout.AllowedForNewUsers = true;

                // User settings.
                options.User.AllowedUserNameCharacters =
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";

            });

builder.Services.ConfigureApplicationCookie(options =>
            {
                options.AccessDeniedPath = "/Identity/Account/AccessDenied";
                options.Cookie.Name = "YourAppCookieName";
                options.Cookie.HttpOnly = true;
                options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
                //options.LoginPath = "/Identity/Account/Login";
                options.LoginPath = "/Security/Login";

                // ReturnUrlParameter requires 
                //using Microsoft.AspNetCore.Authentication.Cookies;
                options.ReturnUrlParameter = CookieAuthenticationDefaults.ReturnUrlParameter;
                options.SlidingExpiration = true;
            });


#endregion

#region mysql for dbcontext
builder.Services.AddDbContextPool<Backofficev2DbContext>(
    dbContextOptions => dbContextOptions
        .UseMySql(
            builder.Configuration.GetConnectionString("MySQLConnection"),
            new MySqlServerVersion(new Version(8, 0, 29))
        //,
        //mySqlOptions => mySqlOptions.CharSetBehavior(CharSetBehavior.NeverAppend)
        )
    //.LogTo(Console.WriteLine, LogLevel.Information)
    //.EanbleSensitiveDataLogging()
    //.EnableDetailedErrors()
    );

var  MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

#endregion

#region dink2pdf    
builder.Services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));
#endregion

//pdf service 
builder.Services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));

// Use lowercase in url
builder.Services.AddRouting(options => options.LowercaseUrls = true);

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseStaticFiles(new StaticFileOptions() { FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), @"asset")), RequestPath = new PathString("/asset") });


app.UseCors(MyAllowSpecificOrigins);

app.UseRouting();



app.UseAuthentication();    // Call authentication always before authorization
app.UseAuthorization();

app.Use(async (context, next) =>
{
    if (context.Request.Path == "/")
    {
        context.Response.Redirect("/Security/Login");
        return;
    }
    await next();
});


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Cart}/{action=Index}/{id?}");


#region seed user data
using (var serviceScope = app.Services.CreateScope())
{

    var provider = serviceScope.ServiceProvider;
    var _db = provider.GetRequiredService<Backofficev2DbContext>();
    try
    {
        _db.Database.Migrate();
        var _userManager = provider.GetRequiredService<UserManager<AppUser>>();
        var _roleManager = provider.GetRequiredService<RoleManager<AppRole>>();
        await SeedUserAccount.go(_userManager, _roleManager);
    }
    catch (Exception ex)
    {

        Console.WriteLine("seeding error {0}", ex.Message);

    }
}
#endregion

app.Run();
