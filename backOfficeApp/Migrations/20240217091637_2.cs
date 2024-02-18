using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DeliveryBranch_BranchAddress_BranchAddressId",
                table: "DeliveryBranch");

            migrationBuilder.DropTable(
                name: "BranchAddress");

            migrationBuilder.DropIndex(
                name: "IX_DeliveryBranch_BranchAddressId",
                table: "DeliveryBranch");

            migrationBuilder.DropColumn(
                name: "BranchAddressId",
                table: "DeliveryBranch");

            migrationBuilder.DropColumn(
                name: "BranchAvailability",
                table: "DeliveryBranch");

            migrationBuilder.DropColumn(
                name: "BranchGooglemapPosition",
                table: "DeliveryBranch");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BranchAddressId",
                table: "DeliveryBranch",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "BranchAvailability",
                table: "DeliveryBranch",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "BranchGooglemapPosition",
                table: "DeliveryBranch",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BranchAddress",
                columns: table => new
                {
                    BranchAddressId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    AddressDetail = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    City = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Province = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Village = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BranchAddress", x => x.BranchAddressId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_DeliveryBranch_BranchAddressId",
                table: "DeliveryBranch",
                column: "BranchAddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_DeliveryBranch_BranchAddress_BranchAddressId",
                table: "DeliveryBranch",
                column: "BranchAddressId",
                principalTable: "BranchAddress",
                principalColumn: "BranchAddressId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
