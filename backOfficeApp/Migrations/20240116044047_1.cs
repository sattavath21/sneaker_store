using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Address",
                columns: table => new
                {
                    AddressId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    SellerName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    SellerTelNumber = table.Column<int>(type: "int", nullable: false),
                    Province = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    City = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Village = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    AddressDetail = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PostCode = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Address", x => x.AddressId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    NormalizedName = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ConcurrencyStamp = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    firstName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    lastName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    department = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    UserName = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    NormalizedUserName = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Email = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    NormalizedEmail = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    EmailConfirmed = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    PasswordHash = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    SecurityStamp = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ConcurrencyStamp = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PhoneNumber = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    PhoneNumberConfirmed = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetime(6)", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Bank",
                columns: table => new
                {
                    BankId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BankName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bank", x => x.BankId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BranchAddress",
                columns: table => new
                {
                    BranchAddressId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Province = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    City = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Village = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    AddressDetail = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BranchAddress", x => x.BranchAddressId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Brand",
                columns: table => new
                {
                    BrandId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BrandName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BrandLogo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Brand", x => x.BrandId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Customer",
                columns: table => new
                {
                    CustomerId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    FirstName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    LastName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Age = table.Column<int>(type: "int", nullable: false),
                    Birthday = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    Email = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    VacationMode = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    EmailSubscription = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    DefaultAddress = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customer", x => x.CustomerId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DeliveryService",
                columns: table => new
                {
                    DeliveryServiceId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    DeliveryCompanyName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DeliveryService", x => x.DeliveryServiceId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "OrderStatus",
                columns: table => new
                {
                    OrderStatusId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    StatusName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderStatus", x => x.OrderStatusId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ProductCat",
                columns: table => new
                {
                    ProductCatId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CatName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCat", x => x.ProductCatId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ProductCondition",
                columns: table => new
                {
                    ProductConditionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ConditionName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCondition", x => x.ProductConditionId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ShippingMethod",
                columns: table => new
                {
                    ShippingMethodId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    MethodName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShippingMethod", x => x.ShippingMethodId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ShoeSize",
                columns: table => new
                {
                    ShoeSizeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    SizeType = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    SizeNumber = table.Column<double>(type: "double", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShoeSize", x => x.ShoeSizeId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "StoreBranch",
                columns: table => new
                {
                    StoreBranchId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Province = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StoreBranch", x => x.StoreBranchId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    ClaimType = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ClaimValue = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    ClaimType = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ClaimValue = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProviderKey = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProviderDisplayName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false),
                    RoleId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false),
                    LoginProvider = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Name = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Value = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ProductCollection",
                columns: table => new
                {
                    ProductCollectionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CollectionName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BrandId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCollection", x => x.ProductCollectionId);
                    table.ForeignKey(
                        name: "FK_ProductCollection_Brand_BrandId",
                        column: x => x.BrandId,
                        principalTable: "Brand",
                        principalColumn: "BrandId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "CustomerAddress",
                columns: table => new
                {
                    CustomerAddressId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    AddressId = table.Column<int>(type: "int", nullable: false),
                    CustomerId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerAddress", x => x.CustomerAddressId);
                    table.ForeignKey(
                        name: "FK_CustomerAddress_Address_AddressId",
                        column: x => x.AddressId,
                        principalTable: "Address",
                        principalColumn: "AddressId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CustomerAddress_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "CustomerId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "CustomerBankAccount",
                columns: table => new
                {
                    CustomerBankAccountId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BankId = table.Column<int>(type: "int", nullable: false),
                    AccountName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    AccountNumber = table.Column<int>(type: "int", nullable: false),
                    AccountQr = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CustomerId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerBankAccount", x => x.CustomerBankAccountId);
                    table.ForeignKey(
                        name: "FK_CustomerBankAccount_Bank_BankId",
                        column: x => x.BankId,
                        principalTable: "Bank",
                        principalColumn: "BankId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CustomerBankAccount_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "CustomerId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DeliveryBranch",
                columns: table => new
                {
                    DeliveryBranchId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    DeliveryServiceId = table.Column<int>(type: "int", nullable: false),
                    BranchName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchAvailability = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BranchAddressId = table.Column<int>(type: "int", nullable: false),
                    BranchGooglemapPosition = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DeliveryBranch", x => x.DeliveryBranchId);
                    table.ForeignKey(
                        name: "FK_DeliveryBranch_BranchAddress_BranchAddressId",
                        column: x => x.BranchAddressId,
                        principalTable: "BranchAddress",
                        principalColumn: "BranchAddressId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_DeliveryBranch_DeliveryService_DeliveryServiceId",
                        column: x => x.DeliveryServiceId,
                        principalTable: "DeliveryService",
                        principalColumn: "DeliveryServiceId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Discount",
                columns: table => new
                {
                    DiscountId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    MinSpend = table.Column<int>(type: "int", nullable: false),
                    Start = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    Duration = table.Column<int>(type: "int", nullable: false),
                    Amount = table.Column<int>(type: "int", nullable: false),
                    ShippingMethodId = table.Column<int>(type: "int", nullable: false),
                    Description = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Discount", x => x.DiscountId);
                    table.ForeignKey(
                        name: "FK_Discount_ShippingMethod_ShippingMethodId",
                        column: x => x.ShippingMethodId,
                        principalTable: "ShippingMethod",
                        principalColumn: "ShippingMethodId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    ProductId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    StorePrice = table.Column<int>(type: "int", nullable: false),
                    LowestSellingPrice = table.Column<int>(type: "int", nullable: false),
                    Sku = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Colorway = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ReleaseDate = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    AmountSold = table.Column<int>(type: "int", nullable: false),
                    ProductCollectionId = table.Column<int>(type: "int", nullable: false),
                    ProductCatId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.ProductId);
                    table.ForeignKey(
                        name: "FK_Product_ProductCat_ProductCatId",
                        column: x => x.ProductCatId,
                        principalTable: "ProductCat",
                        principalColumn: "ProductCatId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Product_ProductCollection_ProductCollectionId",
                        column: x => x.ProductCollectionId,
                        principalTable: "ProductCollection",
                        principalColumn: "ProductCollectionId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BranchTelNumber",
                columns: table => new
                {
                    BranchTelNumberId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    TelNumber = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DeliveryBranchId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BranchTelNumber", x => x.BranchTelNumberId);
                    table.ForeignKey(
                        name: "FK_BranchTelNumber_DeliveryBranch_DeliveryBranchId",
                        column: x => x.DeliveryBranchId,
                        principalTable: "DeliveryBranch",
                        principalColumn: "DeliveryBranchId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Bill",
                columns: table => new
                {
                    BillId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    OrderDate = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    StatusDate = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    OrderStatusId = table.Column<int>(type: "int", nullable: false),
                    DiscountId = table.Column<int>(type: "int", nullable: false),
                    StoreBranchId = table.Column<int>(type: "int", nullable: false),
                    CustomerId = table.Column<int>(type: "int", nullable: false),
                    DeliveryBranchId = table.Column<int>(type: "int", nullable: false),
                    ShippingMethodId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bill", x => x.BillId);
                    table.ForeignKey(
                        name: "FK_Bill_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "CustomerId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Bill_DeliveryBranch_DeliveryBranchId",
                        column: x => x.DeliveryBranchId,
                        principalTable: "DeliveryBranch",
                        principalColumn: "DeliveryBranchId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Bill_Discount_DiscountId",
                        column: x => x.DiscountId,
                        principalTable: "Discount",
                        principalColumn: "DiscountId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Bill_OrderStatus_OrderStatusId",
                        column: x => x.OrderStatusId,
                        principalTable: "OrderStatus",
                        principalColumn: "OrderStatusId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Bill_ShippingMethod_ShippingMethodId",
                        column: x => x.ShippingMethodId,
                        principalTable: "ShippingMethod",
                        principalColumn: "ShippingMethodId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Bill_StoreBranch_StoreBranchId",
                        column: x => x.StoreBranchId,
                        principalTable: "StoreBranch",
                        principalColumn: "StoreBranchId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "CustomerWishlist",
                columns: table => new
                {
                    CustomerWishlistId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ShoeSizeId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    CustomerId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerWishlist", x => x.CustomerWishlistId);
                    table.ForeignKey(
                        name: "FK_CustomerWishlist_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "CustomerId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CustomerWishlist_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CustomerWishlist_ShoeSize_ShoeSizeId",
                        column: x => x.ShoeSizeId,
                        principalTable: "ShoeSize",
                        principalColumn: "ShoeSizeId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ProductImage",
                columns: table => new
                {
                    ProductImageId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ProductImageUrl = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProductId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductImage", x => x.ProductImageId);
                    table.ForeignKey(
                        name: "FK_ProductImage_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ProductSelling",
                columns: table => new
                {
                    ProductSellingId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ProductLiveDate = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    OrderStatusId = table.Column<int>(type: "int", nullable: false),
                    CustomerPlacedPrice = table.Column<int>(type: "int", nullable: false),
                    Qty = table.Column<int>(type: "int", nullable: false),
                    ShoeSizeId = table.Column<int>(type: "int", nullable: false),
                    ProductConditionId = table.Column<int>(type: "int", nullable: false),
                    ProductDefect = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    BoxDefect = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    CustomerId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductSelling", x => x.ProductSellingId);
                    table.ForeignKey(
                        name: "FK_ProductSelling_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "CustomerId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductSelling_OrderStatus_OrderStatusId",
                        column: x => x.OrderStatusId,
                        principalTable: "OrderStatus",
                        principalColumn: "OrderStatusId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductSelling_ProductCondition_ProductConditionId",
                        column: x => x.ProductConditionId,
                        principalTable: "ProductCondition",
                        principalColumn: "ProductConditionId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductSelling_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductSelling_ShoeSize_ShoeSizeId",
                        column: x => x.ShoeSizeId,
                        principalTable: "ShoeSize",
                        principalColumn: "ShoeSizeId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ProductWithSize",
                columns: table => new
                {
                    ProductWithSizeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    InventoryQty = table.Column<int>(type: "int", nullable: false),
                    ShoeSizeId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductWithSize", x => x.ProductWithSizeId);
                    table.ForeignKey(
                        name: "FK_ProductWithSize_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductWithSize_ShoeSize_ShoeSizeId",
                        column: x => x.ShoeSizeId,
                        principalTable: "ShoeSize",
                        principalColumn: "ShoeSizeId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BillItem",
                columns: table => new
                {
                    BillItemId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Qty = table.Column<int>(type: "int", nullable: false),
                    ShoeSizeId = table.Column<int>(type: "int", nullable: false),
                    ProductConditionId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    BillId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BillItem", x => x.BillItemId);
                    table.ForeignKey(
                        name: "FK_BillItem_Bill_BillId",
                        column: x => x.BillId,
                        principalTable: "Bill",
                        principalColumn: "BillId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BillItem_ProductCondition_ProductConditionId",
                        column: x => x.ProductConditionId,
                        principalTable: "ProductCondition",
                        principalColumn: "ProductConditionId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BillItem_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BillItem_ShoeSize_ShoeSizeId",
                        column: x => x.ShoeSizeId,
                        principalTable: "ShoeSize",
                        principalColumn: "ShoeSizeId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DeliveryReceiptPic",
                columns: table => new
                {
                    DeliveryReceiptPicId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    PicString = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    BillId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DeliveryReceiptPic", x => x.DeliveryReceiptPicId);
                    table.ForeignKey(
                        name: "FK_DeliveryReceiptPic_Bill_BillId",
                        column: x => x.BillId,
                        principalTable: "Bill",
                        principalColumn: "BillId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "CustomerDefectImage",
                columns: table => new
                {
                    CustomerDefectImageId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    DefectImage = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProductSellingId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerDefectImage", x => x.CustomerDefectImageId);
                    table.ForeignKey(
                        name: "FK_CustomerDefectImage_ProductSelling_ProductSellingId",
                        column: x => x.ProductSellingId,
                        principalTable: "ProductSelling",
                        principalColumn: "ProductSellingId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "CustomerProductImage",
                columns: table => new
                {
                    CustomerProductImageId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ProductImage = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProductSellingId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerProductImage", x => x.CustomerProductImageId);
                    table.ForeignKey(
                        name: "FK_CustomerProductImage_ProductSelling_ProductSellingId",
                        column: x => x.ProductSellingId,
                        principalTable: "ProductSelling",
                        principalColumn: "ProductSellingId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Bill_CustomerId",
                table: "Bill",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_DeliveryBranchId",
                table: "Bill",
                column: "DeliveryBranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_DiscountId",
                table: "Bill",
                column: "DiscountId");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_OrderStatusId",
                table: "Bill",
                column: "OrderStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_ShippingMethodId",
                table: "Bill",
                column: "ShippingMethodId");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_StoreBranchId",
                table: "Bill",
                column: "StoreBranchId");

            migrationBuilder.CreateIndex(
                name: "IX_BillItem_BillId",
                table: "BillItem",
                column: "BillId");

            migrationBuilder.CreateIndex(
                name: "IX_BillItem_ProductConditionId",
                table: "BillItem",
                column: "ProductConditionId");

            migrationBuilder.CreateIndex(
                name: "IX_BillItem_ProductId",
                table: "BillItem",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_BillItem_ShoeSizeId",
                table: "BillItem",
                column: "ShoeSizeId");

            migrationBuilder.CreateIndex(
                name: "IX_BranchTelNumber_DeliveryBranchId",
                table: "BranchTelNumber",
                column: "DeliveryBranchId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerAddress_AddressId",
                table: "CustomerAddress",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerAddress_CustomerId",
                table: "CustomerAddress",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerBankAccount_BankId",
                table: "CustomerBankAccount",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerBankAccount_CustomerId",
                table: "CustomerBankAccount",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerDefectImage_ProductSellingId",
                table: "CustomerDefectImage",
                column: "ProductSellingId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerProductImage_ProductSellingId",
                table: "CustomerProductImage",
                column: "ProductSellingId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerWishlist_CustomerId",
                table: "CustomerWishlist",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerWishlist_ProductId",
                table: "CustomerWishlist",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_CustomerWishlist_ShoeSizeId",
                table: "CustomerWishlist",
                column: "ShoeSizeId");

            migrationBuilder.CreateIndex(
                name: "IX_DeliveryBranch_BranchAddressId",
                table: "DeliveryBranch",
                column: "BranchAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_DeliveryBranch_DeliveryServiceId",
                table: "DeliveryBranch",
                column: "DeliveryServiceId");

            migrationBuilder.CreateIndex(
                name: "IX_DeliveryReceiptPic_BillId",
                table: "DeliveryReceiptPic",
                column: "BillId");

            migrationBuilder.CreateIndex(
                name: "IX_Discount_ShippingMethodId",
                table: "Discount",
                column: "ShippingMethodId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductCatId",
                table: "Product",
                column: "ProductCatId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductCollectionId",
                table: "Product",
                column: "ProductCollectionId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductCollection_BrandId",
                table: "ProductCollection",
                column: "BrandId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductImage_ProductId",
                table: "ProductImage",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductSelling_CustomerId",
                table: "ProductSelling",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductSelling_OrderStatusId",
                table: "ProductSelling",
                column: "OrderStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductSelling_ProductConditionId",
                table: "ProductSelling",
                column: "ProductConditionId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductSelling_ProductId",
                table: "ProductSelling",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductSelling_ShoeSizeId",
                table: "ProductSelling",
                column: "ShoeSizeId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductWithSize_ProductId",
                table: "ProductWithSize",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductWithSize_ShoeSizeId",
                table: "ProductWithSize",
                column: "ShoeSizeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "BillItem");

            migrationBuilder.DropTable(
                name: "BranchTelNumber");

            migrationBuilder.DropTable(
                name: "CustomerAddress");

            migrationBuilder.DropTable(
                name: "CustomerBankAccount");

            migrationBuilder.DropTable(
                name: "CustomerDefectImage");

            migrationBuilder.DropTable(
                name: "CustomerProductImage");

            migrationBuilder.DropTable(
                name: "CustomerWishlist");

            migrationBuilder.DropTable(
                name: "DeliveryReceiptPic");

            migrationBuilder.DropTable(
                name: "ProductImage");

            migrationBuilder.DropTable(
                name: "ProductWithSize");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Address");

            migrationBuilder.DropTable(
                name: "Bank");

            migrationBuilder.DropTable(
                name: "ProductSelling");

            migrationBuilder.DropTable(
                name: "Bill");

            migrationBuilder.DropTable(
                name: "ProductCondition");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "ShoeSize");

            migrationBuilder.DropTable(
                name: "Customer");

            migrationBuilder.DropTable(
                name: "DeliveryBranch");

            migrationBuilder.DropTable(
                name: "Discount");

            migrationBuilder.DropTable(
                name: "OrderStatus");

            migrationBuilder.DropTable(
                name: "StoreBranch");

            migrationBuilder.DropTable(
                name: "ProductCat");

            migrationBuilder.DropTable(
                name: "ProductCollection");

            migrationBuilder.DropTable(
                name: "BranchAddress");

            migrationBuilder.DropTable(
                name: "DeliveryService");

            migrationBuilder.DropTable(
                name: "ShippingMethod");

            migrationBuilder.DropTable(
                name: "Brand");
        }
    }
}
